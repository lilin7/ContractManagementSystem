<?php

namespace App\Http\Middleware;

use Closure;
use Session;

class CheckRole
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next,$role)
    {
        if($request->user()->hasRole($role))
        {
            return $next($request);
        }
        Session::flash('status', 'You are not authorized to access this resource.');
        return redirect()->back()->withErrors('You are not authorized to access this resource.');
    }
}
