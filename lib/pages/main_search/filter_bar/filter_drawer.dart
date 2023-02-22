///@author: fan
///@date: 2023/2/20 17:14
///@description: filter的抽屉drawer

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_home/view_model/drawer_view_model.dart';
import 'package:rent_home/pages/main_search/filter_bar/data.dart';
import 'package:rent_home/widgets/my_form/my_form_title.dart';

class FilterDrawer extends StatefulWidget {
  const FilterDrawer({Key? key}) : super(key: key);

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  void _onChange(String id) {
    Provider.of<DrawerViewModel>(context, listen: false).selectId(id);
  }

  @override
  Widget build(BuildContext context) {
    List<GeneralType>? roomTypeList = Provider.of<DrawerViewModel>(context).dataList['roomTypeList'];
    List<GeneralType>? orientedList = Provider.of<DrawerViewModel>(context).dataList['orientedList'];
    List<GeneralType>? floorList = Provider.of<DrawerViewModel>(context).dataList['floorList'];
    Set<String> allSelectedIds = Provider.of<DrawerViewModel>(context).selectList;
    return Drawer(
      child: SafeArea(
          child: ListView(
        children: [
          const MyFormTitle("户型"),
          FilterDrawerSelect(roomTypeList!,
              selectedIds: allSelectedIds, onChange: _onChange),
          const MyFormTitle("朝向"),
          FilterDrawerSelect(orientedList!,
              selectedIds: allSelectedIds, onChange: _onChange),
          const MyFormTitle("楼层"),
          FilterDrawerSelect(floorList!,
              selectedIds: allSelectedIds, onChange: _onChange),
        ],
      )),
    );
  }
}

class FilterDrawerSelect extends StatelessWidget {
  final List<GeneralType> list;
  final Set<String> selectedIds;
  final ValueChanged<String>? onChange;

  const FilterDrawerSelect(this.list,
      {super.key, this.selectedIds = const {}, this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: list.map((item) {
          bool isSelected = selectedIds.contains(item.id);
          return GestureDetector(
            onTap: () {
              if (onChange != null) {
                onChange!(item.id);
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(
                  color: isSelected
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 1)),
              child: Text(
                item.name,
                style: TextStyle(
                    color: isSelected
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                    fontSize: 16),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
