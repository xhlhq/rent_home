///@author: fan
///@date: 2023/2/15 17:36
///@description:

import 'package:flutter/material.dart';
import 'package:rent_home/pages/room_page/room_detail/data.dart';
import 'package:rent_home/widgets/my_form/my_form_title.dart';
import 'package:rent_home/widgets/my_form/my_room_appliance.dart';
import 'package:rent_home/widgets/my_info.dart';
import 'package:rent_home/widgets/my_swiper.dart';
import 'package:rent_home/widgets/my_tag.dart';
import 'package:share_plus/share_plus.dart';

class RoomDetailPage extends StatefulWidget {
  final String roomId;

  const RoomDetailPage({Key? key, required this.roomId}) : super(key: key);

  @override
  State<RoomDetailPage> createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  late RoomDetailData data;
  bool showAllText = false;

  @override
  void initState() {
    data = defaultData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool showTextTool = data.subTitle.length > 100;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          data.title,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Share.share('check out my website https://example.com',
                    subject: 'Look what I made!');
              },
              icon: const Icon(
                Icons.share,
                color: Colors.white,
              ))
        ],
      ),
      bottomNavigationBar: const RoomDetailFooterBar(),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width / 750.0 * 424,
            child: MySwiper(data.houseImgs),
          ),
          MyFormTitle(data.title),
          const MyFormTitle('房屋配置'),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "${data.price}元/月(押一付三)",
              style: const TextStyle(fontSize: 14, color: Colors.pink),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Wrap(
              children: data.tags
                  .map((e) => MyTag(
                        e.label,
                        color: e.color,
                      ))
                  .toList(),
            ),
          ),
          Divider(
            color: Theme.of(context).dividerColor,
            indent: 10,
            endIndent: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [BaseInfoItem('面积：${data.size.toString()}平米'),
                  BaseInfoItem('楼层：${data.floor}'),
                  BaseInfoItem('户型：${data.roomType}'),
                  const BaseInfoItem('装修：精装')]
            ),
          ),
          const MyFormTitle('房屋配置'),
          MyRoomApplianceList(data.applicances),
          const MyFormTitle('房屋概况'),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.subTitle ?? '暂无概况', maxLines: showAllText ? null : 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    showTextTool ? GestureDetector(
                      onTap: () {
                        setState(() {
                          showAllText = !showAllText;
                        });
                      },
                      child: Row(
                        children: [
                          Text(showAllText ? "收起" : "展开"),
                          Icon(showAllText ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down)
                        ],
                      ),
                    ): Container(),
                    const Text('举报')
                  ],
                ),
              ],
            ),
          ),
          const MyFormTitle('猜你喜欢'),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.only(bottom: 20),
            child: MyInfoList(infoDetailListData),
          )
        ],
      ),
    );
  }
}

class BaseInfoItem extends StatelessWidget {
  final String text;
  const BaseInfoItem(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 10 * 3) / 2,
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

class RoomDetailFooterBar extends StatefulWidget {
  const RoomDetailFooterBar({Key? key}) : super(key: key);

  @override
  State<RoomDetailFooterBar> createState() => _RoomDetailFooterBarState();
}

class _RoomDetailFooterBarState extends State<RoomDetailFooterBar> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isLiked = !_isLiked;
              });
            },
            child: SizedBox(
              height: 50,
              width: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    _isLiked ? Icons.star : Icons.star_border,
                    color: Colors.blue,
                  ),
                  Text(
                    _isLiked ? "已收藏" : '收藏',
                    style: const TextStyle(fontSize: 14),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: GestureDetector(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.cyan, borderRadius: BorderRadius.circular(6)),
              child: const Center(
                child: Text(
                  "联系房东",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          )),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: GestureDetector(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(6)),
              child: const Center(
                child: Text(
                  "预约看房",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
