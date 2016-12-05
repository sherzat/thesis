<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    //model should not be timestamped.
    public $timestamps = false;

    //The choices that belongs to the questions
    public function choices()
    {
        return $this->belongsToMany('App\Choice', 'question_choices');
    }
/*
    public function users()
    {
        return $this->belongsToMany('App\User', 'responses');
    }
 */
    public function responses()
    {
        return $this->hasMany('App\Response');
    }

    public function surveys()
    {
        return $this->belongsToMany('App\Survey', 'survey_questions');
    }

}
