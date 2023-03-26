@extends('Layout')
@section('title')    
{{ trans('home.carttt') }}
@endsection
@section('content-layout')



<!-- Breadcrumb Start -->
<div class="breadcrumb-area mt-30">
    <div class="container">
        <div class="breadcrumb">
            <ul class="d-flex align-items-center">
                <li><a href="{{route('trang-chu')}}">{{ trans('home.home') }}</a></li>
                <li class="active"><a href="{{route('shoppingcart')}}">{{ trans('home.detailbill') }}</a></li>
            </ul>
        </div>
    </div>
    <!-- Container End -->
</div>
<!-- Breadcrumb End -->
<!-- Cart Main Area Start -->
<div class="cart-main-area ptb-100 ptb-sm-60">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12">
				    @if(Session::has('message'))
		                <div class="alert alert-success alert-dismissible fade show">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <strong>Thành công!</strong> {{Session::get('message')}}!
                        </div>
					@elseif(Session::has('message_err'))
                        <div class="alert alert-danger  alert-dismissible fade show">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <strong>Thất bại!</strong> {{Session::get('message_err')}}!
                        </div>
					@endif
                    <!-- Table Content Start -->
                    <div class="table-content table-responsive mb-45">

                        <table>
                            <div class="card shadow mb-4">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <h3 style="text-align: center;font-weight: bold;">Thông Tin Giao Hàng</h3>
                                        <table class="table table-striped">
                                        <thead>
                                            <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Tên Người Đặt</th>
                                            <th scope="col">Địa Chỉ</th>
                                            <th scope="col">Số Điện Thoại</th>
                                            <th scope="col">Ghi Chú</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($thongtin_kh as $key => $dh_ct)
                                            <tr>
                                            <th scope="row">{{$key++}}</th>
                                            <td>{{$dh_ct->name}}</td>
                                            <td>{{$dh_ct->address}}</td>
                                            <td>{{$dh_ct->phone_number}}</td>
                                            <td>{{$dh_ct->note}}</td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                            <!-- Card 2-->
                            <div class="card shadow mb-4">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <h3 style="text-align: center;font-weight: bold;">Chi Tiết Đơn Hàng</h3>

                                        <table class="table table-striped">
                                        <thead>
                                            <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Tên Sản Phẩm</th>
                                            <th scope="col">Hình Ảnh</th>
                                            <th scope="col">Giá Tiền</th>
                                            <th scope="col">Số Lượng</th>
                                            <th scope="col">Tổng Tiền</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($billdetaill as $key => $bd)
                                            <tr class="color_qty_{{$bd->id_product}}">
                                            <th scope="row">{{$key++}}</th>
                                            <td>
                                                @if(config('app.locale') != 'vi') 
                                                    {{$bd->sp_en}}
                                                @else
                                                    {{$bd->sp_vi}}
                                                @endif
                                            </td>
                                            <td><img height="50px" width="100px" src="{{ asset('source/image/product/'.$bd->image) }}" alt=""></td>
                                            <td>{{number_format($bd->unit_price,0,',','.')}} VNĐ</td>
                                            <!-- <td>
                                                <!-- @csrf
                                                <input class="order_qty_{{$bd->id_product }}" type="number" name="product_quantity_order" value="{{$bd->quantity}}" min="1" {{$dh_ct->status_bill != 0 ? 'disabled' : ''}} style="width: 40px; text-align: center;">
                                                
                                                <input type="hidden" name="order_qty_storage" class="order_qty_storage_{{$bd->id_product}}" value="{{$bd->product_quantity}}">
                                                <input type="hidden" name="order_code" class="order_code" value="{{$bd->order_code}}">
                                                <input type="hidden" name="order_product_id" class="order_product_id" value="{{$bd->id_product}}">

                                                
                                                </form> -->
                                                <!-- <td>{{$bd->product_quantity}}</td> -->


                                            <!-- </td> -->
                                            <td>{{$bd->quantity}}</td>

                                            <td>{{number_format($bd->quantity*$bd->unit_price,0,',','.')}} VNĐ </td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                        </table>

                                    </div>
                                    <div class="space40">&nbsp;</div>


                                    <div class="modal-footer">
                                    <div class="form-group" style="font-weight: bold; color: #000">
                                        <label style="font-weight: bold; color: #000">Phí Ship Mặc Định: 
                                        <span style="font-weight: normal;">30.000 VNĐ</span>
                                        </label>
                                        <br>
                                        <label style="font-weight: bold; color: #000">Tổng Cộng: 
                                        <span style="font-weight: normal;">{{number_format($dh_ct->total + 30000,0,',','.')}} VNĐ</span>
                                        </label>
                                    </div>
                                    </div>
                                    @if($dh_ct->status_bill == 1 || $dh_ct->status_bill == 4)
                                    <div style="margin-top: 25px; margin-bottom: 1px; margin-left: 9px">
                                            <table>
                                                <tr>
                                                <a href="{{url('/print-order/'.$dh_ct->order_code)}}" class="btn btn-info">IN HÓA ĐƠN</a>
                                                </tr> 
                                            </table>
                                        </div>
                                    @endif
                                </div>
                            </div>

                            
                        </table>
                        
                    </div>
                    <!-- Table Content Start -->
                    
                       	
                        
                                
                        <!-- Cart Totals End -->
                    <!-- Row End -->
            </div>
        </div>
         <!-- Row End -->
    </div>
</div>
<!-- Cart Main Area End -->
@endsection