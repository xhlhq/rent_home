///@author: fan
///@date: 2023/2/16 13:39
///@description: 房屋信息编辑页面 房源发布

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rent_home/widgets/my_form/my_form_item.dart';
import 'package:rent_home/widgets/my_form/my_form_title.dart';
import 'package:rent_home/widgets/my_form/my_image_picker.dart';
import 'package:rent_home/widgets/my_form/my_room_appliance.dart';

class RoomPublishPage extends StatelessWidget {
  const RoomPublishPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("房源发布")),
      body: const RoomPublishBody(),
    );
  }
}

class RoomPublishBody extends StatefulWidget {
  const RoomPublishBody({Key? key}) : super(key: key);

  @override
  State<RoomPublishBody> createState() => _RoomPublishBodyState();
}

class _RoomPublishBodyState extends State<RoomPublishBody> {
  int _rentType = 0; // 租赁方式
  int _decorationType = 0; // 装修方式
  int _houseType = 0; // 户型
  int _floorType = 0; // 楼层
  int _orientation = 0; // 朝向
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const MyFormTitle("房源信息"),
        MyTapFormItem(
            label: "小区",
            hintText: '请选择小区',
            onTap: () {
              Navigator.of(context).pushNamed('selectArea');
            }),
        MyFormItem(
          label: "租金",
          hintText: "请输入租金",
          suffixText: '元/月',
          controller: TextEditingController(),
        ),
        MyFormItem(
          label: "大小",
          hintText: "请输入大小",
          suffixText: 'm²',
          controller: TextEditingController(),
        ),
        MyRadioFormItem(
            label: '租赁方式',
            options: const ['合租', '整租'],
            value: _rentType,
            onChange: (index) {
              setState(() {
                _rentType = index as int;
              });
            }),
        MyRadioFormItem(
            label: '装修',
            options: const ['精装', '简装'],
            value: _decorationType,
            onChange: (index) {
              setState(() {
                _decorationType = index as int;
              });
            }),
        MySelectFormItem(
            label: '户型',
            options: const ["一室", "二室", "三室", "四室"],
            value: _houseType,
            onChange: (val) {
              setState(() {
                _houseType = val as int;
              });
            }),
        MySelectFormItem(
            label: '楼层',
            options: const ["高楼层", "中楼层", "低楼层"],
            value: _floorType,
            onChange: (val) {
              setState(() {
                _floorType = val as int;
              });
            }),
        MySelectFormItem(
            label: '朝向',
            options: const ["东", "南", "西", "北"],
            value: _orientation,
            onChange: (val) {
              setState(() {
                _orientation = val as int;
              });
            }),
        const MyFormTitle("房屋图像"),
        MyImagePicker(onChange: (List<File> files) {}),
        const MyFormTitle("房源标题"),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            controller: _titleController,
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '请输入标题(例如：整租，小区名，2室，2000元)'),
          ),
        ),
        const MyFormTitle("房源配置"),
        MyRoomAppliance(
          onChange: (List<RoomApplianceItem> list) {
            print(list);
          },
        ),
        const MyFormTitle("房源描述"),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            controller: _descController,
            decoration: const InputDecoration(
                border: InputBorder.none, hintText: '请输入房屋描述信息'),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 30),
          child: ElevatedButton(
              onPressed: () {
                print("提交");
              },
              child: const Text(
                "提交",
                style: TextStyle(fontSize: 18),
              ),
          ),
        )
      ],
    );
  }
}
