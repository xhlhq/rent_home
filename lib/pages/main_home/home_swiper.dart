///@author: fan
///@date: 2023/2/13 19:38
///@description: 首页 轮播图

import 'package:flutter/material.dart';
import 'package:rent_home/widgets/my_swiper.dart';

class HomeSwiper extends StatefulWidget {
  const HomeSwiper({Key? key}) : super(key: key);

  @override
  State<HomeSwiper> createState() => _HomeSwiperState();
}

class _HomeSwiperState extends State<HomeSwiper> {
  List<String> imgList = [
    "https://img.zcool.cn/community/0121bd578059b60000018c1b20c4c0.jpg@1280w_1l_2o_100sh.jpg",
    "https://img2.baidu.com/it/u=3206127706,2824779176&fm=253&fmt=auto&app=138&f=JPEG?w=780&h=455",
    "https://img-baofun.zhhainiao.com/fs/53db44c76071bcd36a74152520511413.jpg",
    "https://img.zcool.cn/community/01b2fa5c151db7a801209252d4f706.png@1280w_1l_2o_100sh.png"
  ];
  @override
  Widget build(BuildContext context) {
    // 获取轮播图的的高度， 图片的宽度（750*424）
    double height = MediaQuery.of(context).size.width / 750.0 * 424;
    return Container(
      height: height,
      color: Colors.grey,
      child: MySwiper(imgList),
    );
  }
}
