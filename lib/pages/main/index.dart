import 'package:flutter/material.dart';
import 'package:rent_home/pages/main_home/index.dart';
import 'package:rent_home/pages/main_info/index.dart';
import 'package:rent_home/pages/main_profile/index.dart';
import 'package:rent_home/pages/main_search/index.dart';


class MyBottomNavigationBarItem extends BottomNavigationBarItem {
  MyBottomNavigationBarItem( String title, IconData iconData): super(label: title, icon: Icon(iconData, size: 32,),
    activeIcon: Icon(iconData, color: Colors.blue,size: 32,),);
}

// 页面TabBarItem
List<MyBottomNavigationBarItem> barItems = [MyBottomNavigationBarItem("首页", Icons.home),
  MyBottomNavigationBarItem("搜索", Icons.search_rounded),
  MyBottomNavigationBarItem("资讯", Icons.newspaper),
  MyBottomNavigationBarItem("我的", Icons.person)];

// 主页面
List<Widget> pages = const [
  HomePage(),
  SearchPage(),
  InfoPage(),
  ProfilePage(),
];

class TabberMain extends StatefulWidget {
  const TabberMain({Key? key}) : super(key: key);

  @override
  State<TabberMain> createState() => _TabberMainState();
}

class _TabberMainState extends State<TabberMain> {
  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentPageIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 33, 150, 243),
        unselectedFontSize: 14,
        selectedFontSize: 16,
        items: barItems,
        onTap: (value) {
          setState(() {
            _currentPageIndex = value;
          });
        },
      ),
    );
  }
}

