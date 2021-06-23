@extends('layouts.app')
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-0">
                <div class="panel panel-default">
                    <div class="panel-heading">Give the details of the contracts recorded within the last 10 days in all categories by sales associate. </div>

                    <div class="panel-body">
                        @if (session('status'))
                            <div class="alert alert-success">
                                {{ session('status') }}
                            </div>
                        @endif
                            @foreach ($returnResults as $returnResult)
                                <form method="post">
                                    {!! csrf_field() !!}
                                    <h4>Contract ID: {{ $returnResult->id }}</h4>
                                    <h4>Created Date: {{ $returnResult->created_at }}</h4>
                                    <h4>Staff ID: {{ $returnResult->staff_id }}</h4>
                                    <h4>Staff name: {{ $returnResult->first_name }} {{ $returnResult->last_name }}</h4>
                                    <br>
                                </form>
                            @endforeach

                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

