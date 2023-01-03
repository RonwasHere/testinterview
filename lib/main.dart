import 'package:flutter/material.dart';
import 'package:testinterview/coba/satu.dart';
import 'package:testinterview/coba/second.dart';
import 'package:testinterview/koffiesoft/dashboard_page.dart';
import 'package:testinterview/koffiesoft/login_page.dart';
import 'package:testinterview/koffiesoft/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        // '/': (context) => SatuPage(),
        // '/second': (context) => SecondPage(),

        //koffiesoft
         '/': (context) => LoginPage(),
         '/register': (context) => RegisterPage(),
         '/dashboard': (context) => DashboardPage(),
      },
      
    );
  }
}

  