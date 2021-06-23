@extends('layouts.app')
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-0">
                <div class="panel panel-default">
                    <div class="panel-heading">Number of Hours and Employee Works on the Contract.</div>

                    <div class="panel-body">
                        @if (session('status'))
                            <div class="alert alert-success">
                                {{ session('status') }}
                            </div>
                        @endif

                        <form method="post">
                            {!! csrf_field() !!}

                            <h4>Contract ID: {{ $contract->id }}</h4>
                            <h4>Number of Employee: {{ count($staffs) }}</h4>
                            <h4>Number of Hour: {{ $staffsTotalHour }}</h4>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

