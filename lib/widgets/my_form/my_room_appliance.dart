///@author: fan
///@date: 2023/2/19 20:50
///@description: room_publish 的 图标

import 'package:flutter/material.dart';
import 'package:rent_home/config/config.dart';

class RoomApplianceItem {
  final String title;
  final int iconPoint;
  final bool isCheck;

  const RoomApplianceItem(this.title, this.iconPoint, this.isCheck);
}

const List<RoomApplianceItem> roomApplianceIconList = [
  RoomApplianceItem('衣柜', 0xe918, false),
  RoomApplianceItem('洗衣机', 0xe917, false),
  RoomApplianceItem('空调', 0xe90d, false),
  RoomApplianceItem('天然气', 0xe90f, false),
  RoomApplianceItem('冰箱', 0xe907, false),
  RoomApplianceItem('暖气', 0xe910, false),
  RoomApplianceItem('电视', 0xe908, false),
  RoomApplianceItem('热水器', 0xe912, false),
  RoomApplianceItem('宽带', 0xe90e, false),
  RoomApplianceItem('沙发', 0xe913, false),
];

class CommonCheckButton extends StatelessWidget {
  final bool isChecked;

  const CommonCheckButton(
    this.isChecked, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isChecked
        ? const Icon(
            Icons.check_circle,
            color: Colors.green,
          )
        : const Icon(
            Icons.radio_button_unchecked,
            color: Colors.green,
          );
  }
}

class MyRoomAppliance  extends StatefulWidget {
  final ValueChanged<List<RoomApplianceItem>>? onChange;
  const MyRoomAppliance({Key? key, this.onChange}) : super(key: key);

  @override
  State<MyRoomAppliance> createState() => _MyRoomApplianceState();
}

class _MyRoomApplianceState extends State<MyRoomAppliance> {
  List<RoomApplianceItem> list = roomApplianceIconList;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: list.map((item){
        return GestureDetector(
          onTap: () {
              setState(() {
                list = list.map((innerItem){
                  if(innerItem == item) {
                   return  RoomApplianceItem(item.title, item.iconPoint, !item.isCheck);
                  }else{
                    return innerItem;
                  }
                }).toList();
                if(widget.onChange != null) {
                  widget.onChange!(list);
                }
              });
          },
          behavior: HitTestBehavior.translucent,
          child: Container(
            width: MediaQuery.of(context).size.width / 5,
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Icon(IconData(item.iconPoint, fontFamily: DefaultConfig.commonIcon),size: 40,),
                Text(item.title, style: const TextStyle(color: Colors.black87, fontSize: 16),),
                CommonCheckButton(item.isCheck)
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class MyRoomApplianceList extends StatelessWidget {
  final List<String> list;
  const MyRoomApplianceList(this.list, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List<RoomApplianceItem> showList = roomApplianceIconList.where((element) => list.contains(element.title)).toList();
    if(showList.isEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: const Text("暂无配置信息"),
      );
    }
    return Wrap(
      children: showList.map((item){
        return Container(
          width: MediaQuery.of(context).size.width / 5,
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Icon(IconData(item.iconPoint, fontFamily: DefaultConfig.commonIcon),size: 40,),
              Text(item.title, style: const TextStyle(color: Colors.black87, fontSize: 16),)
            ],
          ),
        );
      }).toList(),
    );
  }
}


