import 'package:flutter/material.dart';
import 'package:rent_home/widgets/my_info.dart';

///@author: fanw
///@date: 2023/2/11 11:52
///@description:

/// ************************首页 - 菜单
/// 首页菜单item
class MenuItemData {
  final String name;
  final String imgUrl;
  final void Function(BuildContext context) onTap;

  MenuItemData(this.name, this.imgUrl, this.onTap);
}

/// 首页菜单数据
List<MenuItemData> menuListData = [
  MenuItemData("整租", "assets/images/menu/item_total.png",
      (BuildContext context) {
    print("整租");
  }),
  MenuItemData("合租", "assets/images/menu/item_share.png",
      (BuildContext context) {
    print("合租");
  }),
  MenuItemData("地图找房", "assets/images/menu/item_map.png",
      (BuildContext context) {
    print("地图找房");
  }),
  MenuItemData("去出租", "assets/images/menu/item_rent.png",
      (BuildContext context) {
    print("去出租");
  }),
];

/// ************************首页 - 房屋推荐
class RecommendItemData {
  final String title;
  final String subTitle;
  final String imgUrl;

  RecommendItemData(this.title, this.subTitle, this.imgUrl);
}

List<RecommendItemData> recommendListData = [
  RecommendItemData(
      '家住回龙观', '归属的感觉', 'assets/images/recommend/recommend_1.png'),
  RecommendItemData(
      '宜居四五环', '大都市生活', 'assets/images/recommend/recommend_2.png'),
  RecommendItemData(
      '喧嚣三里屯', '繁华的背后', 'assets/images/recommend/recommend_3.png'),
  RecommendItemData('比邻十号线', '地铁心连心', 'assets/images/recommend/recommend_4.png')
];

/// ************************首页 - 最新资讯
List<MyInfoItemData> infoListData = [
  MyInfoItemData(
      title: "标题1|置业选择|江西抚州乐安县戴坊镇白露村",
      address: "江西",
      date: "一天前",
      imgUrl:
          "https://img-baofun.zhhainiao.com/fs/53db44c76071bcd36a74152520511413.jpg"),
  MyInfoItemData(
      title: "标题2|置业选择|江西抚州乐安县戴坊镇白露村江西抚州乐安县戴坊镇白露村江西抚州乐安县戴坊镇白露村",
      address: "江西",
      date: "一天前",
      imgUrl:
          "https://img-baofun.zhhainiao.com/fs/53db44c76071bcd36a74152520511413.jpg"),
  MyInfoItemData(
      title: "标题3|置业选择|江西抚州乐安县戴坊镇白露村",
      address: "江西",
      date: "一天前",
      imgUrl:
          "https://img-baofun.zhhainiao.com/fs/53db44c76071bcd36a74152520511413.jpg"),
  MyInfoItemData(
      title: "标题4|置业选择|江西抚州乐安县戴坊镇白露村",
      address: "江西",
      date: "一天前",
      imgUrl:
          "https://img-baofun.zhhainiao.com/fs/53db44c76071bcd36a74152520511413.jpg"),
  MyInfoItemData(
      title: "标题5|置业选择|江西抚州乐安县戴坊镇白露村",
      address: "江西",
      date: "一天前",
      imgUrl:
          "https://img-baofun.zhhainiao.com/fs/53db44c76071bcd36a74152520511413.jpg")
];
