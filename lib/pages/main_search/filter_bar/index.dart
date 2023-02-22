///@author: fan
///@date: 2023/2/20 15:47
///@description: FilterBar组件

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_home/view_model/drawer_view_model.dart';
import 'package:rent_home/pages/main_search/filter_bar/data.dart';
import 'package:rent_home/widgets/my_form/my_form_item.dart';

class FilterBar extends StatefulWidget {
  final ValueChanged<FilterBarResult>? onChange;

  const FilterBar({Key? key, this.onChange}) : super(key: key);

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  bool isAreaActive = false;
  bool isRentTypeActive = false;
  bool isPriceActive = false;
  bool isFilterActive = false;

  String areaId = '';
  String rentTypeId = '';
  String priceId = '';
  List<String> moreIds = [];

  void  _onAreaChange(context) async {
    setState(() {
      isAreaActive = true;
    });
    var value = await MyPicker.showPicker(context: context, options: areaList.map((e) => e.name).toList(), value: 0);
    setState(() {
      isAreaActive = false;
    });
    if(value == null)return;
    setState(() {
      areaId = areaList[value].id;
    });
    _onChange();
  }

  void _onRentTypeChange(context) async {
    setState(() {
      isRentTypeActive = true;
    });
    var value = await MyPicker.showPicker(context: context, options: rentTypeList.map((e) => e.name).toList(), value: 0);
    setState(() {
      isRentTypeActive = false;
    });
    if(value == null)return;
    setState(() {
      rentTypeId = rentTypeList[value].id;
    });
    _onChange();
  }

  void _onPriceChange(context) async {
    setState(() {
      isPriceActive = true;
    });
    var value = await MyPicker.showPicker(context: context, options: priceList.map((e) => e.name).toList(), value: 0);
    setState(() {
      isPriceActive = false;
    });
    if(value == null)return;
    setState(() {
      priceId = priceList[value].id;
    });
    _onChange();
  }

  void _onFilterChange(context) {
    Map<String, List<GeneralType>> dataList = {};
    dataList['roomTypeList'] = roomTypeList;
    dataList['orientedList'] = orientedList;
    dataList['floorList'] = floorList;
    Provider.of<DrawerViewModel>(context, listen: false).dataList = dataList;

    Scaffold.of(context).openEndDrawer();
    // _onChange();
  }

  _onChange() {
    widget.onChange!(FilterBarResult(
        areaId: areaId,
        priceId: priceId,
        rentTypeId: rentTypeId,
        moreIds: moreIds));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12, width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FilterBarItem(
            title: "区域",
            isActive: isAreaActive,
            onTap: _onAreaChange,
          ),
          FilterBarItem(
            title: "方式",
            isActive: isRentTypeActive,
            onTap: _onRentTypeChange,
          ),
          FilterBarItem(
            title: "组件",
            isActive: isPriceActive,
            onTap: _onPriceChange,
          ),
          FilterBarItem(
            title: "筛选",
            isActive: isFilterActive,
            onTap: _onFilterChange,
          ),
        ],
      ),
    );
  }
}

class FilterBarItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final void Function(BuildContext context)? onTap;

  const FilterBarItem(
      {Key? key, required this.title, this.isActive = false, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = isActive ? Theme.of(context).primaryColor : Colors.black87;
    return GestureDetector(
        onTap: () {
          onTap!(context);
        },
        child: Container(
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, color: color),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: color,
                size: 20,
              )
            ],
          ),
        ));
  }
}
