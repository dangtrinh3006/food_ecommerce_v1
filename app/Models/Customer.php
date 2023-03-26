<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    public $timestamps = false; //set time to false
    protected $fillable = [
    	'name', 'gender','email', 'address', 'phone_number', 'note'
    ];
    protected $primaryKey = 'id';
    protected $table = "customer";
    
    public function bill(){
    	return $this->hasMany('App\Models\Bill','id_customer', 'id');
    }
}
