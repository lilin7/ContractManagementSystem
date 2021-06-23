@extends('layouts.app')
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-0">
                <div class="panel panel-default">
                    <div class="panel-heading">Number of Premium contracts delivered in more than 10 business days having more than 15 employees with "Silver Employee Plan"</div>

                    <div class="panel-body">
                        @if (session('status'))
                            <div class="alert alert-success">
                                {{ session('status') }}
                            </div>
                        @endif
                                    <h4>Number of Premium contracts:
                                    <br><br>
                                        {{$number[0]->count}}</h4>
                                    <br>


                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

