///@author: fan
///@date: 2023/2/20 12:01
///@description: 基础工具

import 'package:flutter/material.dart';

class HexColor extends Color {
  final String opa;
  static int getColorFromHex(String hexColor, String opa) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "$opa$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor, {this.opa = 'FF'}) : super(getColorFromHex(hexColor, opa));
}