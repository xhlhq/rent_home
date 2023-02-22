///@author: fan
///@date: 2023/2/16 13:49
///@description: 表单的标题

import 'package:flutter/material.dart';

class MyFormTitle extends StatelessWidget {
  final String text;
  const MyFormTitle(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(text, style: const TextStyle(fontSize: 18, color: Colors.black87, fontWeight: FontWeight.w500),),
    );
  }
}
