import 'package:flutter/material.dart';
import 'package:quizapp/utils/utils.dart';
import 'screens/Game_page.dart';
import 'screens/Home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      theme: AppTheme.ligthTheme,
      routes: {
        '/game': (context) => const GamePage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: const HomePage(),
    );
  }
}
