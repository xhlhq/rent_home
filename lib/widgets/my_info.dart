///@author: fan
///@date: 2023/2/14 10:22
///@description: 资讯列表和资讯卡，首页和资讯页使用

import 'package:flutter/material.dart';
import 'package:rent_home/widgets/my_image.dart';

class MyInfoItemData {
  final String title;
  final String address;
  final String date;
  final String imgUrl;

  MyInfoItemData(
      {this.title = '',
      this.address = '',
      this.date = '',
      required this.imgUrl});
}

enum InfoLayout { row, column }

class MyInfoList extends StatelessWidget {
  final InfoLayout layout; // 布局 横布局和多行布局
  final List<MyInfoItemData> list;

  const MyInfoList(this.list, {Key? key, this.layout = InfoLayout.row})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      runAlignment: WrapAlignment.spaceBetween,
      spacing: layout == InfoLayout.row ? 0 : 10,
      runSpacing: 10,
      children: list.map((item) => MyInfoItem(item, layout: layout,)).toList(),
    );
  }
}

class MyInfoItem extends StatelessWidget {
  final InfoLayout layout;
  final MyInfoItemData data;

  const MyInfoItem(this.data, {Key? key, this.layout = InfoLayout.row})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // infoItem宽度和高度
    double infoWidth = layout == InfoLayout.row ? MediaQuery.of(context).size.width : (MediaQuery.of(context).size.width - 30) / 2;
    double infoHeight = layout == InfoLayout.row ? 100 : 200;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/room_detail/222');
        print("最新资讯：${data.title}");
      },
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        height: infoHeight,
        width: infoWidth,
        child: getInfoItemByLayout(infoWidth, infoHeight),
      ),
    );
  }
  Widget getInfoItemByLayout(infoWidth, infoHeight) {
    if(layout == InfoLayout.row) {
      return Row(
        children: [
          MyNetworkImage(
            data.imgUrl,
            height: 100,
            width: 120,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.address,
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(data.date,
                          style: const TextStyle(fontSize: 12, color: Colors.grey))
                    ],
                  )
                ],
              ))
        ],
      );
    }else{
      return Column(
        children: [
          MyNetworkImage(
            data.imgUrl,
            height: infoHeight - 70,
            width: infoWidth,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            data.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style:
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.address,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(data.date,
                  style: const TextStyle(fontSize: 12, color: Colors.grey))
            ],
          )
        ],
      );
    }
  }
}
