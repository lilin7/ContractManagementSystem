@extends('layouts.app')
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <div class="panel panel-default">
                    <div class="panel-heading">Contract List</div>
                    <div class="panel-body">
                        @if (count($errors) > 0)
                            <div class="alert alert-danger">
                                {!! implode('<br>', $errors->all()) !!}
                            </div>
                        @endif

                        @foreach ($contracts as $contract)
                            <hr>
                            <div class="article">
                                <h4>{{ $contract->id }}</h4>
                                <div class="content">
                                    <p>
                                        {{ $contract->status }}
                                    </p>
                                </div>
                            </div>
                            <div>
                                {{--<a href="{{ url('/manager/'.$contract->id.'/contractHour') }}" class="btn btn-success">Number of Hours and Employee</a>--}}
                                <a href="{{ url('/tam/'.$contract->id.'/getMyManager') }}" class="btn btn-success">Allocate Manager</a>
                                {{--<a href="{{ url('/manager/'.$contract->id.'/removeMyEmployee') }}" class="btn btn-danger">Remove employee</a>--}}
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

