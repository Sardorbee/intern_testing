import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intern_testing/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) {
    runApp(const MainApp());
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}
