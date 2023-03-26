<style>
    .card-list{
        position: relative;
        top: 20px;
        padding: 10px 10px;
        margin-bottom: 60px;
        margin: 50px 20px;
        box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
    }

    
    
</style>
@extends('Layout')
@section('title')    
	{{ trans('home.contact') }}
@endsection
@section('content-layout')
<!-- Breadcrumb Start -->
<div class="breadcrumb-area mt-30">
    <div class="container">
        <div class="breadcrumb">
            <ul class="d-flex align-items-center">
                <li><a href="{{route('trang-chu')}}">{{ trans('home.home') }}</a></li>
                <li class="active"><a href="{{route('lienhe')}}">{{ trans('home.contact') }}</a></li>
            </ul>
        </div>
    </div>
    <!-- Container End -->
</div>
<div class="container">
    <div class="row">
        <div class="col-xs-1 col-sm-6 col-md-4" >
            <img class="card-img-top" src="https://static.tastykitchen.vn/images/bep-4.jpg" alt="Card image cap">
            <div class="card-body text-center">
              <h3 class="card-title">{{trans('home.ct-item-1-title')}}</h3>
              <p class="card-text">{{trans('home.ct-item-1-desc')}}</p>
            </div>
          </div>
    
          <div class="col-xs-1 col-sm-6 col-md-4" >
            <img class="card-img-top" src="	https://static.tastykitchen.vn/images/bep-3.jpg" alt="Card image cap">
            <div class="card-body text-center">
              <h3 class="card-title">{{trans('home.ct-item-2-title')}}</h3>
              <p class="card-text">{{trans('home.ct-item-2-desc')}}</p>
            </div>
          </div>
    
          <div class=" col-xs-1 col-sm-6 col-md-4" >
            <img class="card-img-top " src="https://static.tastykitchen.vn/images/bep-2.jpg" alt="Card image cap">
            <div class="card-body text-center">
              <h3 class="card-title">{{trans('home.ct-item-3-title')}}</h3>
              <p class="card-text">{{trans('home.ct-item-3-desc')}}</p>
            </div>
          </div>    

          
    </div>
</div>



<!-- Breadcrumb End -->
<!-- Contact Email Area Start -->
    <div class="container">
        <h3 class="mb-20 text-center" style="color:red">{{ trans('home.Contact_Form') }}</h3>
        <p class="text-capitalize mb-20"></p><br>
        <form id="contact-form" class="contact-form" action="{{route('lienhe')}}" method="post">
        	<input type="hidden" name="_token" value="{{csrf_token()}}">
		    @if(Session::has('thongbao'))
		        <div style="height: 50px" class="alert alert-success form-control" style="width: 100%">{{Session::get('thongbao')}}</div> 
		    @endif
            <div class="address-wrapper row">
                <div class="col-md-12">
                    <div class="address-fname">
                        <input class="form-control" type="text" name="name" placeholder="{{ trans('home.YourName') }}">
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="address-email">
                        <input class="form-control" type="email" name="email" placeholder="Email">
                    </div>
                </div>
<!--                 <div class="col-md-6">
                    <div class="address-web">
                        <input class="form-control" type="text" name="website" placeholder="{{$url_canonical}}" readonly>
                    </div>
                </div> -->
                <div class="col-md-12">
                    <div class="address-textarea">
                        <textarea name="content" class="form-control" placeholder="{{ trans('home.Writeyourmessage') }}"></textarea>
                    </div>
                </div>
            </div>
            <p class="form-message"></p>
            <div class="footer-content mail-content clearfix">
                <div class="send-email float-md-right ">
                    <input  value="{{ trans('home.send') }}" class="return-customer-btn" type="submit">
                </div>
            </div>
        </form>
    </div>
</div>
<!-- Contact Email Area End -->
<!-- Google Map Start -->
<div class="goole-map">
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.246971657208!2d106.70912631458921!3d10.792386992310705!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528b271505441%3A0x86b32e7710f3e3bc!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBUw7RuIMSQ4bupYyBUaOG6r25nIC0gQ8ahIHPhu58gVFAuSENN!5e0!3m2!1svi!2s!4v1638447866994!5m2!1svi!2s" id="map" style="height:400px; width: 100%" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
</div>
<!-- Google Map End --> 
@endsection