import 'package:anonymous/screens/introduction_page.dart';
import 'package:anonymous/screens/login_page.dart';
import 'package:anonymous/screens/menu_widget.dart';
import 'package:anonymous/screens/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anonymous',
      theme: ThemeData(
        fontFamily: "Times New Roman",
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        'login': (context) => LoginPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return IntroductionPage();
  }
}
