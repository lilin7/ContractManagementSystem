@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <ul class= "col-md-2 col-md-offset-0">
            <li><a href="/creatClientAcount">CREATE ACCOUNT OF CLIENT</a></li>
            <li><a href="#">ADD NEW CONTRACT</a></li>
            <li><a href="#">EXISTING CONTRACT</a></li>
        </ul>
        <div class="col-md-8 col-md-offset-0">
            <div class="panel panel-default">
                <div class="panel-heading">Create Account of Client</div>

                <div class="panel-body">
                    @if (session('status'))
                        <div class="alert alert-success">
                            {{ session('status') }}
                        </div>
                    @endif
                        @if (count($errors) > 0)
                            <div class="alert alert-danger">
                                {!! implode('<br>', $errors->all()) !!}
                            </div>
                        @endif

                        <form class="form-horizontal" action="{{ url('companys') }}" method="post">
                            {!! csrf_field() !!}

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="title">Company Name: </label>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" name="CompanyName"><br>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="title">Responsible: </label>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" name="Responsible"><br>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="title">Phone Number:</label>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" name="Phone"><br>
                                </div>
                            </div>

                            <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                                <label for="email" class="col-md-4 control-label">E-Mail Address</label>

                                <div class="col-md-6">
                                    <input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}" required>

                                    @if ($errors->has('email'))
                                        <span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                                <label for="password" class="col-md-4 control-label">Password</label>

                                <div class="col-md-6">
                                    <input id="password" type="password" class="form-control" name="password" required>

                                    @if ($errors->has('password'))
                                        <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="password-confirm" class="col-md-4 control-label">Confirm Password</label>

                                <div class="col-md-6">
                                    <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="title" class="col-md-4 control-label">Select Province:</label>
                                <div class="col-md-6">
                                    <select name="provinces" class="form-control">
                                        <option value="">--- Select State ---</option>
                                        @foreach ($provinces as $province)
                                            <option value="{{ $province->id }}">{{ $province->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="title" class="col-md-4 control-label">Select City:</label>
                                <div class="col-md-6">
                                    <select name="city" class="form-control">
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-4">
                                    <button type="submit" class="btn btn-primary">
                                        New Client
                                    </button>
                                </div>
                            </div>
                        </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
