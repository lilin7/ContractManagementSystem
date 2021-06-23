@extends('layouts.app')
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-0">
                <div class="panel panel-default">
                    <div class="panel-heading">Generate one report for each category that indicates the clients whose contracts have the highest satisfaction scores in that category, grouped by the cities of clients.</div>

                    <div class="panel-body">
                        @if (session('status'))
                            <div class="alert alert-success">
                                {{ session('status') }}
                            </div>
                        @endif
                            @foreach ($returnResults as $returnResults)
                                <form method="post">
                                    {!! csrf_field() !!}
                                    <h4>Category: {{ $returnResults->category }}</h4>
                                    <h4>Company Name: {{ $returnResults->name }}</h4>
                                    <h4>Satisfaction scores: {{ $returnResults->score }}</h4>
                                    <br>
                                </form>
                            @endforeach





                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

