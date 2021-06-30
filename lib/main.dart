import 'package:flutter/material.dart';
import 'package:flutter_noted_app/pages/home.dart';
import 'package:flutter_noted_app/pages/auth/login.dart';
import 'package:flutter_noted_app/pages/auth/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final router = <String, WidgetBuilder>{
    '/': (_) => LoginPage(),
    '/register': (_) => RegisterPage(),
    '/home': (_) => HomePage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins-Regular',
      ),
      debugShowCheckedModeBanner: false,
      routes: router,
      initialRoute: '/',
    );
  }
}
