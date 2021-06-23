@extends('layouts.app')
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-0">
                <div class="panel panel-default">
                    <div class="panel-heading">Number of employees with Premium Employee plan with working hours less than 80 hrs/month</div>

                    <div class="panel-body">
                        @if (session('status'))
                            <div class="alert alert-success">
                                {{ session('status') }}
                            </div>
                        @endif
                                    <h4>Number of employees:
                                    <br><br>
                                        {{$number[0]->count}}</h4>

                                    <br>


                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

