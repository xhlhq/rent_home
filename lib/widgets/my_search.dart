///@author: fan
///@date: 2023/2/14 15:07
///@description: 搜索页面的item

import 'package:flutter/material.dart';
import 'package:rent_home/widgets/my_image.dart';

class TagData {
  final String name;
  final String color;

  TagData(this.name, {this.color = '#3498db'});
}

class SearchItemData {
  final String title;
  final String subTitle;
  final String address;
  final double price;
  final List<TagData> tags;
  final String imgUrl;

  SearchItemData({
    this.title = '',
    this.subTitle = '',
    this.address = '',
    this.price = 0,
    this.tags = const [],
    required this.imgUrl,
  });
}

class MySearchList extends StatelessWidget {
  final List<SearchItemData> list;

  const MySearchList(this.list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return SearchItem(list[index]);
        });
  }
}

class SearchItem extends StatelessWidget {
  final SearchItemData data;

  const SearchItem(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("搜索：${data.title}");
      },
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            MyNetworkImage(data.imgUrl, width: 120, height: 100,),
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
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Text(data.subTitle, maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                  const TextStyle(fontSize: 14),),
                Wrap(
                    children:
                        data.tags.map((item) => SearchTag(item.name)).toList()),
                Text('${data.price} 元/月', style: const TextStyle(fontSize: 16, color: Colors.orange),)
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class SearchTag extends StatelessWidget {
  final String name;
  final String color;

  const SearchTag(this.name, {Key? key, this.color = '#3498db'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
      margin: const EdgeInsets.only(right: 10),
      decoration: const BoxDecoration(
        color: Color(0xFF3498db),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(100, 0, 0, 0),
                offset: Offset(1, 2),
                blurRadius: 6,
                spreadRadius: 0.06)
          ]),
      child: Text(
        name,
        style: const TextStyle(fontSize: 12, color: Colors.white),
      ),
    );
  }
}
