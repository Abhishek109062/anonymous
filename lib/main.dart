import 'dart:async';
import 'package:anonymous/colorTheme.dart';
import 'package:anonymous/screens/introduction_page.dart';
import 'package:anonymous/screens/login_page.dart';
import 'package:anonymous/screens/signup_page.dart';
import 'package:anonymous/widgets/menu_widget.dart';
import 'package:anonymous/screens/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        primaryColor: primaryColor,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        'logIn': (context) => LoginPage(),
        'SignUp': (context) => SignUpPage(),
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
  loadSignIn() async {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => IntroductionPage()));
    });
  }

  @override
  void initState() {
    super.initState();
    loadSignIn();
  }

  @override
  Widget build(BuildContext context) {
    return SplashPage();
  }
}
