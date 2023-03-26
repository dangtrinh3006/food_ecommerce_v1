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
    <h4 class='title'>{{trans('home.ip-title1')}}</h4>
    <h4 class='title'>{{trans('home.ip-title2')}}</h4>
    

    <div class='content-small'>
        <p>{{trans('home.ip-bf1')}}
        </p>

        <p>{{trans('home.ip-bf2')}}</p>

        <h4>1. {{trans('home.ip-h1')}}</h4>
        <p>{{trans('home.ip-h1-p')}}</p>

        <h4>2. {{trans('home.ip-h2')}}</h4>
        <p>{{trans('home.ip-h2-p')}}</p>

        <h4>3. {{trans('home.ip-h3')}}</h4>
        <p>{{trans('home.ip-h3-p')}}<a style='color:red'href="">order.goodfood2021@gmail.com</a>
        </p>
           
       <h4>4. {{trans('home.ip-h4')}}</h4>
       <p>{{trans('home.ip-h4-p')}}</p>
    </div>
</div>
@endsection