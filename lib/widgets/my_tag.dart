///@author: fan
///@date: 2023/2/20 12:19
///@description: 标签

import 'package:flutter/material.dart';
import 'package:rent_home/utils/index.dart';

class MyTag extends StatelessWidget {
  final String name;
  final String color;

  const MyTag(this.name, {Key? key, this.color = '#3498db'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: HexColor(color, opa: '30'),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12, color: HexColor(color, opa: 'FF'), fontWeight: FontWeight.w500),
      ),
    );
  }
}
