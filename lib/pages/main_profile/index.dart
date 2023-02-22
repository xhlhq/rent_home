///@author: fan
///@date: 2023/2/15 12:40
///@description: 我的

import 'package:flutter/material.dart';
import 'package:rent_home/pages/main_profile/profile_header.dart';
import 'package:rent_home/pages/main_profile/profile_menu.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("我的"),actions: [
        IconButton(onPressed: () => Navigator.of(context).pushNamed("setting"), icon: const Icon(Icons.settings))
      ],),
      body: const ProfileBody(),
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 247, 248, 250),
      child: ListView(
        children: const [
          ProfileHeader(),
          SizedBox(height: 20),
          ProfileMenu()
        ],
      ),
    );
  }
}

