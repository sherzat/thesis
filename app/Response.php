<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Response extends Model
{
    //
    protected $fillable = ['choice_id','question_id','user_id'];
    public function users()
    {
        return $this->belongsTo('\App\User');
    }

    public function questions()
    {
        return $this->belongsTo('\App\Question');
    }

    public function choices()
    {
        return $this->belongsTo('\App\Choice');
    }


}
