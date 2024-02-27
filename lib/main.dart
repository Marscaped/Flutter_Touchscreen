import 'package:flutter/material.dart';
import 'package:flutter_touchscreen/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MARScaped Embedded Touchscreen',
      theme: ThemeData.dark(useMaterial3: true),
      home: const LoginPage(),
    );
  }
}
