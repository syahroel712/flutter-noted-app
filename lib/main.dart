import 'package:flutter/material.dart';
import 'package:flutter_noted_app/pages/home.dart';
// auth
import 'package:flutter_noted_app/pages/auth/login.dart';
import 'package:flutter_noted_app/pages/auth/register.dart';
import 'package:flutter_noted_app/pages/widgets/splash.dart';
// notes
import 'package:flutter_noted_app/pages/notes/index.dart';
import 'package:flutter_noted_app/pages/notes/form.dart';
// folder
import 'package:flutter_noted_app/pages/folders/index.dart';
import 'package:flutter_noted_app/pages/folders/form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final router = <String, WidgetBuilder>{
    '/': (_) => LoginPage(),
    '/register': (_) => RegisterPage(),
    '/home': (_) => HomePage(),
    '/splash': (_) => SplashWidget(),
    // note
    '/note': (_) => NotePage(),
    '/note_add': (_) => NoteFormPage(),
    // '/note_edit': (_) => HomePage(),
    // folder
    '/folder': (_) => FolderPage(),
    '/folder_add': (_) => FolderFormPage(),
    // '/folder_edit': (_) => HomePage(),
    // '/folder_detail': (_) => HomePage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins-Regular',
      ),
      debugShowCheckedModeBanner: false,
      routes: router,
      initialRoute: '/',
    );
  }
}
