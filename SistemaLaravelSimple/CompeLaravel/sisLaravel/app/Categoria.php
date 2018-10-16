<?php

namespace sisLaravel;

use Illuminate\Database\Eloquent\Model;

class Categoria extends Model
{
    protected $table='CATEGORIA';
    protected $primaryKey='idcategoria';
    public $timestamps=false;//decimos que no se activa las columnas de triggers

    protected $fillable = [
        'nombrecate',
        'descripcioncate',
        'condicion'
    ];

    protected $guarded = [

    ];
}
