///@author: fan
///@date: 2023/2/21 12:55
///@description: 抽屉的数据模型

import 'package:flutter/material.dart';
import 'package:rent_home/pages/main_search/filter_bar/data.dart';

class DrawerViewModel extends ChangeNotifier {
  List<GeneralType> _roomTypeList = [];
  List<GeneralType> _orientedList = [];
  List<GeneralType> _floorList = [];
  final Set<String> _selectedList = <String>{};

  Map<String, List<GeneralType>> get dataList {
    var result = <String, List<GeneralType>>{};
    result['roomTypeList'] = _roomTypeList;
    result['orientedList'] = _orientedList;
    result['floorList'] = _floorList;
    return result;
  }
  set dataList(Map<String, List<GeneralType>> data) {
    _roomTypeList = data['roomTypeList']!;
    _orientedList = data['orientedList']!;
    _floorList = data['floorList']!;
    notifyListeners();
  }
  Set<String> get selectList {
    return _selectedList;
  }
  selectId(String id) {
    if(_selectedList.contains(id)){
      _selectedList.remove(id);
    }else{
      _selectedList.add(id);
    }
    notifyListeners();
  }
}