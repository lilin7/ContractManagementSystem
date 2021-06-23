<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Contract;
use App\Company;
use App\contractCategory;
use App\User;

class timesheetController extends Controller
{
    public function store(Request $request)
    {
        $this->validate($request, [
            'companies' => 'required|max:255',
            'category' => 'required',
        ]);

        $contract= new Contract;
        $contract->company_id = $request->get('companies');
        $contract->category = $request->get('category');
        $contract->deliverableStage = $request->get('deliverableStage');

        if ($contract->save()) {
            return redirect('sales');
        } else {
            return redirect()->back()->withInput()->withErrors('Failed！');
        }
    }

    public function edit($contractNumber)
    {
        $contract = \DB::table('contracts')
            ->select('contracts.*','companies.name as company_name','companies.id as company_id','contract_categories.name as category_name','contract_categories.id as category_id')
            ->join('companies','contracts.company_id','=','companies.id')
            ->join('contract_categories','contracts.category','=','contract_categories.id')
            ->where('contracts.id','=',$contractNumber)
            ->first();

        $companys = Company::All();
        $categories = contractCategory::All();
        return view('contracts.edit', compact("contract", "companys", "categories"));
    }

    public function update(Request $request)
    {
        $this->validate($request, [
            'companies' => 'required|max:255'
        ]);
        $id = $request->get('id');
        $contract = Contract::find($id);
        $contract->company_id = $request->get('companies');
        $contract->category = $request->get('categories');
        $contract->deliverableStage = $request->get('deliverableStage');
        $contract->initialAmount = $request->get('initialAmount');
        if ($contract->save()) {
            return redirect('dashboard');
        } else {
            return redirect()->back()->withInput()->withErrors('Failed！');
        }
    }

    public function destroy($id)
    {
        Contract::find($id)->delete();
        return redirect()->back()->withInput()->withErrors('Success！');
    }
}