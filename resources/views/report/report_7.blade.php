@extends('layouts.app')
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-0">
                <div class="panel panel-default">
                    <div class="panel-heading">Fetch all the details of the employees from the “Quebec” province. </div>

                    <div class="panel-body">
                        @if (session('status'))
                            <div class="alert alert-success">
                                {{ session('status') }}
                            </div>
                        @endif
                            @foreach ($returnResults as $returnResult)
                                <form method="post">
                                    {!! csrf_field() !!}
                                    <h4>Staff ID: {{ $returnResult->id }}</h4>
                                    <h4>Staff name: {{ $returnResult->first_name }} {{ $returnResult->last_name }}</h4>
                                    <h4>Insurance Plan: {{ $returnResult->insurance_plan }}</h4>
                                    <h4>Manager ID: {{ $returnResult->manager_id }}</h4>
                                    <br>
                                </form>
                            @endforeach

                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

