<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use App\Contract;
use App\Staff;
use APP\Timesheet;
use App\LineOfBusiness;
use Auth;

class tamController extends BaseController
{
    private function checkUser(){
        if(Auth::user()->hasRole('tam') && Auth::check())
            return true;
        return false;
    }

    public function index(){
        $cunrrentManager = Staff::where('user_id','=',Auth::user()->id)->firstOrFail();
        $businessLine = LineOfBusiness::where('TAM','=',$cunrrentManager->id)->get();
        $contract = \DB::table('contracts')
            ->select('contracts.*','line_of_businesses.line_name as line_name')
            ->join('line_of_businesses','contracts.business_line','=','line_of_businesses.id')
            ->where('line_of_businesses.TAM','=',$cunrrentManager->id)->get();
        //echo $contract;
        if($this->checkUser())
            return view('TAMDashboard')->with(['contracts'=>$contract]);
        else
            return redirect()->back()->withErrors('You are not authorized to access this resource.');
    }

    public function getMyManager($id){

        $contract = Contract::find($id);
        $cunrrentManager = Staff::where('user_id','=',Auth::user()->id)->firstOrFail();
        $manager = \DB::table('staff')
            ->select('staff.id','users.first_name','users.last_name','manager_contract.contract_id')
            ->leftJoin('users','staff.user_id','=','users.id')
            ->leftJoin('manager_contract','staff.id','=','manager_contract.manager_id')
            ->where('staff.manager_id','=',$cunrrentManager->id)
            ->where('staff.id','<>',$cunrrentManager->id)
            //->where('manager_contract.contract_id','<=>',$id)
            ->get();
        $managers = [];
        foreach ($manager as $e){
            if(!$e->contract_id)
                array_push($managers,$e);
        }

        return view('tam.allocateManager', compact("contract", "managers"));
    }


}
