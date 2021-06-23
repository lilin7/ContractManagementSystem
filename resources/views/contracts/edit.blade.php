@extends('layouts.app')
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-0">
                <div class="panel panel-default">
                    <div class="panel-heading">Create New Contract</div>

                    <div class="panel-body">
                        @if (session('status'))
                            <div class="alert alert-success">
                                {{ session('status') }}
                            </div>
                        @endif

                        <form action="{{ url('/contract/'.$contract->id.'/update') }}" method="post">
                            {!! csrf_field() !!}
                            <div class="form-group">
                                <label for="title">Select Company:</label>
                                <select name="companies" class="form-control" style="width:180px">

                                    <option value="{{ $contract->company_id }}">{{ $contract->company_name }}</option>
                                    @foreach ($companys as $company)
                                        <option value="{{ $company->id }}">{{ $company->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="title">Select Category:</label>
                                <select name="categories" class="form-control" style="width:180px">
                                    <option value="{{ $contract->category_id }}">{{ $contract->category_name }}</option>
                                    @foreach ($categories as $category)
                                        <option value="{{ $category->id }}">{{ $category->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            {{--<label for="title">deliverableStage: </label><br>--}}
                            {{--<input type="text" class="form-control" style="width:180px" name="deliverableStage" placeholder="{{ $contract->id }}" value="{{ $contract->deliverableStage }}"><br>--}}
                            <label for="title">Initial Amount: </label><br>
                            <input type="text" class="form-control" style="width:180px" name="initialAmount" placeholder="{{ $contract->initialAmount }}" value="{{ $contract->initialAmount }}"><br>

                            <label for="title">Payment: </label><br>
                            <input type="text" class="form-control" style="width:180px" name="payment" placeholder="{{ $contract->payment }}" value="{{ $contract->payment }}"><br>

                            <input type="hidden" value="{{$contract->id}}" name="id">
                            <button class="btn btn-lg btn-info">Update</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

