import 'package:flutter/material.dart';
import 'package:rent_home/application.dart';
import 'package:provider/provider.dart';
import 'package:rent_home/view_model/drawer_view_model.dart';

void main() {
  // runApp(const Application());

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<DrawerViewModel>(create: (_) => DrawerViewModel()),
    ],
    child: const Application(),
  ));
}