///@author: fan
///@date: 2023/2/13 19:36
///@description: 首页 房屋推荐

import 'package:flutter/material.dart';
import 'package:rent_home/pages/main_home/home_data.dart';

class HomeRecommend extends StatelessWidget {
  const HomeRecommend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: const Color.fromARGB(10, 0, 0, 0),
      child: Column(
        children: const [HomeRecommendHeader(), SizedBox(height: 10,),HomeRecommendList()],
      ),
    );
  }
}

class HomeRecommendHeader extends StatelessWidget {
  const HomeRecommendHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "房屋推荐",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        GestureDetector(
          onTap: () {
            print("更多");
          },
          child: const Text(
            "更多",
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        )
      ],
    );
  }
}

class HomeRecommendList extends StatelessWidget {
  const HomeRecommendList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      spacing: 10,
      children: recommendListData.map((item) => RecommendItem(
        title: item.title,
        subTitle: item.subTitle,
        imgUrl: item.imgUrl
      )).toList(),
    );
  }
}

class RecommendItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imgUrl;
  const RecommendItem({Key? key, required this.title, required this.subTitle, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("推荐：$title");
      },
      child: Container(
        width: (MediaQuery.of(context).size.width - 10.0 * 3) / 2,
        decoration: const BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(title, style: const TextStyle(fontSize: 15),), Text(subTitle, style: const TextStyle(fontSize: 14),)],
            ),
            Image.asset(
              imgUrl,
              width: 64,
              fit: BoxFit.fitWidth,
            )
          ],
        ),
      ),
    );
  }
}
