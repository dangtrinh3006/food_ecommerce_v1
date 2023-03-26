<style>
    a {
        text-decoration: none;
        color: black;
    }

    a:hover{
        color: red;
    }

    .footer-1-title{
        margin-bottom: 20px;
        color: red;
        font-weight: 500;
    }

    p{
      margin-top: 5px;
    }

    li{
        margin-top: 10px;
    }

    .footer-banner{
        display: flex;
        justify-content: center;
        justify-content: space-between;
    }

    .single-support{
        margin: 0 40px;
        border: none !important;
    }

    p{
        font-size: 16px;
        font-weight: 500;
    }

    .news-title{
        font-family: 'Times New Roman', Times, serif;
    }

</style>
<!-- Support Area Start Here -->
<div class="support-area bdr-top" >
    <div class="container">
        <div class="footer-banner center" >
            
            <div class="single-support" >
                <div class="support-icon">
                    <i  style="color:red" class="lnr lnr-rocket red" ></i>
                </div>
                <div class="support-desc">
                    <h6>{{trans('home.FastDelivery')}}</h6>
                    <span>{{trans('home.FastDelivery-desc')}}</span> 
                </div>
            </div>
           
            <div class="single-support">
                <div class="support-icon">
                    <i style="color:red" class="fas fa-wallet red"></i>
                </div>
                <div class="support-desc">
                    <h6>{{trans('home.ShopConfidence')}}</h6>
                    <span>{{trans('home.ShopConfidence-desc')}}</span> 
                </div>
            </div>
            
            <div class="single-support">
                <div class="support-icon">
                   <i style="color:red" class="lnr lnr-users"></i>
                </div>
                <div class="support-desc">
                    <h6>{{trans('home.24/7HelpCenter')}}</h6>
                    <span>{{trans('home.24/7HelpCenter-desc')}}</span> 

                </div>
            </div>
        </div>
    </div>
    
</div>
<!-- Support Area End Here -->
<!-- them so sanh -->
<div class="modal" id="sosanhsp">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title"></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <div class="container">
                       
              <table class="table table-hover" id="row_compare" >
                <thead>
                  <tr style="text-align: center;">
                    <th>{{ trans('home.nameproduct') }}</th>
                    <th>{{ trans('home.hinhanh') }}</th>
                    <th>{{ trans('home.del') }}</th>
                    <th>{{ trans('home.chitiet') }}</th>
                  </tr>
                </thead>
                <tbody>

                </tbody>
              </table>
            </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
</div>

<!-- them yeu thich -->
<div class="modal" id="yeuthichsp">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title"></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <div class="container">
                       
              <table class="table table-hover" id="row_yeuthich" >
                <thead>
                  <tr style="text-align: center;">
                    <th>{{ trans('home.nameproduct') }}</th>
                    <th>{{ trans('home.hinhanh') }}</th>
                    <th>{{ trans('home.del') }}</th>
                    <th>{{ trans('home.chitiet') }}</th>
                  </tr>
                </thead>
                <tbody>

                </tbody>
              </table>
            </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <a href="{{ route('wishlist') }}" class="btn btn-danger">{{ trans('home.chitiet') }}</a>
        </div>
        
      </div>
    </div>
</div>
<!-- Footer Area Start Here -->
<footer class="off-white-bg2 pt-95 bdr-top pt-sm-55 " >
    <!-- Footer Top Start -->
    <div class="footer-top">
        <div class="container">
            <!-- Signup Newsletter Start -->
            <div class="row mb-60">
                 <div class="col-xl-7 col-lg-7 ml-auto mr-auto col-md-8">
                    <div class="news-desc text-center mb-30">
                         <h3 class="news-title">{{trans('home.news-title')}}</h3>
                         <p>{{trans('home.news-p')}}</p>
                     </div>
                     <div class="newsletter-box">
                         <form action="#">
                              <input class="subscribe" placeholder="{{trans('home.news-placeholder')}}" name="email" id="subscribe" type="text">
                              <button type="submit" class="submit">{{trans('home.news-btn')}}</button>
                         </form>
                     </div>
                 </div>
            </div> 
            <!-- Signup-Newsletter End -->                   
            {{-- New footer --}}
            <div class="row footer-down">
                <!-- Single Footer Start -->
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="single-footer mb-sm-40 align">
                        <h2 class="footer-1-title">GOOD FOOD</h2>
                        <p class="text-sub" href>{{trans('home.footer-1-p')}}</p>
                        <a href="http://online.gov.vn/Home/">
                        <img src="https://tastykitchen.vn/images/bo-cong-thuong.png" alt="">
                        </a>
                    </div>
                </div>
                <!-- Single Footer Start -->
                <!-- Single Footer Start -->
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="single-footer mb-sm-40">
                        <h3 class="footer-title"><a href="{{url::to('/lien-he')}}">{{trans('home.footer-2-title')}}</a></h3>
                        <p style="font-weight: 700"><i style="color:red;" class="fas fa-arrow-right"></i> {{trans('home.footer-2-company')}}</p>
                        <p>{{trans('home.footer-2-tax')}}</p>
                        <p>{{trans('home.footer-2-address1')}}</p>
                        <p>{{trans('home.footer-2-address2')}}</p>
                        <p>
                        <a class="color-gray" href="tel:0834021123" title="0834021123">{{trans('home.footer-2-phone')}}0834 021 123</a>
                        </p>
                        <a href="mail:order.goodfood2021@gmail.com"><i style="color:red" class="far fa-envelope"></i> <span style="color:red">Email</span> order.goodfood2021@gmail.com</p>
                    </div>
                </div>
                <!-- Single Footer Start -->
                <!-- Single Footer Start -->
                {{-- Policies --}}
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="single-footer mb-sm-40">
                        <h3 class="footer-title">{{trans('home.footer-3-title')}}</h3>
                        <ul>
                            <li>
                                <a href="{{url::to('/Information-Policy')}}">{{trans('home.footer-3-privacy')}}</a>
                            </li>
                            <li>
                                <a href="{{url::to('/Payment-Policy')}}">{{trans('home.footer-3-payment')}}</a>
                            </li>
                            <li>
                                <a href="{{url::to('/Delivery-Policy')}}">{{trans('home.footer-3-orders')}}</a>
                            </li>
                        </ul>
                        <ul>
                        <p>
                        <i style="color:gray" class="fa fa-clock-o" aria-hidden="true"></i>
                            08:00 - 20:00
                        </p>
                        <p>
                        <i style="color:gray" class="fa fa-phone" aria-hidden="true"></i>
                        <span style="color:red">0834 021 123</span>
                        </p>
<!--                         <li><a href="#"><img src="{{asset('source/assets/frontend/img/icon/social-img1.png')}}" alt="google play"></a></li>
                        <li><a href="#"><img src="{{asset('source/assets/frontend/img/icon/social-img2.png')}}" alt="app store"></a></li> -->
                        </ul>
                        
                    </div>
                </div>
                <!-- Single Footer Start -->
             
            </div>
            <!-- Row End -->
        </div>
        <!-- Container End -->
    </div>
    <!-- Footer Top End -->
    <!-- Footer Middle Start -->
    <div class="footer-middle text-center">
        <div class="container">
            <div class="footer-middle-content pt-20 pb-30">
                    <ul class="social-footer">
                        <li><a href="https://www.facebook.com/DangTrinh3006"><i style="color:blue" class="fa fa-facebook"></i></a></li>
                        <li><a href="https://instagram.com/sau.technology"><i style="color:red" class="fa fa-instagram"></i></a></li>
<!--                         <li><a href="#"><img src="{{asset('source/assets/frontend/img/icon/social-img1.png')}}" alt="google play"></a></li>
                        <li><a href="#"><img src="{{asset('source/assets/frontend/img/icon/social-img2.png')}}" alt="app store"></a></li> -->
                    </ul>
                    
            </div>
        </div>
        <!-- Container End -->
    </div>
    <!-- Footer Middle End -->
    <!-- Footer Bottom Start -->
    <div class="footer-bottom pb-30">
        <div class="container">

             <div class="copyright-text text-center">                    
                <p>Copyright © 2021 <a target="_blank" href="#">GOOD FOOD</a> All Rights Reserved.</p>
             </div>
        </div>
        <!-- Container End -->
    </div>
    <!-- Footer Bottom End -->
</footer>
<!-- Footer Area End Here -->
<!-- Quick View Content Start -->
<div class="main-product-thumbnail quick-thumb-content">
    <div class="container">
        <!-- The Modal -->
        @foreach($all_product as $all)
        <div class="modal fade" id="myModal_{{$all->id}}">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="row">
                            <!-- Main Thumbnail Image Start -->
                            <div class="col-lg-5 col-md-6 col-sm-5">
                                <!-- Thumbnail Large Image start -->
                                <div class="tab-content">
                                    <div id="thumb1_{{$all->id}}" class="tab-pane fade show active">
                                        <a data-fancybox="images" href="source/image/product/{{$all->image}}"><img src="source/image/product/{{$all->image}}" alt="product-view" height="331.66px" width="331.66px"></a>
                                    </div>
                                </div>
                                <!-- Thumbnail Large Image End -->
                                <!-- Thumbnail Image End -->
                                <div class="product-thumbnail mt-20">
                                    <div class="thumb-menu owl-carousel nav tabs-area" role="tablist">
                                        <a class="active" data-toggle="tab" href="#thumb1_{{$all->id}}"><img src="source/image/product/{{$all->image}}" alt="product-thumbnail" height="98.55px" width="98.55px"></a>
                                    </div>
                                </div>
                                <!-- Thumbnail image end -->
                            </div>
                            <!-- Main Thumbnail Image End -->
                            <!-- Thumbnail Description Start -->
                            <div class="col-lg-7 col-md-6 col-sm-7">
                                <div class="thubnail-desc fix mt-sm-40">
                                    <h3 class="product-header">{{$all->$multisp}}</h3>
                                    <div class="pro-price mtb-30">
                                        <p class="d-flex align-items-center">
                                            @if($all->promotion_price != 0)
                                            <span class="prev-price">{{number_format($all->unit_price,0,',','.')}} VNĐ</span>
                                            <span class="price">{{number_format($all->promotion_price,0,',','.')}} VNĐ</span>
                                            <span class="saving-price">sale {{number_format(100-($all->promotion_price/$all->unit_price)*100)}}%</span>
                                            @else
                                            <span class="price">{{number_format($all->unit_price,0,',','.')}} VNĐ</span>
                                            @endif
                                        </p>
                                    </div>
                                    <p class="mb-20 pro-desc-details">{!! $all->$multi_description !!}</p>
<!--                                     <div class="color mb-20">
                                        <label>color</label>
                                        <ul class="color-list">
                                            <li>
                                                <a class="orange active" href="#"></a>
                                            </li>
                                            <li>
                                                <a class="paste" href="#"></a>
                                            </li>
                                        </ul>
                                    </div> -->
                                    <div class="box-quantity d-flex">
                                        <form action="#">
                                            <input class="quantity mr-40" type="number" min="1" value="1">
                                        </form>
                                        @if($all->product_quantity>0)
                                        <a class="add-cart" 
                                        <?php 
                                            if(Auth::check() || Session::get('user_name_login')){
                                                $addnewcart = route('themgiohang',$all->id);
                                            }else{
                                                $addnewcart = route('dangnhap');
                                            }
                                        ?>
                                        href="{{$addnewcart}}" title="{{ trans('home.addcart') }}">+ {{ trans('home.addcart') }}</a>
                                        @else
                                        <a class="add-cart disabled-link"> + {{ trans('home.addcart') }}</a>
                                        @endif
                                    </div>
                                    <div class="pro-ref mt-15">
                                        <p>
                                            @if($all->product_quantity>0)
                                            <span class="in-stock"><i class="ion-checkmark-round"></i> {{ trans('home.INSTOCK') }}</span>
                                            @else
                                            <span class="out-stock"><i class="ion-close"></i> {{ trans('home.OUTSTOCK') }}</span>
                                            @endif
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <!-- Thumbnail Description End -->
                        </div>
                    </div>
                    <!-- Modal footer -->
                    <div class="custom-footer">
                        <div class="socila-sharing">
                            <ul class="d-flex">
                                <li>share</li>
                                <li><a class="share" href="https://www.facebook.com/sharer/sharer.php?u={{$url_canonical}}&amp;src=sdkpreparse"><i class="fa fa-facebook " aria-hidden="true"></i></a></li>
                                <li><a class="share" href="http://instagram.com/share?url={{$url_canonical}}"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                               
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @endforeach
    </div>
</div>
<!-- Quick View Content End -->
<!-- Your Chat Plugin code -->
<div class="fb-customerchat"
 attribution="setup_tool"
 page_id="100286602132094"
 theme_color="#0A7CFF">
</div>

