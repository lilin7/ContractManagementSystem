@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-0">
            <div class="panel panel-default">
                <div class="panel-heading">You are logged in!</div>

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

                        <form class="form-horizontal" action="{{ url('/staff/'.Auth::user()->id.'/update') }}" method="post">
                        {!! csrf_field() !!}

                            <div class="form-group">
                                <label for="title" class="col-md-4 control-label">Select Category:</label>
                                <div class="col-md-6">
                                    <select name="category" class="form-control">
                                        <option value="">--- Select Category ---</option>
                                        @foreach ($contractCategories as $contractCategory)
                                            <option value="{{ $contractCategory->id }}">{{ $contractCategory->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="title" class="col-md-4 control-label">Select Insurance Plan:</label>
                                <div class="col-md-6">
                                    <select name="insurancePlan" class="form-control">
                                        <option value="">--- Select Insurance Plan ---</option>
                                        @foreach ($insurancePlans as $insurancePlan)
                                            <option value="{{ $insurancePlan->plan_id }}">{{ $insurancePlan->insuranceType }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-4">
                                    <button type="submit" class="btn btn-primary">
                                        Save
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
