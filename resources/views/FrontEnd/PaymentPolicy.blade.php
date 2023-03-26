@extends('Layout')
@section('content-layout')
<style>
    .policy {
        margin-top: 50px;
        text-align: center;
        padding: 0 100px;
        margin-bottom: 70px;
    }

    .title{
        font-size: 30px;
        position: relative
    }

    .content-small{
        margin-top: 30px;
        text-align: justify;
    }

    .content-small p{
        margin-top: 20px;
    }

    .content-small h4{
        margin-top: 20px;
    }
</style>
<div class="container policy">
    <h4 class='title'>{{trans('home.hh-title1')}}</h4>
    

    <div class='content-small'>
        <p>{{trans('home.hh-bf1')}}
        </p>

        <h4>1. {{trans('home.hh-h1')}}</h4>
        <p>{{trans('home.hh-h1-p')}}</p>

        <h4>2. {{trans('home.hh-h2')}}</h4>
        <p>{{trans('home.hh-h2-p')}} <a style="color:red" href="">https://ewallet.vnpay.vn/huongdan/thanhtoan-vnpayqr.html</a></p>

    </div>
</div>
@endsection