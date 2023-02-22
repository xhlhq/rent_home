///@author: fan
///@date: 2023/2/15 17:34
///@description: 房屋管理页

import 'package:flutter/material.dart';
import 'package:rent_home/pages/room_page/room_manage/room_manage_data.dart';
import 'package:rent_home/routes/index.dart';
import 'package:rent_home/widgets/my_footer_floating_action_button.dart';
import 'package:rent_home/widgets/my_search.dart';

class RoomManagePage extends StatelessWidget {
  const RoomManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          appBar: AppBar(
              title: const Text("房屋管理"),
              bottom: const TabBar(
                labelColor: Colors.white,
                labelStyle: TextStyle(fontSize: 18),
                indicatorWeight: 1,
                tabs: [
                  Tab(
                    text: "已租",
                  ),
                  Tab(
                    text: "未租",
                  ),
                ],
              )),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: MyFooterFloatingActionButton("发布房源", onTap: () {
            Navigator.of(context).pushNamed(Routes.roomPublish);
          },),
          body: const RoomManageBody()),
    );
  }
}

class RoomManageBody extends StatelessWidget {
  const RoomManageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBarView(children: [
      Padding(
        padding: EdgeInsets.all(10),
        child: RentedRoomTab(),
      ),
      Padding(padding: EdgeInsets.all(10), child: NotRentedRoomTab()),
    ]);
  }
}

class RentedRoomTab extends StatelessWidget {
  const RentedRoomTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MySearchList(rentedRoomListData);
  }
}

class NotRentedRoomTab extends StatelessWidget {
  const NotRentedRoomTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MySearchList(notRentedRoomListData);
  }
}
