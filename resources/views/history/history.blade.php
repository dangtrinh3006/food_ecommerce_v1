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
                <li class="active"><a href="{{route('shoppingcart')}}">{{ trans('home.history') }}</a></li>
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

                        <h2 style="text-align: center;font-weight: bold;">DANH SÁCH ĐƠN HÀNG</h3>

                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align: center;">
                    <thead>
                        <tr>
                            <th>STT </th>
                            <th>{{ trans('Ql_sp.pay') }}</th>
                            <!-- <th style="width: 15em;word-wrap:break-word;">Address</th> -->
                            <!-- <th>Phone Number</th> -->
                            <th>Mã Đơn Hàng</th>
                            <th>{{ trans('Ql_sp.trangthai') }}</th>
                            <th>Ngày đặt hàng</th>
                            <th>Tổng tiền</th>
                           <!--  <th>Created At </th>
                            <th>Total Money</th>
                            <th>Payment Methods</th>
                            <th>Note</th> -->
                            <th>Xem</th>
                            <th>Xác nhận</th>
                            <th>Hủy</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>STT </th>                            
                            <th>{{ trans('Ql_sp.pay') }}</th>
                            <!-- <th style="width: 15em;word-wrap:break-word;">Address</th> -->
                            <!-- <th>Phone Number</th> -->
                            <th>Mã Đơn Hàng</th>
                            
                            <th>{{ trans('Ql_sp.trangthai') }}</th>
                            <th>Ngày đặt hàng</th>
                            <th>Tổng tiền</th>

                           <!--  <th>Created At </th>
                            <th>Total Money</th>
                            <th>Payment Methods</th>
                            <th>Note</th> -->
                            <th>Xem</th>
                            <th>Xác nhận</th>
                            <th>Hủy</th>

                        </tr>
                    </tfoot>
                    <tbody>
                        @foreach($donhang as $key => $dh)
                        <tr>
                            <td>{{$key+=1}}</td>
                            <td>{{$dh->payment}}</td>
                            <!-- <td style="width: 15em; word-wrap:break-word;">{{$dh->address}}</td> -->
                            <!-- <td>{{$dh->phone_number}}</td> -->
                            <td>{{$dh->order_code}}</td>
                            <td>
                                <?php
                                   if($dh->status_bill==1){
                                    ?>
                                    <span class="p-3 mb-2 bg-info"> Đang vận chuyển</span>
                                    <?php
                                     }elseif($dh->status_bill==0){
                                    ?>  
                                     <span class="p-3 mb-2 bg-warning">Đang xử lý...</span>
                                    <?php
                                     }
                                    elseif($dh->status_bill==4)
                                    {
                                        ?>  
                                         <span class="p-3 mb-2 bg-success">Đã giao hàng</span>
                                        <?php
                                    }
                                    else
                                    {
                                    ?> 
                                    <a ><span class="p-3 mb-2 bg-danger">Hủy đơn</span></a>
                                    <?php
                                   }
                                ?>
                            </td>
                            <td>{{$dh->date_order}}</td>
                            <td>{{number_format($dh->total + 30000)}}</td>
                            

                            <td>
                                 <a href="{{route('chitietdonhang', $dh->id_bill)}}">
                                    <button class="btn btn-outline-primary"  type="button">&nbsp;<i class="fas fa-info">&nbsp;</i></button>
                                </a>
                                
                            </td>
                            <td>
                                <!-- <a href="{{route('deletedh', $dh->id_bill)}}"> -->
                                <!-- </a> -->
                                <?php
                                   if($dh->status_bill == 1)
                                   {
                                    ?>
                                    <button class="btn btn-outline-success" data-toggle="modal" data-target="#dhallConfirm_{{$dh->id_bill}}" type="button"><i class="far fa-check-circle"></i></button>
                                    <?php
                                    }else{
                                    ?> 
                                    <button class="btn btn-secondary" type="button"><i class="far fa-check-circle"></i></button>
                                    <?php
                                   }
                                  ?>
                            </td>
                            <td>
                                <!-- <a href="{{route('deletedh', $dh->id_bill)}}"> -->
                                <!-- </a> -->
                                <?php
                                   if($dh->status_bill == 0)
                                   {
                                    ?>
                                    <button class="btn btn-outline-danger delete" data-toggle="modal" data-target="#dhallDel_{{$dh->id_bill}}" type="button"><i class="fas fa-trash-alt"></i></button>
                                    <?php
                                    }else{
                                    ?> 
                                    <button class="btn btn-secondary" type="button"><i class="fas fa-trash-alt"></i></button>
                                    <?php
                                   }
                                  ?>
                            </td>


                            <!-- Modal Delete-->
                            <div class="modal fade" id="dhallDel_{{$dh->id_bill}}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Bạn muốn hủy đơn hàng này?</h5>
                                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">×</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">Chọn "Hủy" nếu bạn đã chắc chắn muốn hủy đơn hàng!</div>
                                        <div class="modal-footer">
                                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Huỷ bỏ </button>
                                            
                                             <form method="" action="{{route('canceldh', $dh->id_bill)}}">
                                                <button type="submit" class="btn btn-danger">
                                                    Hủy
                                                </button>
                                            </form>                          
                                           
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Modal Confirm-->
                            <div class="modal fade" id="dhallConfirm_{{$dh->id_bill}}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Xác nhận giao hàng thành công?</h5>
                                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">×</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">Chọn "Đồng ý" nếu bạn đã nhận được đơn hàng!</div>
                                        <div class="modal-footer">
                                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Huỷ bỏ </button>
                                            
                                             <form method="" action="{{route('updatedh', $dh->id_bill)}}">
                                                <button type="submit" class="btn btn-danger">
                                                    Đồng ý
                                                </button>
                                            </form>                          
                                           
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </tr>
                        @endforeach
                        
                    </tbody>
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