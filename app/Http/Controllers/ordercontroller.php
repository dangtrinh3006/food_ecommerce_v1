<?php

namespace App\Http\Controllers;
use App\Models\Payments;
use App\Models\Product;
use App\Models\Slide;
use App\Models\Visitors;
use App\Models\Bill;
use App\Models\Post;
use App\Models\Customer;


use Illuminate\Http\Request;
use Session;
use DB;
use Auth;

class ordercontroller extends Controller

{
    public function history(Request $req){
	
        if(!Session::get('user_id_login')){
            return redirect('dang-nhap');
        }
		else{
		$data = Session::get('user_email_login');
		// dd($data);



        $nowSale_hours = date('H:m:s');
        $nowSale = date('Y/m/d');
        $all_product = Product::join('post', 'products.id_post', '=', 'post.id_post')->inRandomOrder()->get();
        
        $new_product = Product::join('post', 'products.id_post', '=', 'post.id_post')->where('new',1)->inRandomOrder()->get();
        $top_product = Product::join('post', 'products.id_post', '=', 'post.id_post')->where('new',0)->inRandomOrder()->get();

    	$slide = Slide::where('status_slide',0)->inRandomOrder()->get();

        $sanpham_khuyenmai = Product::join('post', 'products.id_post', '=', 'post.id_post')->where('promotion_price','<>',0)->where('date_sale','>=' ,$nowSale)->inRandomOrder()->get();

        $user_ip_address = $req->ip();
        //online hien tai
        $visitor_current = Visitors::where('ip_address', $user_ip_address)->get();
        $visitor_count = $visitor_current->count();

        if ($visitor_count<1) {
            $visitor = new Visitors();
            $visitor->ip_address = $user_ip_address;
            $visitor->date_visitor = Carbon::now('Asia/Ho_Chi_Minh')->toDateString();
            $visitor->save();
        }

        $posts = Post::get();
        $multi_description = 'description_' . app()->getLocale();
        foreach ($new_product as $key => $value) 
		{
            $meta_desc = $value->$multi_description;
            $url_canonical = $req->url();
            $image_og = url('public/source/image/product/'.$value->image);

		}
		

			// $donhang = Bill::join('customer', '141', '=', 'bills.id_customer')->orderby('id_bill', 'DESC')->get();
            $donhang = Bill::join('customer', 'customer.id', '=', 'bills.id_customer')->where('customer.email',$data)->orderby('id_bill', 'desc')->get();


            return view('history.history', compact('donhang','url_canonical','image_og','meta_desc','all_product','new_product','posts'));
    
        }
    }

	public function getDonhangchitiet($id, Request $req)
    {
        if (Auth::check()) {
			$data = Session::get('user_email_login');

			$nowSale_hours = date('H:m:s');
			$nowSale = date('Y/m/d');
			$all_product = Product::join('post', 'products.id_post', '=', 'post.id_post')->inRandomOrder()->get();
			
			$new_product = Product::join('post', 'products.id_post', '=', 'post.id_post')->where('new',1)->inRandomOrder()->get();
			$top_product = Product::join('post', 'products.id_post', '=', 'post.id_post')->where('new',0)->inRandomOrder()->get();
	
			$slide = Slide::where('status_slide',0)->inRandomOrder()->get();
	
			$sanpham_khuyenmai = Product::join('post', 'products.id_post', '=', 'post.id_post')->where('promotion_price','<>',0)->where('date_sale','>=' ,$nowSale)->inRandomOrder()->get();
	
			$user_ip_address = $req->ip();
			//online hien tai
			$visitor_current = Visitors::where('ip_address', $user_ip_address)->get();
			$visitor_count = $visitor_current->count();
	
			if ($visitor_count<1) {
				$visitor = new Visitors();
				$visitor->ip_address = $user_ip_address;
				$visitor->date_visitor = Carbon::now('Asia/Ho_Chi_Minh')->toDateString();
				$visitor->save();
			}
	
			$posts = Post::get();
			$multi_description = 'description_' . app()->getLocale();
			foreach ($new_product as $key => $value) 
			{
				$meta_desc = $value->$multi_description;
				$url_canonical = $req->url();
				$image_og = url('public/source/image/product/'.$value->image);
	
			}


			$donhang = Bill::join('customer', 'customer.id', '=', 'bills.id_customer')->where('customer.email',$data)->orderby('id_bill', 'desc')->get();

			$billdetaill =DB::select("SELECT bt.id_bill_detail, bt.id_bill, bt.id_product, bt.id_post_bill_detail, bt.order_code, bt.quantity,
			bt.unit_price,p.sub_image,p.image,p.hours_sale,p.date_sale, p.product_quantity ,p.id_post, post.sp_vi as sp_vi,  post.sp_en as sp_en
			FROM bill_detail bt, products p
			INNER JOIN post ON p.id_post = post.id_post
			 WHERE bt.id_product=p.id AND id_bill=$id ");
				$url_canonical = $req->url();
	
				$thongtin_kh = Bill::join('customer', 'customer.id', '=', 'bills.id_customer')->where('id_bill',$id)->get();
	
            return view('FrontEnd.DetailBills', compact('donhang','url_canonical','image_og','meta_desc','all_product','new_product','posts','billdetaill', 'thongtin_kh'));
        } else {
            return redirect()->route('trang-chu');
        }
    }

	public function Cancel_DonHang($id)
    {

        $bill = Bill::where('id_bill', $id)->update(['status_bill' => 2]);
        return redirect()->back()->with('thongbao', 'Hủy đơn thành công!');
    }
	public function Update_Donhang($id)
    {

        $bill = Bill::where('id_bill', $id)->update(['status_bill' => 4]);
        return redirect()->back()->with('thongbao', 'Xác nhận thành công!');
    }

    // Hoa don
    public function print_order($checkout_code){
        $pdf = \App::make('dompdf.wrapper');
        $pdf->loadHTML($this->print_order_convert($checkout_code));
        return $pdf->stream();
    }


    public function print_order_convert($checkout_code){
  
       $order_details = BillDetail::where('order_code',$checkout_code)->get();
       $order = Bill::where('order_code',$checkout_code)->get();
       foreach ($order as $key => $ord) {
         $customer_id = $ord->id_customer;
       }
       $customer = Customer::where('id',$customer_id)->first();
    //    $shipping = Shipping::where('shipping_id',$shipping_id)->first();
       $order_details_product = BillDetail::with('product')->where('order_code',$checkout_code)->get();
    //    foreach($order_details_product as $key => $order_d){
  
    //     $product_coupon = $order_d->product_coupon;
    //   }
        // if($product_coupon != 'no'){
        //   $coupon = Coupon::where('coupon_code',$product_coupon)->first();
  
        //   $coupon_condition = $coupon->coupon_condition;
        //   $coupon_number = $coupon->coupon_number;
  
        //   if($coupon_condition==0){
        //     $coupon_echo = $coupon_number.'%';
        //   }elseif($coupon_condition==1){
        //     $coupon_echo = number_format($coupon_number,0,',','.').' '.'VNĐ';
        //   }
        // }else{
        //   $coupon_condition = 2;
        //   $coupon_number = 0;
  
        //   $coupon_echo = '0';
  
        // }
        $output = '';
        $output.='<style>body{
                    font-family: DejaVu Sans;
                  }
                  .Table {
                    background:#ffffff;
                    font: 15px;
                    width:100%;
                    border-collapse:collapse;
                    font-size:13px;
                    border:1px solid #d3d3d3;
                    text-align: center;
                  }
                  .Table_now {
                    background:#ffffff;
                    font: 15px;
                    width:100%;
                    border-collapse:collapse;
                    font-size:15px;
                    border:0px solid #d3d3d3;
                    text-align: center;
                    vertical-align:middle;
                  }
  
                  .Table th {
                    background: rgba(0,0,255,0.1);
                    text-align: center;
                    font-weight: bold;
                    background-color: gray;
                    border:1px solid #d3d3d3;
  
                  }
                  .Table tr {
                    height: 24px;
                    border:thin solid #d3d3d3;
                  }
                  .Table tr td {
                    padding-right: 2px;
                    padding-left: 2px;
                    border:thin solid #d3d3d3;
                  }
                  .Table tr:hover {
                    background: rgba(0,0,0,0.05);
                  }
                  .Table .cotSTT {
                    text-align:center;
                    width: 10%;
                  }
                  .Table .cotTenSanPham {
                    text-align:left;
                    width: 40%;
                  }
                  .Table .cotHangSanXuat {
                    text-align:left;
                    width: 20%;
                  }
                  .Table .cotGia {
                    text-align:right;
                    width: 120px;
                  }
                  .Table .cotSoLuong {
                    text-align: center;
                    width: 50px;
                  }
                  .Table .cotSo {
                    text-align: right;
                    width: 120px;
                  }
                  .Table .tong {
                    text-align: right;
                    font-weight:bold;
                    text-transform:uppercase;
                    padding-right: 4px;
                  }
                  .Table .cotSo {
                    text-align: center;
                  }
                  .img{
                    margin-top:1px;
                  }
                  </style>
                  <table class="Table">
                    <h1><center>HÓA ĐƠN</center></h1>
                    <h2><center>GOOD FOOD</center></h2>
                    <center><img src="" height="150px" width="300px" class="img"></center>
                  </table>
                  <p>Tài khoản đặt hàng</p>
                  <table class="Table">
                      <thead>
                        <tr>
                          <th>Tên</th>
                          <th>Số điện thoại</th>
                          <th>Email</th>
                        </tr>
                      </thead>
                      <tbody>';
                      
                  $output.='    
                        <tr>
                          <td>'.$customer->name.'</td>
                          <td>'.$customer->phone_number.'</td>
                          <td>'.$customer->email.'</td>
                        </tr>';
                  $output.='        
                      </tbody>
                  </table>
  
                  <p>Thông tin nhận hàng</p>
                    <table class="Table">
                      <thead>
                        <tr>
                          <th>Tên người nhận</th>
                          <th>Địa chỉ</th>
                          <th>Sdt</th>
                          <th>Email</th>
                        </tr>
                      </thead>
                      <tbody>';
                      
                  $output.='    
                        <tr>
                        <td>'.$customer->name.'</td>
                        <td>'.$customer->address.'</td>
                        <td>'.$customer->phone_number.'</td>
                        <td>'.$customer->Email.'</td>
                          
                        </tr>';
                      
  
                  $output.='        
                      </tbody>
                    
                  </table>
  
                  <p>Đơn hàng đặt</p>
                    <table class="Table">
                      <thead>
                        <tr>
                          <th>Tên sản phẩm</th>
                          <th>Số lượng</th>
                          <th>Giá sản phẩm</th>
                          <th>Thành tiền</th>
                        </tr>
                      </thead>
                      <tbody>';
                    
                      $total = 0;
  
                      foreach($order_details_product as $key => $product){
  
                        $subtotal = $product->unit_price*$product->quantity;
                        $total+=$subtotal;
  
                        // if($product->product_coupon!='no'){
                        //   $product_coupon = $product->product_coupon;
                        // }else{
                        //   $product_coupon = 'không có';
                        // }   
  
                  $output.='    
                        <tr>
                          <td>'.$product->product_name.'</td>
                          <td>'.$product->quantity.'</td>
                          <td>'.number_format($product->unit_price,0,',','.').' '.'VNĐ'.'</td>
                          <td>'.number_format($subtotal,0,',','.').' '.'VNĐ'.'</td>
                        </tr>';
                      }
  
                    //   if($coupon_condition==0){
                    //     $total_after_coupon = ($total*$coupon_number)/100;
                    //             $total_coupon = $total - $total_after_coupon;
                    //   }else{
                    //               $total_coupon = $total - $coupon_number;
                    //   }
  
                  $output.= '
                  <tr>
                      <td colspan="12" style="text-align:right;">
                        <p>Phí ship: '.number_format(30000,0,',','.').' '.'VNĐ'.'</p>
                        <p>Thanh toán : '.number_format($total_coupon + $product->product_feeship,0,',','.').' '.'VNĐ'.'</p>
                      </td>
                  </tr>';
                  $output.='        
                      </tbody>
                    
                  </table>
                    <table>
                      <thead>
                        <tr>
                          <th width="200px">Nhân viên</th>
                          
                          <th width="800px">Khách hàng</th>
                        </tr>
                      </thead>
                      <tbody>';
                          
                  $output.='        
                      </tbody>
                    
                  </table>';
        return $output;
      }
}
