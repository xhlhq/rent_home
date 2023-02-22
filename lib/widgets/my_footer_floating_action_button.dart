///@author: fan
///@date: 2023/2/16 12:52
///@description: 底部浮动按钮

import 'package:flutter/material.dart';

class MyFooterFloatingActionButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const MyFooterFloatingActionButton(this.text,{
    super.key, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: ElevatedButton(
              onPressed: onTap,
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        side: BorderSide(color: Colors.white, width: 0.4)),
                  )
              ),
              child: Text(
                text,
                style: const TextStyle(fontSize: 16),
              ),
            )),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}