import 'package:examflutteradvanced/screen/provider/home_provider.dart';
import 'package:examflutteradvanced/screen/view/Api_screen.dart';
import 'package:examflutteradvanced/screen/view/button%20screen/button_screen.dart';
import 'package:examflutteradvanced/screen/view/pattern_screen.dart';
import 'package:examflutteradvanced/todo/provider/to_do_provider.dart';
import 'package:examflutteradvanced/todo/view/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => CovidProvider(),),
      ChangeNotifierProvider(create: (context) => ToListProvider(),),
  ],
    child: MaterialApp(debugShowCheckedModeBanner: false,
      routes: {
      '/':(context) => botton_screen(),
        'pattern':(context) => HomeScreen(),
        'Todo':(context) => Todo(),
        'Api_screen':(context) => Api_screen(),
      },
    ),
  ),
  );
}