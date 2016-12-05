<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Survey_users extends Model
{
    //
    public $timestamps = false;

    protected $fillable =['survey_id', 'user_id'];
/*
    public function questions()
    {
        return $this->belongsToMany('App\Question', 'responses');
    }
    public function users()
    {
        return $this->belongsToMany('App\User', 'responses');
    }

    public function surveys()
    {
        return $this->belongsTo('App\Survey');
    }
}
