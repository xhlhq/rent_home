import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:rent_home/pages/login/login_1.dart';
import 'package:rent_home/pages/login/login_2.dart';
import 'package:rent_home/pages/login/login_3.dart';
import 'package:rent_home/pages/login/login_4.dart';

import 'package:rent_home/pages/main/index.dart';
import 'package:rent_home/pages/login/index.dart';
import 'package:rent_home/pages/not_found/index.dart';
import 'package:rent_home/pages/register/index.dart';
import 'package:rent_home/pages/room_page/room_detail/index.dart';
import 'package:rent_home/pages/room_page/room_manage/index.dart';
import 'package:rent_home/pages/room_page/room_publish/index.dart';
import 'package:rent_home/pages/setting/index.dart';
import 'package:rent_home/widgets/pick_image_test.dart';

// 首页
var mainHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return TabberMain();
});

// 登录页
var loginHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const LoginPage();
});
var login1Handler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return LoginScreen2();
});
var login2Handler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return LoginScreen3();
});
var login3Handler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return LoginScreen4();
});
var login4Handler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return LoginScreen6(onLoginClick: () {  },navigatePage: () {});
});
// 注册页
var registerHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const RegisterPage();
    });
// 设置页
var settingHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const SettingPage();
    });
// 404 页
var notFoundHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const NotFoundPage();
});

var pickImgHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const MyPickImageTest();
    });

// 房屋详情页
var roomDetailHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return RoomDetailPage(roomId: params['roomId']!.first);
    });
// 房屋管理页
var rooManageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const RoomManagePage();
    });
// 房源发布页
var rooPublishHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const RoomPublishPage();
    });