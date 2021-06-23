<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class RegisterStaffController extends Controller
{
    /**
     * Store a new user.
     *
     * @param  Request  $request
     * @return Response
     */
    public function store(Request $request)
    {
        dd($request->all());
        // TODO; store in database
        // => redirect to success or failure.
    }
}