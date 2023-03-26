@extends('Layout')
@section('title')    
{{ trans('home.about') }}
@endsection
@section('content-layout')
<!-- Breadcrumb Start -->
<style>
    .read-more{
        background-color: red;
    }

    .para {
        margin-top: 50px;
        padding: 0 10px 0 0;
        margin-left: 170px;
        margin-right: 170px; 
    }
</style>
<div class="breadcrumb-area mt-30">
    <div class="container">
        <div class="breadcrumb">
            <ul class="d-flex align-items-center">
                <li><a href="index.html">{{ trans('home.home') }}</a></li>
                <li class="active"><a href="about.html">{{ trans('home.about') }}</a></li>
            </ul>
        </div>
    </div>
    <!-- Container End -->
</div>
<!-- Breadcrumb End -->
<!-- About Us Start Here -->
<div class="about-us pt-100 pt-sm-60">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="sidebar-img mb-all-30">
                    <img src="{{asset('https://static.tastykitchen.vn/images/imgabout_1_v2.jpg')}}" alt="single-blog-img">
                </div>
            </div>
            <div class="col-lg-6">
                <div class="about-desc">
                    <h3 class="mb-10 about-title">{{trans('home.about-title')}}</h3>
                    <p class="mb-20">{{trans('home.about-p1')}}</p>
                    <p class="mb-20">{{trans('home.about-p2')}}</p>
                    <a href="{{route('allproduct')}}" class="return-customer-btn read-more">{{trans('home.about-btn')}}</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Container End -->
</div>
<!-- About Us End Here -->

<div class='para'>
    <img width="100%" src="public/source/assets/frontend/img/about/para.png" alt="">    
</div>
@endsection