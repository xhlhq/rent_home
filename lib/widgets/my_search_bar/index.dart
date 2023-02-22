///@author: fan
///@date: 2023/2/14 16:32
///@description: 通用搜索栏

import 'package:flutter/material.dart';

class MySearchBar extends StatefulWidget {
  final bool showLocation; // 是否显示位置
  final String value; // 搜索框值
  final String hintText; // 搜索框默认值
  final bool showCancel; // 是否显示取消按钮
  final bool showMap; // 是否显示按钮图标
  final void Function()? backCallback; // 返回按钮
  final void Function()? cancelCallback; // 取消按钮
  final void Function()? onSearch; // 触发搜索
  final ValueChanged<String>? onSearchSubmit; // 用户提交搜索
  const MySearchBar(
      {Key? key,
      this.showLocation = false,
      this.backCallback,
      this.value = '',
      this.hintText = '请输入搜索内容',
      this.showCancel = false,
      this.cancelCallback,
      this.showMap = false,
      this.onSearch,
      this.onSearchSubmit})
      : super(key: key);

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 地址
        if (widget.showLocation) const SearchLocation(),
        // 返回按钮
        if (widget.backCallback != null)
          SearchBack(backCallback: widget.backCallback),
        // 搜索框
        Expanded(
            child: SearchInput(
          value: widget.value,
          hintText: widget.hintText,
          onSearch: widget.onSearch,
          onSearchSubmit: widget.onSearchSubmit,
        )),
        // 取消
        if (widget.cancelCallback != null)
          SearchCancel(cancelCallback: widget.cancelCallback),
        // 地图
        if (widget.showMap) const SearchMap()
      ],
    );
  }
}

// 地址
class SearchLocation extends StatelessWidget {
  const SearchLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () {
          print("location");
        },
        child: Row(
          children: const [
            Icon(
              Icons.room,
              color: Colors.blue,
              size: 18,
            ),
            Text(
              "江西",
              style: TextStyle(color: Colors.black87, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}

// 返回按钮
class SearchBack extends StatelessWidget {
  final void Function()? backCallback;

  const SearchBack({Key? key, this.backCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: backCallback,
        child: const Icon(
          Icons.chevron_left,
          color: Colors.black87,
          size: 32,
        ),
      ),
    );
  }
}

// 输入框
class SearchInput extends StatefulWidget {
  final String hintText;
  final String value;
  final void Function()? onSearch; // 触发搜索
  final ValueChanged<String>? onSearchSubmit; // 用户提交搜索
  const SearchInput(
      {Key? key,
      this.hintText = "请输入搜索词",
      this.value = '',
      this.onSearch,
      this.onSearchSubmit})
      : super(key: key);

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  String _searchWord = '';
  late TextEditingController _controller;
  late FocusNode _focus;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.value);
    _focus = FocusNode();
    super.initState();
  }

  // 清除文本框内容
  void _onClean() {
    _controller.clear();
    setState(() {
      _searchWord = '';
    });
  }

  // 输入
  void _onChanged(String value) {
    setState(() {
      _searchWord = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(17)),
      child: TextField(
        focusNode: _focus,
        controller: _controller,
        // textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
            fontSize: 14, textBaseline: TextBaseline.alphabetic),
        onChanged: _onChanged,
        onTap: () {
          if(widget.onSearchSubmit == null) {
            // 当不在搜索页时，失去焦点
            _focus.unfocus();
          }
          widget.onSearch!();
        },
        onSubmitted: widget.onSearchSubmit,
        textInputAction: TextInputAction.search,
        // 键盘的enter键变成search
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: 15),
            // isCollapsed: true,
            hintText: widget.hintText,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
              size: 18,
            ),
            prefixIconConstraints: const BoxConstraints(minWidth: 30),
            suffixIcon: GestureDetector(
              onTap: _onClean,
              child: Icon(
                Icons.clear,
                color: _searchWord == '' ? Colors.transparent : Colors.grey,
                size: 18,
              ),
            ),
            suffixIconConstraints: const BoxConstraints(minWidth: 30),
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            border: InputBorder.none),
      ),
    );
  }
}

// 取消按钮
class SearchCancel extends StatelessWidget {
  final void Function()? cancelCallback;

  const SearchCancel({Key? key, this.cancelCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: cancelCallback,
        child: const Text(
          "取消",
          style: TextStyle(
              color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

// 地图
class SearchMap extends StatelessWidget {
  const SearchMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("地图");
      },
      child: Image.asset("assets/icons/widget_search_bar_map.png"),
    );
  }
}
