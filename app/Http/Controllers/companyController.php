<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Company;
use App\User;
use App\Contract;
use Auth;

class companyController extends Controller
{
    public function index(){
        $user = Auth::user();
        $currentCompany = Company::where('user_id','=',$user->id)->firstOrFail();
        $contracts = \DB::select( \DB::raw("select AVG(contracts.satissfactionScore) as score, staff.id from contracts
                    left join staff on contracts.manager_staffid = staff.id
                    left join users on staff.user_id = users.id
                    group by contracts.manager_staffId;") );

        $contracts_currentClient =  \DB::table('contracts')
            ->select('contracts.*','users.first_name','users.last_name')
            ->where('company_id','=',$currentCompany->id)
            ->leftjoin('staff','contracts.manager_staffId','staff.id')
            ->leftjoin('users','users.id','staff.user_id')
            ->get();

        //echo $contracts_currentClient;
        foreach($contracts_currentClient as $e_1){
            $e_1->hasScore = false;
            foreach($contracts as $e_2){
                if($e_1->manager_staffId == $e_2->id){
                    $e_1->avg_score = $e_2->score;
                }
            }
            if(!$e_1->satissfactionScore){
                $e_1->hasScore = true;
            }
        }
        //echo $contracts_currentClient;
        //print_r($contracts_currentClient);
        return view('clientDashboard')->with(['contracts'=>$contracts_currentClient]);
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'CompanyName' => 'required|max:255',
            'Responsible' => 'required',
        ]);



        $user = new User;
        $user->first_name = $request->get('CompanyName');
        $user->email = $request->get('email');
        $user->password = bcrypt($request->get('password'));
        $user->role = 'company';

        $company = new Company;
        $company->name = $request->get('CompanyName');
        $company->responsible = $request->get('Responsible');
        $company->phoneNumber = $request->get('Phone');
        $company->email =$request->get('email');
        $company->province =$request->get('provinces');
        $company->city =$request->get('city');

        if ($user->save()) {
            $userTemp = User::where('email','=',$request->get('email'))->firstOrFail();
            $company->user_id = $userTemp->id;
            if($company->save())
                return redirect('sales');
        } else {
            return redirect()->back()->withInput()->withErrors('Failed！');
        }
    }

    public function rateMyManager(Request $request){
        $this->validate($request, [
            'contract_id' => 'required|max:255',
            'score' => 'required',
        ]);
        $id = $request->get('contract_id');
        $contract = Contract::where('id','=',$id)->first();
        $contract->satissfactionScore = $request->get('score');
        //echo $request->get('contract_id');
        //echo $contract->satissfactionScore;
        //echo $contract;
        if ($contract->save()) {
            return redirect('dashboard')->withErrors('Successed!！');
        } else {
            return redirect()->back()->withInput()->withErrors('Failed！');
        }
    }
}