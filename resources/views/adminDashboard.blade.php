@extends('layouts.app')
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">

                <a href="{{ url('/report') }}" class="btn btn-success">Get Reports</a>
                <br>
                <br>
                <br>

                <div class="panel panel-default">

                    <div class="panel-heading">Contract List</div>
                    <div class="panel-body">
                        @if (count($errors) > 0)
                            <div class="alert alert-danger">
                                {!! implode('<br>', $errors->all()) !!}
                            </div>
                        @endif

                        @foreach ($contracts as $contract)
                            <hr>
                            <div class="article">
                                <h4>{{ $contract->id }}</h4>
                                <div class="content">
                                    <p>
                                        {{ $contract->status }}
                                    </p>
                                </div>
                            </div>
                            <div>
                                <a href="{{ url('/contract/'.$contract->id.'/edit') }}" class="btn btn-success">Edit</a>
                                <a href="{{ url('/contract/'.$contract->id.'/delete') }}" class="btn btn-danger">Delete</a>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

