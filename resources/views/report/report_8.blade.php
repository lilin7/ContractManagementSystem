@extends('layouts.app')
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-0">
                <div class="panel panel-default">
                    <div class="panel-heading">Give a list of all the contracts in the “Diamond” category. </div>

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
                                    <h4>Company ID: {{ $returnResult->company_id }}</h4>
                                    <h4>Company Name: {{ $returnResult->name }}</h4>
                                    <h4>Status: {{ $returnResult->status }}</h4>
                                    <br>
                                </form>
                            @endforeach

                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

