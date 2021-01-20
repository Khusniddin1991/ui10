import 'package:flutter/material.dart';
import 'package:flutter_ui9/pages/MyHomePage.dart';
import 'package:flutter_ui9/pages/Sign%20Up.dart';
import 'package:flutter_ui9/pages/Sign%20in.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("hive");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        MyHomePage.id:(ctx)=>MyHomePage(),
        SignUp.id:(ctx)=>SignUp(),
        SignInPage.id:(ctx)=>SignInPage()
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home:SignUp(),

    );
  }
}

