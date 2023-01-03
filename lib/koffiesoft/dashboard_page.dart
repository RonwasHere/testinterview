import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181A20),
      body: Center(
        child: Text(
          'Welcome',
          style: TextStyle(fontSize: 30, color: Colors.red),
        ),
      ),
    );
  }
}
