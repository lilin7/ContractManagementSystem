@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <ul class= "col-md-2 col-md-offset-0">
            <li><a href="/creatClientAcount">CREATE ACCOUNT OF CLIENT</a></li>
            <li><a href="createContract">ADD NEW CONTRACT</a></li>
            <li><a href="#">EXISTING CONTRACT</a></li>
        </ul>
        <div class="col-md-8 col-md-offset-0">
            <div class="panel panel-default">
                <div class="panel-heading">Create New Contract</div>

                <div class="panel-body">
                    @if (session('status'))
                        <div class="alert alert-success">
                            {{ session('status') }}
                        </div>
                    @endif

                        <form action="{{ url('contracts') }}" method="post">
                            {!! csrf_field() !!}
                            <div class="form-group">
                                <label for="title">Select Company:</label>
                                <select name="companies" class="form-control" style="width:180px">
                                    <option value="">--- Select Company ---</option>
                                    @foreach ($companys as $company)
                                        <option value="{{ $company->id }}">{{ $company->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="title">Select Category:</label>
                                <select name="categories" class="form-control" style="width:180px">
                                    <option value="">--- Select Category ---</option>
                                    @foreach ($categories as $category)
                                        <option value="{{ $category->id }}">{{ $category->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <label for="title">deliverableStage: </label><br><input type="text" class="form-control" style="width:180px" name="deliverableStage"><br>
                            <label for="title">Initial Amount: </label><br><input type="text" class="form-control" style="width:180px" name="initialAmount"><br>
                            <button class="btn btn-lg btn-info">New Contract</button>
                        </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
