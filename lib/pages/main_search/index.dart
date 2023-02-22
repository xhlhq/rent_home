///@author: fan
///@date: 2023/2/14 14:39
///@description: 搜索页面

import 'package:flutter/material.dart';
import 'package:rent_home/pages/main_search/filter_bar/filter_drawer.dart';
import 'package:rent_home/pages/main_search/filter_bar/index.dart';
import 'package:rent_home/pages/main_search/search_data.dart';
import 'package:rent_home/widgets/my_search.dart';
import 'package:rent_home/widgets/my_search_bar/index.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const FilterDrawer(),
      appBar: AppBar(elevation: 0,title: MySearchBar(showLocation: true, showMap: true,onSearch: () {
        Navigator.of(context).pushNamed("search");
      },), backgroundColor: Colors.white, actions: [Container()],),
      body: const SearchBody(),
    );
  }
}

class SearchBody extends StatelessWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterBar(onChange: (val) {
          print(val);
        },),
        Expanded(child: Padding(
          padding: const EdgeInsets.all(10),
          child: MySearchList(searchListData),
        ))
      ],
    );
  }
}
