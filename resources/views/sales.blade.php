@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <ul class= "col-md-2 col-md-offset-0">
            <li><a href="/creatClientAcount">CREATE ACCOUNT OF CLIENT</a></li>
            <li><a href="createContract">ADD NEW CONTRACT</a></li>
            <li><a href="existContract">EXISTING CONTRACT</a></li>
        </ul>
        <div class="col-md-8 col-md-offset-0">
            <div class="panel panel-default">
                <div class="panel-heading">You are logged in!</div>

                <div class="panel-body">
                    @if (session('status'))
                        <div class="alert alert-success">
                            {{ session('status') }}
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
