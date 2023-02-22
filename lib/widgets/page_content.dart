import 'package:flutter/material.dart';
import 'package:rent_home/routes/index.dart';

class PageContent extends StatelessWidget {
  final String _name;
  const PageContent(this._name,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('当前页面：$_name'),),
      body: ListView(
        children: [
          TextButton(onPressed: () {
            Navigator.pushNamed(context, Routes.login);
          }, child: Text("登录页")),
          TextButton(onPressed: () {
            Navigator.pushNamed(context, Routes.main);
          }, child: Text("首页")),
          TextButton(onPressed: () {
            Navigator.pushNamed(context, '/room_detail/222');
          }, child: Text("房屋详情页")),
          TextButton(onPressed: () {
            Navigator.pushNamed(context, "/login1");
          }, child: Text("login1")),
          TextButton(onPressed: () {
            Navigator.pushNamed(context, "/login2");
          }, child: Text("login2")),
          TextButton(onPressed: () {
            Navigator.pushNamed(context, "/login3");
          }, child: Text("login3")),
          TextButton(onPressed: () {
            Navigator.pushNamed(context, "/login4");
          }, child: Text("login4")),
          TextButton(onPressed: () {
            Navigator.pushNamed(context, "/login5");
          }, child: Text("login5")),
          TextButton(onPressed: () {
            Navigator.pushNamed(context, "/login6");
          }, child: Text("login6")),
          TextButton(onPressed: () {
            Navigator.pushNamed(context, "/ssss");
          }, child: Text("404"))
        ],
      ),
    );
  }
}
