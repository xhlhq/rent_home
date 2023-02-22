import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:rent_home/routes/index.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("注册"),),
      body: const RegisterBody(),
    );
  }
}

class RegisterBody extends StatelessWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(20),
      child: ListView(
        children: <Widget>[
          const TextField(
            autofocus: true,
            decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person)
            ),
          ),
          const SizedBox(height: 20,),
          const TextField(
            decoration: InputDecoration(
                labelText: "密码",
                hintText: "您的登录密码",
                prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 20,),
          const TextField(
            decoration: InputDecoration(
              labelText: "确认密码",
              hintText: "请再次输入您的登录密码",
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 30,),
          ElevatedButton(onPressed: () {
            print("注册");
          }, child: const Text("注册")),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("已有账号，"),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.login);
                },
                child: const Text("去登录！"),
              )
            ],
          )
        ],
      ),
    );
  }
}


