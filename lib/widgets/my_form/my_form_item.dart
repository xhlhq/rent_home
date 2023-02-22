///@author: fan
///@date: 2023/2/16 14:10
///@description: 表单基础文本输入框

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///[label]为item的标签
///[contentBuild]为一个返回[Widget]的回调函数，当[contentBuild]不传时，默认会使用一个[TextField]
///[suffix]自定义的后缀组件，不传则会使用一个内容为[suffixText]的[Text]组件
///[hintText]提示文字
///[onChanged]绑定在[TextField]上的函数
///[controller]绑定在[TextField]上的函数
class MyFormItem extends StatelessWidget {
  final String label;
  final Widget? suffix;
  final String suffixText;
  final String hintText;
  final Widget Function(BuildContext context)? contentBuild;
  final ValueChanged? onChanged;
  final TextEditingController? controller;

  const MyFormItem(
      {Key? key,
      this.label = '',
      this.contentBuild,
      this.suffix,
      this.suffixText = '',
      this.hintText = '请输入',
      this.onChanged,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 1, color: Theme.of(context).dividerColor))),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
          Expanded(child: _getContent(context)),
          _getSuffix()
        ],
      ),
    );
  }

// 获取后缀
  Widget _getSuffix() {
    if (suffix != null) {
      return suffix as Widget;
    } else {
      return Text(suffixText);
    }
  }

//获取内容
  Widget _getContent(BuildContext context) {
    if (contentBuild != null) {
      return contentBuild!(context);
    } else {
      return TextField(
        controller: controller,
        onChanged: onChanged,
        decoration:
            InputDecoration(hintText: hintText, border: InputBorder.none),
      );
    }
  }
}

// 带点击事件的formItem
class MyTapFormItem extends StatelessWidget {
  final String label;
  final Widget suffix;
  final String hintText;
  final void Function() onTap;

  const MyTapFormItem(
      {Key? key,
      this.label = '',
      this.suffix = const Icon(Icons.keyboard_arrow_right),
      this.hintText = '请选择',
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyFormItem(
        label: label,
        contentBuild: (context) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: onTap,
            child: Container(
              height: 50,
              alignment: Alignment.centerLeft,
              child: Text(
                hintText,
                style:
                    TextStyle(fontSize: 16, color: Theme.of(context).hintColor),
              ),
            ),
          );
        },
        suffix: suffix);
  }
}

//单选框
class MyRadioFormItem extends StatelessWidget {
  final String label;
  final List<String> options;
  final int value;
  final ValueChanged<int?> onChange;

  const MyRadioFormItem(
      {Key? key,
      this.label = '',
      required this.options,
      required this.value,
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyFormItem(
      label: label,
      contentBuild: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(options.length, (index) {
            return Row(
              children: [
                Radio(value: index, groupValue: value, onChanged: onChange),
                Text(
                  options[index],
                  style: TextStyle(
                      fontSize: 16, color: Theme.of(context).hintColor),
                )
              ],
            );
          }),
        );
      },
    );
  }
}

// 下拉框
class MySelectFormItem extends StatelessWidget {
  final String label;
  final List<String> options;
  final int value;
  final Widget suffix;
  final ValueChanged<int?> onChange;

  const MySelectFormItem(
      {Key? key,
      this.label = '',
      required this.options,
      required this.value,
      this.suffix = const Icon(Icons.keyboard_arrow_right),
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyFormItem(
      label: label,
      contentBuild: (context) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () async {
            var result = await MyPicker.showPicker(
                context: context, options: options, value: value);
            if(result != null) {
              onChange(result);
            }
          },
          child: Container(
            height: 50,
            alignment: Alignment.centerLeft,
            child: Text(
              options[value],
              style:
                  TextStyle(fontSize: 16, color: Theme.of(context).hintColor),
            ),
          ),
        );
      },
      suffix: suffix,
    );
  }
}

class MyPicker {
  static Future<int?> showPicker(
      {required BuildContext context,
        required List<String> options,
        required int value,
        double height = 300}) {
    int selectedValue = value;
    return showModalBottomSheet<int>(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: height,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: (){
                      Navigator.of(context).pop(null);
                    }, child: Text("取消", style: TextStyle(fontSize: 18,color: Theme.of(context).hintColor),)),
                    TextButton(onPressed: (){
                      Navigator.of(context).pop(selectedValue);
                    }, child: Text("确定", style: TextStyle(fontSize: 18,color: Theme.of(context).primaryColor),))
                  ],
                ),
                Expanded(child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(initialItem: value),
                  itemExtent: 40,
                  onSelectedItemChanged: (int value) {
                    selectedValue = value;
                  },
                  children: options.map((e) => Text(e)).toList(),
                ))
              ],
            ),
          );
        });
  }
}