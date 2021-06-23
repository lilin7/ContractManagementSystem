<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use App\Contract;
use Auth;

class adminController extends BaseController
{
    private function checkUser(){
        if(Auth::user()->hasRole('admin') && Auth::check())
            return true;
        return false;
    }

    public function index(){
        if($this->checkUser())
            return view('adminDashboard')->withContracts(Contract::All());
        else
            return redirect()->back()->withErrors('You are not authorized to access this resource.');
    }

}
