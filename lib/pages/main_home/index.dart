import 'package:flutter/material.dart';
import 'package:rent_home/pages/main_home/home_info.dart';
import 'package:rent_home/pages/main_home/home_menu.dart';
import 'package:rent_home/pages/main_home/home_recommend.dart';
import 'package:rent_home/pages/main_home/home_swiper.dart';
import 'package:rent_home/widgets/my_search_bar/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: MySearchBar(showLocation: true, showMap: true,onSearch: () {
        Navigator.of(context).pushNamed("search");
      },), backgroundColor: Colors.white,),
      body: const HomeBody()
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        HomeSwiper(),
        HomeMenu(),
        HomeRecommend(),
        HomeInfo()
      ],
    );
  }
}



