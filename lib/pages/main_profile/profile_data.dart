import 'package:flutter/material.dart';
import 'package:rent_home/routes/index.dart';

///@author: fan
///@date: 2023/2/15 15:19
///@description: 我的页面 - 数据

class ProfileItemData {
  final String name;
  final String imgUrl;
  final void Function(BuildContext context) onTap;
  ProfileItemData({required this.name, required this.imgUrl, required this.onTap});
}

List<ProfileItemData> profileListData = [
  ProfileItemData(name: '看房记录', imgUrl: 'assets/images/profile/home_profile_record.png', onTap: (context) {
    Navigator.of(context).pushNamed("history");
  }),
  ProfileItemData(name: '我的订单', imgUrl: 'assets/images/profile/home_profile_order.png', onTap: (context) {
    Navigator.of(context).pushNamed("history");
  }),
  ProfileItemData(name: '我的收藏', imgUrl: 'assets/images/profile/home_profile_favor.png', onTap: (context) {
    Navigator.of(context).pushNamed("history");
  }),
  ProfileItemData(name: '身份认证', imgUrl: 'assets/images/profile/home_profile_id.png', onTap: (context) {
    Navigator.of(context).pushNamed("history");
  }),
  ProfileItemData(name: '联系我们', imgUrl: 'assets/images/profile/home_profile_message.png', onTap: (context) {
    Navigator.of(context).pushNamed("history");
  }),
  ProfileItemData(name: '电子合同', imgUrl: 'assets/images/profile/home_profile_contract.png', onTap: (context) {
    Navigator.of(context).pushNamed("history");
  }),
  ProfileItemData(name: '房屋管理', imgUrl: 'assets/images/profile/home_profile_house.png', onTap: (context) {
    Navigator.of(context).pushNamed(Routes.roomManage);
  }),
  ProfileItemData(name: '钱包', imgUrl: 'assets/images/profile/home_profile_wallet.png', onTap: (context) {
    Navigator.of(context).pushNamed(Routes.pickImg);
  }),
];