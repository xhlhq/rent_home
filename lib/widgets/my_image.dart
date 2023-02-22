///@author: fan
///@date: 2023/2/13 17:09
///@description: 给网络图片做缓存

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MyNetworkImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  const MyNetworkImage(this.url, {Key? key, this.width = 100.0, this.height = 100}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            LinearProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) =>
            Image.asset('images/image-failed.png'),
      ),
    );
  }
}

