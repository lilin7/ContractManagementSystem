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
                                                {{ $contract->satissfactionScore }}
                                            </p>
                                            <p>
                                                {{ $contract->created_at }}
                                            </p>
                                            <p>
                                                {{ $contract->first_name }} {{ $contract->last_name }}
                                            </p>
                                            <p>
                                                {{ $contract->avg_score }}
                                            </p>
                                            @if($contract->hasScore)
                                                <form action="{{ url('rateMyManager') }}" method="post">
                                                    <div class="form-group">
                                                        <label for="title">Rate my Manager:</label>
                                                        <select name="score" class="form-control" style="width:180px">
                                                            <option value="0">0</option>
                                                            <option value="1">1</option>
                                                            <option value="2">2</option>
                                                            <option value="3">3</option>
                                                            <option value="4">4</option>
                                                            <option value="5">5</option>
                                                            <option value="6">6</option>
                                                            <option value="7">7</option>
                                                            <option value="8">8</option>
                                                            <option value="9">9</option>
                                                            <option value="10">10</option>
                                                        </select>
                                                    </div>
                                                    <input type="text" class="form-control" name="contract_id" style="display:none" value={{ $contract->id }}>
                                                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                                    <button class="btn btn-lg btn-info">Rate</button>
                                                </form>
                                            @endif
                                        </div>
                                    </div>

                            @endforeach
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

