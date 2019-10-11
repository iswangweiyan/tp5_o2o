<?php
namespace app\index\controller;

//继承公共的Controller
use think\Controller;

class Index extends Controller
{
    public function index()
    {
        return $this->fetch();
    }
}
