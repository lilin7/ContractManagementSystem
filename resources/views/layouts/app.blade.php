<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name') }}</title>

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body>
    <div id="app">
        <nav class="navbar navbar-default navbar-static-top">
            <div class="container">
                <div class="navbar-header">

                    <!-- Collapsed Hamburger -->
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#app-navbar-collapse">
                        <span class="sr-only">Toggle Navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <!-- Branding Image -->
                    <a class="navbar-brand" href="{{ url('/') }}">
                        {{ config('app.name') }}
                    </a>
                </div>

                <div class="collapse navbar-collapse" id="app-navbar-collapse">
                    <!-- Left Side Of Navbar -->
                    <ul class="nav navbar-nav">
                        &nbsp;
                    </ul>

                    <!-- Right Side Of Navbar -->
                    <ul class="nav navbar-nav navbar-right">
                        <!-- Authentication Links -->
                        @if (Auth::guest())
                            <li><a href="{{ route('login') }}">Login</a></li>
                            <li><a href="{{ route('register') }}">Register</a></li>
                        @else
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                    {{ Auth::user()->name }} <span class="caret"></span>
                                </a>

                                <ul class="dropdown-menu" role="menu">
                                    <li>
                                        <a href="{{ route('logout') }}"
                                            onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                            Logout
                                        </a>
                                        <a href="home">My Account</a>
                                        <a href="dashboard">Dashboard</a>
                                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                            {{ csrf_field() }}
                                        </form>
                                    </li>
                                </ul>
                            </li>
                        @endif
                    </ul>
                </div>
            </div>
        </nav>

        @yield('content')
    </div>

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('select[name="provinces"]').on('change', function() {
                var stateID = $(this).val();
                console.log("Province ID: "+stateID);
                if(stateID) {
                    $.ajax({
                        url: '/myform/ajax/'+stateID,
                        type: "GET",
                        dataType: "json",
                        success:function(data) {
                            console.log("return data: "+data);
                            $('select[name="city"]').empty();
                            $.each(data, function(key, value) {
                                console.log("value: "+value);
                                $('select[name="city"]').append('<option value="'+ key +'">'+ value +'</option>');
                            });


                        }
                    });
                }else{
                    $('select[name="city"]').empty();
                }
            });
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            $('select[name="category"]').on('change', function() {
                var showAll = $('input[name="onlyMyContract"]').is(':checked') ? 1:0;
                var categoryID = $(this).val();//
                console.log("Category ID: "+categoryID);
                console.log("Show all: "+showAll);
                if(categoryID) {
                    var data = {
                        "categoryID":categoryID,
                        "showAll":showAll,
                        _token:$('meta[name="csrf-token"]').attr('content')
                    };
                    $.ajax({
                        url: '/getContractById',
                        type: "POST",
                        beforeSend: function (xhr) {
                            var token = $('meta[name="csrf_token"]').attr('content');

                            if (token) {
                                return xhr.setRequestHeader('X-CSRF-TOKEN', token);
                            }
                        },
                        data:  data,
                        dataType: "json",
                        success:function(data) {
                            $('div[name="contract_list"]').html('');
                            if(data){
                                $.each(data, function(index,element) {
                                    console.log("is managed by current manager: "+data[index]['isManagedByCurrentManager']);
                                    if(data[index]['isManagedByCurrentManager']){
                                        $('div[name="contract_list"]').append('<hr><div class="article"><h4>'
                                            + data[index]['id']
                                            + '</h4><div class="content">'
                                            +'<p>'+data[index]['status']+'</p>'
                                            +'<p>'+data[index]['created_at']+'</p>'
                                            +'</div></div><div>'
                                            +'<a href="/manager/\''+data[index]['id']+'\'/contractHour" class="btn btn-success">Number of Hours and Employee</a> '
                                            +'<a href="/manager/\''+data[index]['id']+'\'/contractHour" class="btn btn-success">Allocate Employee</a> '
                                            +'<a href="/manager/\''+data[index]['id']+'\'/getMyEmployee" class="btn btn-danger">Remove employee</a></div>');
                                    }
                                    else{
                                        $('div[name="contract_list"]').append('<hr><div class="article"><h4>'
                                            + data[index]['id']
                                            + '</h4><div class="content">'
                                            +'<p>'+data[index]['status']+'</p>'
                                            +'<p>'+data[index]['created_at']+'</p>'
                                            +'</div></div>');
                                    }
                                });
                            }else{
                                $('div[name="contract_list"]').html('');
                            }

                        }
                    });
                }
            });
        });
    </script>

    {{--<script>--}}
        {{--todo--}}
    {{--</script>--}}
</body>
</html>
