<?php

namespace App\Http\Controllers;

use App\Company;
use Illuminate\Http\Request;
use App\Province;
use App\City;
use App\contractCategory;
use Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('home');
    }

    public function toDashboard()
    {
        $user = Auth::user();
        switch($user->role)
        {
            case 'admin':
                return redirect('adminHome');
                break;
            case 'company':
                return redirect('company');
                break;
            case 'sales':
                return redirect('sales');
                break;
            case 'employee':
                return redirect('employee');
                break;
            case 'manager':
                return redirect('manager');
                break;
            case 'tam':
                return redirect('tam');
                break;
        }
        return view('home');
    }

    public function myform()
    {
        return view('creatClientAcount')->withProvinces(Province::All());
    }

    public function getCompanyListandCategoryAjax()
    {
        $companys = Company::All();
        $categories = contractCategory::All();
        return view('createContract', compact('companys','categories'));
    }

    /**
     * Get Ajax Request and restun Data
     *
     * @return \Illuminate\Http\Response
     */
    public function myformAjax($id)
    {
       // echo '1';
        $cities = City::where("province_id",'=',$id)->get()->pluck("name","id");
        //return $cities;
        return response() ->json($cities,200);
    }
}
