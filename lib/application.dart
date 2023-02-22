import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:rent_home/routes/index.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FluroRouter router = FluroRouter();
    Routes.configureRoutes(router);
    return MaterialApp(
      title: "应用",
      debugShowCheckedModeBanner: false,
      // supportedLocales: const [
      //   Locale('zh', 'CN'),
      // ],
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
          primaryColor: const Color.fromARGB(255, 31, 2, 18),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent),
      theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 66, 189, 86),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent),
      onGenerateRoute: router.generator,
    );
  }
}
