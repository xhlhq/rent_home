import 'package:rent_home/widgets/my_info.dart';

///@author: fan
///@date: 2023/2/20 10:15
///@description: 房屋详情页 数据

class Tag {
  final String label;
  final String color;

  Tag(this.label, [this.color = '#3498db']);
}

class RoomDetailData {
  final String id;
  final String title;
  final String community;
  final String subTitle;
  final double size;
  final String floor;
  final double price;
  final String roomType;
  final List<String> houseImgs;
  final List<Tag> tags;
  final List<String> oriented;
  final List<String> applicances;

  RoomDetailData(
      {required this.id,
      required this.title,
      this.community = '',
      this.subTitle = '',
      this.size = 0,
      this.floor = '',
      this.price = 0,
      this.roomType = '',
      required this.houseImgs,
      this.tags = const [],
      this.oriented = const [],
      this.applicances = const []});
}

RoomDetailData defaultData = RoomDetailData(
    id: '1111',
    title: '整租 中山路 历史最低价',
    community: '中山花园',
    subTitle:
        '近地铁，附近有商场！看昨天的我们 走远了明天，你好明天，你好在命运广场中央 等待那模糊的 肩膀越奔跑 越渺小曾经 肩往前的 伙伴在举杯 祝福后都 走散只是那个 夜晚深深 的都留藏在心坎长大以后 我只能奔跑我多害怕 中跌倒明天你好 含着泪微笑越美好 越害怕得到每一次哭又笑着 奔跑一边失去 一边在寻找明天你好 声音多渺小却提醒我勇敢是什么当我朝着反方向走去在楼梯的角落 找勇气抖着肩膀 哭泣问自己 在哪里曾经 并肩往前 的伙伴沉默着 懂得我的委屈时间它总说谎我从 不曾失去 那些肩膀长大以后我只能奔跑我多害怕 黑暗中跌倒明天你好 含着泪微笑越美好 越害怕得到每一次哭又笑着奔跑一边失去 一边在寻找明天你好声音多渺小却提醒我勇敢是什么',
    size: 100,
    floor: '高楼层',
    price: 3000,
    oriented: ['南'],
    roomType: '三室',
    applicances: ['衣柜', '洗衣机', '冰箱', '宽带'],
    tags: [
      Tag("近地铁", "#e67e22"),
      Tag("集中供暖"),
      Tag("新上", "#ff6348"),
      Tag("随时看房", "#3742fa")
    ],
    houseImgs: [
      "https://img2.baidu.com/it/u=3206127706,2824779176&fm=253&fmt=auto&app=138&f=JPEG?w=780&h=455",
      "https://img-baofun.zhhainiao.com/fs/53db44c76071bcd36a74152520511413.jpg",
    ]);


List<MyInfoItemData> infoDetailListData = [
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

