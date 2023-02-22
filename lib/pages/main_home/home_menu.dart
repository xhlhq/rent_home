/// @author: fan
/// @date: 2023/2/11 11:31
/// @description: 首页 菜单

import "package:flutter/material.dart";
import 'home_data.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: menuListData.map((item) => HomeMenuItem(
                name: item.name,
                imgUrl: item.imgUrl,
                onTap: item.onTap,
              )).toList()),
    );
  }
}

class HomeMenuItem extends StatelessWidget {
  final String name;
  final String imgUrl;
  final void Function(BuildContext context) onTap;

  const HomeMenuItem(
      {Key? key, required this.name, required this.imgUrl, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(context);
      },
      child: Column(
        children: [
          Image.asset(
            imgUrl,
            width: 48,
          ),
          Text(name, style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500),)
        ],
      ),
    );
  }
}
