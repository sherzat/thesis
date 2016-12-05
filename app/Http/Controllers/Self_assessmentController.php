<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use App\Http\Requests;

use DB;
class Self_assessmentController extends Controller
{
    public function __construct()
    {
            $this->middleware('auth');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {


    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //create new survey.
        $survey = \App\Survey::create(['name'=>'self_assessment', 'description'=>'debug surveys']);

        //map survey with questions.
        $survey->questions()->attach([1,2,3]);
        $user_id = Auth::id();
        $survey->users()->attach($user_id);
	
        //prepare queation data to pass to views.
        $view_data['survey'] = $survey;
        /*
        echo '<pre>';
        var_dump($survey->questions);
        echo '</pre>';
         */
        return view('pages.self_assessment', $view_data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $user_id = $request->user()->id;
        $responsed_choices =$request->all();
        $user = \App\User::find($user_id);
        //$user->surveys()->attach($survey->id);
        /*
        echo '<pre>';
            var_dump($responsed_choices);
         //   var_dump($user);
          //  var_dump($survey);
        echo '</pre>';

         */

        foreach ($responsed_choices as $question_id=>$value)
        {

            if($question_id!= '_token')
            {
                $response = new \App\Response(['question_id'=>$question_id, 'user_id'=>$user_id, 'choice_id'=>intval($value)]);
                $user->responses()->save($response);
            }

        }
        return redirect('self_assessment/show');



    }

    /**
     * Display the specified resource.
     *Self_assessmentController
     nPopupPost()
     :
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        $user = \App\User::with('surveys')->where('name','ablimit')->get();
        dd($user);

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function linker()
    {

    }
}
