@extends('layouts.app')
@section('head')
<style>
    table {
        margin-left: 40px !important;
    }
    th, td {
        padding: 10px !important;
        text-align: left;
    }
</style>
@section('content')

    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <div class="panel panel-default">
                    <div class="panel-heading">Report List</div>
                    <div class="panel-body">
                        @if (count($errors) > 0)
                            <div class="alert alert-danger">
                                {!! implode('<br>', $errors->all()) !!}
                            </div>
                        @endif

                        <table>
                            <tr>
                                <td><a href="{{ url('premiumEmployeeWorkLessThan80H') }}" class="btn btn-success">Report 1</a></td>
                                <td>Number of employees with Premium Employee plan with working hours less than 80 hrs/month.</td >
                            </tr>
                            <tr>
                                <td><a href="{{ url('numberOfPremium10Days15Employees') }}" class="btn btn-success">Report 2</a></td>
                                <td>Number of Premium contracts delivered in more than 10 business days having more than 15 employees with “Silver Employee Plan”</td>
                            </tr>
                            <tr>
                                <td><a href="{{ url('comparisionDeliverySchedule') }}" class="btn btn-success">Report 3</a></td>
                                <td>Comparison of a delivery schedule of “First deliverable” of all type of contracts (Premium/Diamond etc.) in year 2017 each month.</td>
                            </tr>
                            <tr>
                                <td><a href="{{ url('highestRevenue') }}" class="btn btn-success">Report 4</a></td>
                                <td>Highest revenue line of business and responsible Technical Account Managers</td>
                            </tr>
                            <tr>
                                <td><a href="{{ url('getClientWithMostContracts') }}" class="btn btn-success">Report 5</a></td>
                                <td>Give a list of clients who have the highest number of contracts in each line of business</td>
                            </tr>
                            <tr>
                                <td><a href="{{ url('tenDaysContracts') }}" class="btn btn-success">Report 6</a></td>
                                <td>Give the details of the contracts recorded within the last 10 days in all categories by sales associate</td>
                            </tr>
                            <tr>
                                <td><a href="{{ url('quebecEmployee') }}" class="btn btn-success">Report 7</a></td>
                                <td>Fetch all the details of the employees from the “Quebec”province.</td>
                            </tr>
                            <tr>
                                <td><a href="{{ url('diamondContract') }}" class="btn btn-success">Report 8</a></td>
                                <td>Give a list of all the contracts in the “Diamond”category</td>
                            </tr>

                            <tr>
                                <td><a href="{{ url('highestSatisfaction') }}" class="btn btn-success">Report 9</a></td>
                                <td>Generate one report for each category that indicates the clients whose contracts have the highest satisfaction scores in that category, grouped by the cities of clients</td>
                            </tr>

                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

