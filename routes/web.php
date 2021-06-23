<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::get('/registerStaff', function () {
    return view('registerStaff');
});

Route::resource('/RegisterStaffAction', 'RegisterStaffController');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get('/dashboard', 'HomeController@toDashboard');


Route::middleware(['auth'])->group(function () {
    //dashboard gate
    Route::get('sales', function () {
        return view('sales');
    })->middleware('roles:sales');

    Route::get('employee', 'employeeController@index')->middleware('roles:employee');;

    Route::get('adminHome', 'adminController@index')->middleware('roles:admin');

    Route::get('manager', 'managerController@index')->middleware('roles:manager');

    Route::get('tam', 'tamController@index')->middleware('roles:tam');

    Route::get('company', 'companyController@index')->middleware('roles:company');

    //staff route
    Route::post('staff/{id}/update', 'employeeController@update')->middleware('roles:employee');
    Route::post('staff/{id}/current_contract', 'employeeController@current_contract')->middleware('roles:manager');
    Route::post('staff/{id}/remove_contract', 'employeeController@remove_contract')->middleware('roles:manager');

    //company or client route
    Route::get('/creatClientAcount',array('as'=>'myform','uses'=>'HomeController@myform'));
    Route::get('/myform/ajax/{id}',array('as'=>'myform.ajax','uses'=>'HomeController@myformAjax'));
    Route::resource('companys', 'companyController');
    Route::post('rateMyManager', 'companyController@rateMyManager')->middleware('roles:company');

    //manager route
    Route::get('manager/{id}/getMyEmployee', 'managerController@getMyEmployee')->middleware('roles:manager');
    Route::get('manager/{id}/removeMyEmployee', 'managerController@removeMyEmployee')->middleware('roles:manager');
    Route::get('manager/{id}/contractHour', 'managerController@contractHour')->middleware('roles:manager');
    Route::post('contractsFromCategory/view', 'managerController@view')->middleware('roles:manager');
    Route::post('getContractById','managerController@getContractById')->middleware('roles:manager');

    //tam route
    Route::get('tam/{id}/getMyManager', 'tamController@getMyManager')->middleware('roles:tam');

    //contract route
    Route::get('/createContract',array('as'=>'myform','uses'=>'HomeController@getCompanyListandCategoryAjax'));
    Route::get('/existContract','contractController@getExistingContract');
    Route::resource('contracts', 'contractController');

    //admin route
    Route::get('contract/{id}/edit', 'contractController@edit')->middleware('roles:admin');
    Route::post('contract/{id}/update', 'contractController@update')->middleware('roles:admin');
    Route::get('contract/{id}/delete', 'contractController@destroy')->middleware('roles:admin');


    //report route
    Route::get('/report', 'reportController@getReport')->middleware('roles:admin');
    Route::get('premiumEmployeeWorkLessThan80H', 'reportController@premiumEmployeeWorkLessThan80H')->middleware('roles:admin');
    Route::get('numberOfPremium10Days15Employees', 'reportController@numberOfPremium10Days15Employees')->middleware('roles:admin');
    Route::get('comparisionDeliverySchedule', 'reportController@comparisionDeliverySchedule')->middleware('roles:admin');
    Route::get('highestRevenue', 'reportController@highestRevenue')->middleware('roles:admin');
    Route::get('getClientWithMostContracts', 'reportController@getClientWithMostContracts')->middleware('roles:admin');
    Route::get('tenDaysContracts', 'reportController@tenDaysContracts')->middleware('roles:admin');
    Route::get('quebecEmployee', 'reportController@quebecEmployee')->middleware('roles:admin');
    Route::get('diamondContract', 'reportController@diamondContract')->middleware('roles:admin');
    Route::get('highestSatisfaction', 'reportController@highestSatisfaction')->middleware('roles:admin');

});