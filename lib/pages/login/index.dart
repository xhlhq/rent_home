import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:rent_home/routes/index.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("登录"),),
      body: const LoginBody(),
    );
  }
}

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

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
          const PasswordField(),
          const SizedBox(height: 30,),
          ElevatedButton(onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.main);
          }, child: const Text("登录")),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("还没有账号，"),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.register);
                },
                child: const Text("去注册！"),
              )
            ],
          )
        ],
      ),
    );
  }
}


// 点击切换显隐状态的密码组件
class PasswordField extends StatefulWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
   bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          labelText: "密码",
          hintText: "您的登录密码",
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(onPressed: (){
            setState(() {
              showPassword = !showPassword;
            });
          },icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off))
      ),
      obscureText: !showPassword,
    );
  }
}


