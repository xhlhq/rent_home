///@author: fan
///@date: 2023/2/14 10:09
///@description: 最新资讯

import 'package:flutter/material.dart';
import 'package:rent_home/pages/main_home/home_data.dart';
import 'package:rent_home/widgets/my_info.dart';

class HomeInfo extends StatelessWidget {
  const HomeInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeInfoHeader(),
          const SizedBox(height: 10,),
          MyInfoList(infoListData)
        ],
      ),
    );
  }
}

class HomeInfoHeader extends StatelessWidget {
  const HomeInfoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("最新资讯", style: TextStyle(color: Colors.black, fontSize: 16),);
  }
}

