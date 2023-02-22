import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class MySwiper extends StatelessWidget {
  final List<String> imgList;

  const MySwiper(this.imgList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          imgList[index],
          fit: BoxFit.cover,
        );
      },
      itemCount: imgList.length,
      scrollDirection: Axis.horizontal,
      axisDirection: AxisDirection.left,
      loop: true,
      autoplay: true,
      autoplayDelay: 5000,
      duration: 300,
      curve: Curves.easeInOut,
      pagination: const SwiperPagination(),
      // control: SwiperControl(),
    );
  }
}
