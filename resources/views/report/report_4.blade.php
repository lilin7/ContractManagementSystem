@extends('layouts.app')
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-0">
                <div class="panel panel-default">
                    <div class="panel-heading">Highest revenue line of business and responsible Technical Account Managers</div>

                    <div class="panel-body">
                        @if (session('status'))
                            <div class="alert alert-success">
                                {{ session('status') }}
                            </div>
                        @endif
                            @foreach ($returnResults as $returnResult)
                                <form method="post">
                                    {!! csrf_field() !!}
                                    <h4>Business Line: {{ $returnResult->line }}</h4>
                                    <h4>TAM: </h4>
                                    <h4>First Name: {{ $returnResult->firstName}}</h4>
                                    <h4>Last Name: {{ $returnResult->lastName }}</h4>
                                    <br>
                                </form>
                            @endforeach

                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

