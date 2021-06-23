@extends('layouts.app')
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <div class="panel panel-default">

                    <div class="panel-heading">View contracts from all clients by category</div>
                    <div class="panel-body">

                        <div class="form-group">
                            <label for="title" class="col-md-4 control-label">Select Category:</label>
                            <div class="col-md-6">
                                <select name="category" class="form-control">
                                    <option value="0">--- ALL  ---</option>
                                    @foreach ($contractCategories as $contractCategory)
                                        <option value="{{ $contractCategory->id }}">{{ $contractCategory->name }}</option>
                                    @endforeach
                                </select>

                                <input type="checkbox" class="form-check-input" name="onlyMyContract">
                                <label class="form-check-label" for="exampleCheck1">Show all Contract</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
                            <div name="contract_list">
                                @foreach ($contracts as $contract)
                                    <hr>
                                    <div class="article">
                                        <h4>{{ $contract->id }}</h4>
                                        <div class="content">
                                            <p>
                                                {{ $contract->status }}
                                            </p>
                                            <p>
                                                {{ $contract->created_at }}
                                            </p>
                                        </div>
                                    </div>
                                    <div>
                                        <a href="{{ url('/manager/'.$contract->id.'/contractHour') }}" class="btn btn-success">Number of Hours and Employee</a>
                                        <a href="{{ url('/manager/'.$contract->id.'/getMyEmployee') }}" class="btn btn-success">Allocate Employee</a>
                                        <a href="{{ url('/manager/'.$contract->id.'/removeMyEmployee') }}" class="btn btn-danger">Remove employee</a>
                                    </div>
                                @endforeach
                            </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

