///@author: fan
///@date: 2023/2/15 16:11
///@description: 设置页面

import 'package:flutter/material.dart';
import 'package:rent_home/config/my_color.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("设置"),),
      body: const SettingBody(),
    );
  }
}

class SettingBody extends StatelessWidget {
  const SettingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Widget divider =  Divider(height: 1);
    return ListView(
      children: [
        Container(height: 15, color: ConfigColor.scaffoldBgLight,),
        ListTile(
          leading: Icon(
            Icons.style,
            color: Theme.of(context).primaryColor,
          ),
          trailing: _rightArrowIcon(context),
          title: const Text('应用整体风格', style:  TextStyle(fontSize: 16)),
        ),
        divider,
        ListTile(
          leading: Icon(
            Icons.style,
            color: Theme.of(context).primaryColor,
          ),
          trailing: _rightArrowIcon(context),
          title: const Text('应用整体风格', style:  TextStyle(fontSize: 16)),
        ),
        divider,
        ListTile(
          leading: Icon(
            Icons.style,
            color: Theme.of(context).primaryColor,
          ),
          trailing: _rightArrowIcon(context),
          title: const Text('应用整体风格', style:  TextStyle(fontSize: 16)),
        ),
        Container(height: 15, color: ConfigColor.scaffoldBgLight,),
        SwitchListTile(
          value: true,
          secondary: Icon(
            Icons.backpack_outlined,
            color: Theme.of(context).primaryColor,
          ),
          title: const Text('显示背景', style:  TextStyle(fontSize: 16)),
          onChanged: (show) {

          },
        )
      ],
    );
  }

  Widget _rightArrowIcon(BuildContext context) =>
      Icon(Icons.chevron_right, color: Theme.of(context).primaryColor);
}

