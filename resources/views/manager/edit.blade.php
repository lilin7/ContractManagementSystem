@extends('layouts.app')
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-0">
                <div class="panel panel-default">
                    <div class="panel-heading">Allocate Employee to Contract</div>

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

                            <a>Contract ID: </a>
                            <a>{{ $contract->id }}</a>

                            @foreach ($staffs as $staff)
                            <form action="{{ url('/staff/'.Auth::user()->id.'/current_contract') }}" method="post">
                            {!! csrf_field() !!}

                                <div class="form-group">

                                    <label for="title"></label>
                                    <hr>
                                    <input type="hidden" value="{{$contract->id}}" name="contract">
                                    <input type="hidden" value="{{$staff->id}}" name="staff">

                                    <div class="article">
                                        <h4 >Staff ID: {{ $staff->id }}</h4>
                                        <h4>Name: {{ $staff->first_name }}   {{ $staff->last_name }}</h4>
                                    </div>

                                </div>

                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-4">
                                        <button type="submit" class="btn btn-primary">
                                            Add to Contract
                                        </button>
                                    </div>
                                </div>

                            </form>
                            @endforeach

                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

