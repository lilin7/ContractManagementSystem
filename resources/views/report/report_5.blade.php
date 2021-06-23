@extends('layouts.app')
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-0">
                <div class="panel panel-default">
                    <div class="panel-heading">Give a list of clients who have the highest number of contracts in each line of business</div>

                    <div class="panel-body">
                        @if (session('status'))
                            <div class="alert alert-success">
                                {{ session('status') }}
                            </div>
                        @endif
                            @foreach ($returnResults as $returnResult)
                                <form method="post">
                                    {!! csrf_field() !!}
                                    <h4>Business line: {{ $returnResult->line_name }}</h4>
                                    <h4>Company ID: {{ $returnResult->id }}</h4>
                                    <h4>Company Name: {{ $returnResult->name }}</h4>
                                    <h4>Total Contacts Number: {{ $returnResult->T }}</h4>
                                    <br>
                                </form>
                            @endforeach

                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

