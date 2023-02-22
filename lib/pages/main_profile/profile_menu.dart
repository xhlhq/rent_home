///@author: fan
///@date: 2023/2/15 15:16
///@description: 我的页面 - 功能菜单

import 'package:flutter/material.dart';
import 'package:rent_home/pages/main_profile/profile_data.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Color.fromARGB(20, 0, 0, 0),
            offset: Offset(1, 1),
            blurRadius: 4,
            spreadRadius: 1)
      ]),
      child: Wrap(
        spacing: 10,
        runSpacing: 20,
        children: profileListData
            .map((item) => ProfileMenuItem(
                  name: item.name,
                  imgUrl: item.imgUrl,
                  onTap: item.onTap,
                ))
            .toList(),
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final String name;
  final String imgUrl;
  final void Function(BuildContext context) onTap;

  const ProfileMenuItem(
      {Key? key, required this.name, required this.imgUrl, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(context),
      child: SizedBox(
        width: (MediaQuery.of(context).size.width - 40) / 3,
        child: Column(
          children: [
            Image.asset(imgUrl),
            Text(
              name,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            )
          ],
        ),
      ),
    );
  }
}
