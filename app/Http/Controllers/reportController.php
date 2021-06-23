<?php

namespace App\Http\Controllers;
use Carbon\Carbon;

use Illuminate\Http\Request;
use App\Contract;
use App\Company;
use App\contractCategory;
use App\User;
use App\Staff;

class reportController extends Controller
{
    public function getReport(){


        return view('reportDashboard');

    }

    public function premiumEmployeeWorkLessThan80H(){
        $returnResult  = \DB::select("SELECT COUNT(timesheets.id) as count
                      FROM timesheets, staff
                      WHERE working_hour< 80 
                      AND staff.insurance_plan = 1 
                      AND timesheets.employee_staffId = staff.id;");
        return view('report.report_1')->with(['number'=>$returnResult]);
    }

    public function numberOfPremium10Days15Employees(){
        $returnResult  = \DB::select("SELECT COUNT(contracts.id) as count
FROM contracts
WHERE 
	contracts.category = 3
		AND 
    ((contracts.third_deliverable - contracts.created_at )>10)
		AND
    (contracts.id IN 
			(
				SELECT TEMP2.contract_number
				FROM 
					(SELECT E, TEMP1.contract_number
					FROM
						(SELECT COUNT(TEMP3.employee_staffId) AS E, TEMP3.contract_number
						FROM 
							(
								SELECT timesheets.employee_staffId, timesheets.contract_number
								FROM timesheets, staff
								WHERE timesheets.employee_staffId = staff.id
								AND staff.insurance_plan = 2
                            ) AS TEMP3
						GROUP BY TEMP3.contract_number
                        ) AS TEMP1
					WHERE E>15
                    ) AS TEMP2
			)
    );
");
        return view('report.report_2')->with(['number'=>$returnResult]);
    }

    public function comparisionDeliverySchedule(){
        $returnResult  = \DB::select("SELECT count(contracts.company_id) as totalNumber, 
companies.name as name, contracts.company_id as id, 
line_of_businesses.line_name FROM test.contracts 
left join companies on contracts.company_id = companies.id 
left join line_of_businesses on contracts.business_line = line_of_businesses.id group by company_id;");
        //TODO: above qurey need to be modified when delivery function works
        //TODO: need to draw a table???
        //print_r($returnResult);
        return view('report.report_3')->with(['returnResults'=>$returnResult]);
        //echo $returnResult;
    }

    public function highestRevenue(){
        $returnResult  = \DB::select("
SELECT line_of_businesses.line_name AS line, users.first_name AS firstName, users.last_name AS lastName
FROM line_of_businesses, users, 
		(SELECT contracts.business_line, SUM(contracts.initialAmount) AS sumAmount
		FROM contracts
		GROUP BY contracts.business_line
		ORDER BY sumAmount DESC
		LIMIT 1) AS TEMP1
WHERE 
		line_of_businesses.TAM = users.id
        AND
		line_of_businesses.id = TEMP1.business_line;
        
        ");
        //print_r($returnResult);
        return view('report.report_4')->with(['returnResults'=>$returnResult]);
        //echo $returnResult;
    }

    public function getClientWithMostContracts(){
        $returnResult  = \DB::select("select MAX(totalNumber) AS T, name, id, line_name from
	(select count(contracts.company_id) as totalNumber, companies.name as name, contracts.company_id as id, line_of_businesses.line_name 
	FROM test.contracts 
	left join companies on contracts.company_id = companies.id 
	left join line_of_businesses on contracts.business_line = line_of_businesses.id 
	group by company_id) as temp
    group by line_name;");
        //print_r($returnResult);
        return view('report.report_5')->with(['returnResults'=>$returnResult]);
        //echo $returnResult;
    }
    public function tenDaysContracts(){
        $returnResult =  \DB::table('contracts')
                                ->select('contracts.*','staff.id as staff_id', 'users.first_name','users.last_name')
                                ->where('contracts.created_at','>',Carbon::now()->subDays(10))
                                ->leftjoin('staff','contracts.sales_id','staff.id')
                                ->leftjoin('users','users.id','staff.user_id')->get();
        return view('report.report_6')->with(['returnResults'=>$returnResult]);
        //echo $returnResult;
    }

    public function quebecEmployee(){
        $returnResult = \DB::table('staff')
                ->select('staff.*','users.first_name','users.last_name')
                ->where('hometown','=',1)
                ->leftjoin('users','staff.user_id','users.id')
                ->get();
        return view('report.report_7')->with(['returnResults'=>$returnResult]);
        //echo $returnResult;
    }


    public function diamondContract(){
    $returnResult = \DB::table('contracts')
        ->select('contracts.*','companies.id as company_id','companies.name')
        ->where('contracts.category','=',1)
        ->leftjoin('companies','companies.id','contracts.company_id')
        ->get();
    return view('report.report_8')->with(['returnResults'=>$returnResult]);
    //echo $returnResult;
}

    public function highestSatisfaction(){
        $returnResult  = \DB::select("
SELECT DISTINCT companies.name AS name, contracts.satissfactionScore AS score,  contract_categories.name AS category
FROM companies, contracts, contract_categories
WHERE companies.id = contracts.company_id
AND contracts.category = contract_categories.id
AND
companies.id in (
SELECT DISTINCT contracts.company_id
FROM contracts
INNER JOIN 
 (SELECT 
   max(contracts.satissfactionScore) as highestSatisfaction, 
   contracts.category from contracts
   GROUP BY category) AS b
ON (b.category = contracts.category AND b.highestSatisfaction=contracts.satissfactionScore)
)
GROUP BY companies.city
;
        ");


        //print_r($returnResult);
        return view('report.report_9')
            ->with(['returnResults'=>$returnResult]);

        //echo $returnResult;
    }






}