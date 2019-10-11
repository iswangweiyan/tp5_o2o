<?php

namespace app\index\controller;

use think\Controller;

class User extends Controller
{
    //注册
    public function register()
    {
        return $this->fetch();
    }

    //登录
    public function login()
    {
        return $this->fetch();
    }
}
