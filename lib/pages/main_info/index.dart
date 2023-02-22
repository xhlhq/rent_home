///@author: fan
///@date: 2023/2/14 14:15
///@description: 资讯

import 'package:flutter/material.dart';
import 'package:rent_home/pages/main_info/info_data.dart';
import 'package:rent_home/widgets/my_info.dart';
import 'package:rent_home/widgets/my_search_bar/index.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MySearchBar(
          onSearch: () {
            Navigator.of(context).pushNamed("search");
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: const InfoBody(),
    );
  }
}

class InfoBody extends StatelessWidget {
  const InfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: MyInfoList(infoPageListData),
        )
      ],
    );
  }
}
