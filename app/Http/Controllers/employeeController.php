<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Company;
use App\User;
use App\contractCategory;
use App\insurancePlan;
use App\Staff;
use Auth;

class employeeController extends Controller
{

    private function checkUser(){
        if(Auth::user()->hasRole('employee') && Auth::check())
            return true;
        return false;
    }

    public function index()
    {
        if($this->checkUser()) {
            $contractCategories = contractCategory::All();
            $insurancePlans = insurancePlan::All();
            return view('employeeDashboard')
                ->with( ['insurancePlans' => $insurancePlans] )
                ->with( ['contractCategories' => $contractCategories] );
        } else {
            return redirect()->back()->withErrors('You are not authorized to access this resource.');
        }
    }

    public function update(Request $request){

        $this->validate($request, [
            'category' => 'required|max:255',
            'insurancePlan' => 'required|max:255'
        ]);
        $user = Staff::where('user_id','=',Auth::user()->id)->firstOrFail();
        $user->contract_category = $request->get('category');
        $user->insurance_plan = $request->get('insurancePlan');
        //echo $user;
        if ($user->save()) {
            return redirect()->back()->withInput()->withErrors('Success！');
        } else {
            return redirect()->back()->withInput()->withErrors('Failed！');
        }
    }

    public function current_contract(Request $request){

        $this->validate($request, [
            'contract' => 'required|max:255'
        ]);
        $user = Staff::where('id','=',$request->get('staff'))->firstOrFail();
        $user->current_contract = $request->get('contract');
        //echo $user;
        if ($user->save()) {
            return redirect()->back()->withInput()->withErrors('Success！');
        } else {
            return redirect()->back()->withInput()->withErrors('Failed！');
        }
    }

    public function remove_contract(Request $request){

        $this->validate($request, [
            'staff' => 'required|max:255'
        ]);
        $user = Staff::where('id','=',$request->get('staff'))->firstOrFail();
        $user->current_contract = null;
        //echo $user->current_contract;
        if ($user->save()) {
            return redirect()->back()->withInput()->withErrors('Success！');
        } else {
            return redirect()->back()->withInput()->withErrors('Failed！');
        }
    }

}