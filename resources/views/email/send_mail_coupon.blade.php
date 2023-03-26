<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Mã Khuyến mãi</title>
	<style type="text/css">
		body{
			font-family: Arial;
		}
		.coupon{
			border: 5px dotted #bbb;
			width: 80%;
			border-radius: 15px;
			margin: 0 auto;
			max-width: 600px;
		}
		.container{
			padding: 2px 16px;
			background-color: #f1f1f1;
		}
		.promo{
			background: #ccc;
			padding: 5px;
		}
		.expire{
			color: red;
		}
		p.code{
			text-align: center;
			font-size: 20px;
		}
		p.expire{
			text-align: center;
		}
		h2.note{
			text-align: center;
			font-size: large;
			text-decoration: underline;
		}
	</style>
</head>
<body>
	<div class="coupon">
		<div class="container">
			<h3>VOUCHER HOT TỪ NHÀ HÀNG TRỰC UYẾN <a href="{{ route('trang-chu') }}" target="_blank">GOOD FOOD ^^!</a></h3>
		</div>
		<div class="container" style="background: #fff">
			<h2 class="note"><b><i>Giảm @if($coupon_array['coupon_send_new']['coupon_condition'] == 0)
				{{$coupon_array['coupon_send_new']['coupon_number']}} %
			@else
				{{number_format($coupon_array['coupon_send_new']['coupon_number'],0,',','.')}} VNĐ
			@endif cho đơn hàng đầu tiên!</i></b></h2>
			<p>Quý khách vui lòng truy cập vào Website nhà hàng <a href="{{ route('trang-chu') }}" target="_blank">GoodFood</a> và vui lòng <a href="{{ route('dangnhap') }}" target="_blank" style="color: red">Đăng Nhập</a> vào tài khoản để mua hàng và nhập mã giảm giá phía dưới để nhận được khuyến mãi, xin cảm ơn quý khách. Chúc quý khách nhiều sức khỏe và bình an trong cuộc sống.  </p>
			
		</div>
		<div class="container">
			<p class="code">MÃ KHUYẾN MÃI: <span class="promo">{{$coupon_array['coupon_send_new']['coupon_code']}}</span></p>
			<p class="expire">HẠN SỬ DỤNG: {{$coupon_array['coupon_send_new']['coupon_date_end']}}</p>
		</div>
	</div>
</body>
</html>