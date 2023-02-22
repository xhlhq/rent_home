///@author: fan
///@date: 2023/2/15 15:17
///@description: 我的页面 - 头部页面

import 'package:flutter/material.dart';
import 'package:rent_home/routes/index.dart';
import 'package:rent_home/widgets/my_image.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  final bool _isLogined = false;
  Widget _getProfileHeader(BuildContext context) {
    if(_isLogined) {
      // 已登录
      return Row(
        children: [
          const SizedBox(
            width: 54,
            height: 54,
            child: ClipOval(
              child: MyNetworkImage("https://img.zcool.cn/community/01b2fa5c151db7a801209252d4f706.png@1280w_1l_2o_100sh.png"),
            ),
          ),
          const SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const Text("已登录用户名！", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.login);
                },
                child: const Text("查看编辑个人资料", style: TextStyle(fontSize: 14)),
              ),
            ],
          )
        ],
      );
    }else{
      // 未登录
      return Row(
        children: [
          const SizedBox(
            width: 48,
            height: 48,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile/home_profile_user.png"),
            ),
          ),
          const SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.login);
                },
                child: const Text("登录/注册", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
              ),
              const Text("登录后可以体验更多功能！", style: TextStyle(fontSize: 14),)
            ],
          )
        ],
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.only(left: 40),
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Color.fromARGB(20, 0, 0, 0), offset: Offset(1, 1), blurRadius: 4,spreadRadius: 1 )]
      ),
      child: _getProfileHeader(context),
    );
  }
}
