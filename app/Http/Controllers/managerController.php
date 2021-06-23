<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use App\Contract;
use App\contractCategory;
use App\Staff;
use APP\Timesheet;
use Auth;
use Illuminate\Http\Request;

class managerController extends BaseController
{
    private function checkUser(){
        if(Auth::user()->hasRole('manager') && Auth::check())
            return true;
        return false;
    }

    public function index(){
        if($this->checkUser()){
            $cunrrentManager = Staff::where('user_id','=',Auth::user()->id)->firstOrFail();
            $contract = Contract::where('manager_staffId','=',$cunrrentManager->id)->get();
            $contractCategories = contractCategory::All();

            return view('managerDashboard')
                ->with(['contracts'=>$contract])
                ->with(['contractCategories'=>$contractCategories]);
        }
        else{
            return redirect()->back()->withErrors('You are not authorized to access this resource.');
        }

    }

    public function getContractById(Request $request){
//        echo 'request: ';
//        echo $request;
        $cunrrentManager = Staff::where('user_id','=',Auth::user()->id)->firstOrFail();
        if($this->checkUser()){
            if($request->get('showAll')){
                if($request->get('categoryID') == 0){
                    $contract = Contract::orderBy('created_at')->get();
                }
                else{
                    $contract = Contract::where('category','=',$request->get('categoryID'))->get();
                }
            }
            else{
                if($request->get('categoryID') == 0){
                    $contract = Contract::where('manager_staffId','=',$cunrrentManager->id)
                        ->get();
                }
                else{
                    $contract = Contract::where('manager_staffId','=',$cunrrentManager->id)
                        ->where('category','=',$request->get('categoryID'))
                        ->get();
                }
            }
            foreach($contract as $e){
                if($e['manager_staffId'] == $cunrrentManager['id'])
                    $e['isManagedByCurrentManager'] = true;
                else
                    $e['isManagedByCurrentManager'] = false;
            }
            return response() ->json($contract,200);
            //echo $contract[0]['manager_staffId'];
        }
        else{
            return redirect()->back()->withErrors('You are not authorized to access this resource.');
        }

    }

    public function contractHour($id){
        $contract = Contract::find($id);
        $cunrrentManager = Staff::where('user_id','=',Auth::user()->id)->firstOrFail();
        $staffs = \DB::table('staff')->select('staff.id','users.first_name','users.last_name')
            ->where('manager_id','=',$cunrrentManager->id)
            ->where('contract_category','=',$contract->category)
            ->where('current_contract','=',$contract->id)
            ->join('users','staff.user_id','=','users.id')
            ->join('timesheets','staff.id','=','timesheets.employee_staffId')
            ->get();
        $staffsTotalHour = \DB::table('staff')->select('staff.id','users.first_name','users.last_name')
            ->where('manager_id','=',$cunrrentManager->id)
            ->where('contract_category','=',$contract->category)
            ->where('current_contract','=',$contract->id)
            ->join('users','staff.user_id','=','users.id')
            ->join('timesheets','staff.id','=','timesheets.employee_staffId')
            ->sum('timesheets.working_hour');
        //echo $staffs;
        return view('contracts.contractHourAndEmployee', compact("staffs", "contract","staffsTotalHour"));
    }

    public function getMyEmployee($id){
        $contract = Contract::find($id);
        $cunrrentManager = Staff::where('user_id','=',Auth::user()->id)->firstOrFail();
        $staffs = \DB::table('staff')->select('staff.id','users.first_name','users.last_name')
            ->where('manager_id','=',$cunrrentManager->id)
            ->where('contract_category','=',$contract->category)
            ->where('current_contract','<>',$contract->id)
            ->join('users','staff.user_id','=','users.id')
            ->get();
        return view('manager.edit', compact("staffs", "contract"));
    }

    public function removeMyEmployee($id){
        $contract = Contract::find($id);
        $cunrrentManager = Staff::where('user_id','=',Auth::user()->id)->firstOrFail();
        $staffs = \DB::table('staff')->select('staff.id','users.first_name','users.last_name')
            ->where('manager_id','=',$cunrrentManager->id)
            ->where('contract_category','=',$contract->category)
            ->where('current_contract','=',$contract->id)
            ->join('users','staff.user_id','=','users.id')
            ->get();
        return view('manager.removeEmployee', compact("staffs", "contract"));
    }

}
