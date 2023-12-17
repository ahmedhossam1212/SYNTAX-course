import 'package:flutter/material.dart';
import 'package:syntax_course/EGYbest/presentation/view/screens/movie_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MovieScreen(),
    );
  }
}
