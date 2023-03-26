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
    <h4 class='title'>{{trans('home.dp-title1')}}</h4>
    

    <div class='content-small'>
        <p>{{trans('home.dp-p1')}}</p>
        <p>{{trans('home.dp-p2')}}</p>
        <p><b>{{trans('home.dp-p3-b')}}</b>{{trans('home.dp-p3')}}</p>
    </div>
</div>
@endsection