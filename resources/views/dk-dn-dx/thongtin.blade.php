
@yield('content-tt')
<!----------------------------------------------thong tin----------------------------------------------------------------->

    <div class="modal fade" id="userUpdate" tabindex="-1" role="dialog" style="z-index: 1050; display: none;" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header text-write">
                    <h4 class="modal-title">{{ trans('home.up_date') }}</h4>
<!--                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span style="margin-bottom: 100%" aria-hidden="true"></span>
                    </button> -->

                <button class="btn btn-link closebtntt" type="button" data-dismiss="modal" >X</button>
                </div>
                <form action="{{route('userupdate1')}}" method="post"><!-- form delete -->
                    <input type="hidden" name="_token" value="{{csrf_token()}}">
                  <!--   <input type = "text" hidden class="col-sm-9 form-control"id ="idUpdate" name ="idUpdate" value="" /> -->
    		      

                    <div class="modal-body">
                    	@if(Auth::check())
						<div class="form-group">
                            <label style="font-weight: bold; color: #000">{{ trans('home.fullname') }}</label>
                            <input type="text" id="e_name_{{Auth::user()->id}}" name="name" class="form-control" value="{{Auth::user()->full_name}}" />

                        </div>
                        <div class="form-group">
                            <label style="font-weight: bold; color: #000">{{ trans('home.ress') }}</label>
                            <input type="text" id="e_adress_{{Auth::user()->id}}" required name="adress" class="form-control" value="{{Auth::user()->address}}" />
                        </div>
                        <div class="form-group">
                            <label style="font-weight: bold; color: #000">Email</label>
                            <input type="text" id="e_email_{{Auth::user()->id}}" required name="email" class="form-control" value="{{Auth::user()->email}}" />
                        </div>
                        <div class="form-group">
                            <label style="font-weight: bold; color: #000">{{ trans('home.phone') }}</label>
                            <input type="text" id="e_phone_{{Auth::user()->id}}" required name="phone" class="form-control" value="{{Auth::user()->phone}}" />
                        </div>
                        <!-- <div class="form-group">
                            <label style="font-weight: bold; color: #000">{{ trans('home.pass') }}*</label>
                            <input type="password" id="e_password_{{Auth::user()->id}}" required name="password" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label style="font-weight: bold; color: #000">{{ trans('home.repassword') }}*</label>
                            <input type="password" id="e_re_password_{{Auth::user()->id}}" required name="re_password" class="form-control" />
                        </div> -->
						@endif



                    </div>
                    <div class="modal-footer">
<!-- 	                        <button type="submit" class="btn btn-success" data-dismiss="modal"><i class="icofont icofont-check-circled"></i>{{ trans('home.cancel') }}</button> -->
	                        <button type="submit"  class="btn btn-primary"><i class="icofont icofont-check-circled"></i>{{ trans('home.up_date') }}</button>
                    </div>
                </form>

            </div>
        </div>
    </div>


	<!----------------------------------------------doi mat khau----------------------------------------------------------------->

    <div class="modal fade" id="passwordUpdate" tabindex="-1" role="dialog" style="z-index: 1050; display: none;" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header text-write">
                    <h4 class="modal-title">{{ trans('home.up_date') }}</h4>
<!--                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span style="margin-bottom: 100%" aria-hidden="true"></span>
                    </button> -->

                <button class="btn btn-link closebtntt" type="button" data-dismiss="modal" >X</button>
                </div>
                <form action="{{route('passwordUpdate')}}" method="post"><!-- form delete -->
                    <input type="hidden" name="_token" value="{{csrf_token()}}">
                  <!--   <input type = "text" hidden class="col-sm-9 form-control"id ="idUpdate" name ="idUpdate" value="" /> -->
    		       <!-- @if(count($errors)>0)
						<div class="alert alert-danger">
							@foreach($errors->all() as $err)
							{{$err}}<br>
							@endforeach
						</div>
					@endif -->

                    <div class="modal-body">
                    	@if(Auth::check())
						<div class="form-group">
                            <label style="font-weight: bold; color: #000">Mật khẩu hiện tại*</label>
                            <input type="password" id="old_e_password_{{Auth::user()->id}}" required name="old_password" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label style="font-weight: bold; color: #000">Mật khẩu mới*</label>
                            <input type="password" id="e_password_{{Auth::user()->id}}" required name="password" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label style="font-weight: bold; color: #000">{{ trans('home.repassword') }}*</label>
                            <input type="password" id="e_re_password_{{Auth::user()->id}}" required name="re_password" class="form-control" />
                        </div>
						@endif



                    </div>
                    <div class="modal-footer">
<!-- 	                        <button type="submit" class="btn btn-success" data-dismiss="modal"><i class="icofont icofont-check-circled"></i>{{ trans('home.cancel') }}</button> -->
	                        <button type="submit"  class="btn btn-primary"><i class="icofont icofont-check-circled"></i>{{ trans('home.up_date') }}</button>
                    </div>
                </form>

            </div>
        </div>
    </div>