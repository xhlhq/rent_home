import 'package:fluro/fluro.dart';
import 'package:rent_home/routes/route_handlers.dart';

class Routes{
  // 路由名称
  static String main = '/';
  static String login = '/login';
  static String login1 = '/login1';
  static String login2 = '/login2';
  static String login3 = '/login3';
  static String login4 = '/login4';
  static String register = '/register';
  static String setting = '/setting';
  static String notFound = '/not_found';
  static String pickImg = '/pick_img';

  static String roomDetail = '/room_detail/:roomId';
  static String roomManage = '/room_manage';
  static String roomPublish = '/room_publish';

  
  // 路由处理函数
  static void configureRoutes(FluroRouter router) {
    router.define(main, handler: mainHandler, transitionType: TransitionType.inFromRight);

    router.define(login, handler: loginHandler, transitionType: TransitionType.inFromRight);
    router.define(login1, handler: login1Handler, transitionType: TransitionType.inFromRight);
    router.define(login2, handler: login2Handler, transitionType: TransitionType.inFromRight);
    router.define(login3, handler: login3Handler, transitionType: TransitionType.inFromRight);
    router.define(login4, handler: login4Handler, transitionType: TransitionType.inFromRight);
    router.define(register, handler: registerHandler, transitionType: TransitionType.inFromRight);
    router.define(setting, handler: settingHandler, transitionType: TransitionType.inFromRight);
    router.define(pickImg, handler: pickImgHandler, transitionType: TransitionType.inFromRight);

    router.define(roomDetail, handler: roomDetailHandler, transitionType: TransitionType.inFromRight);
    router.define(roomManage, handler: rooManageHandler, transitionType: TransitionType.inFromRight);
    router.define(roomPublish, handler: rooPublishHandler, transitionType: TransitionType.inFromRight);
    router.notFoundHandler = notFoundHandler;
  }
}