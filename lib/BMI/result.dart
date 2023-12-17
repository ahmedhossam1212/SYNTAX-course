import 'package:flutter/material.dart';
import 'package:syntax_course/EGYbest/utils/colors.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key,
      required this.result,
      required this.height,
      required this.age,
      required this.weight,
      required this.gender});

  final num result;
  final double height;
  final int age;
  final int weight;
  final bool gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        centerTitle: true,
        title: const Text("RESULT"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Result : $result",
              style: TextStyle(color: AppColors.white, fontSize: 20),
            ),
            Text(
              gender ? " Gender : Male" : " Gender : Female",
              style: TextStyle(color: AppColors.white, fontSize: 20),
            ),
            Text(
              "Height : ${height.round()}",
              style: TextStyle(color: AppColors.white, fontSize: 20),
            ),
            Text(
              "Weight : $weight",
              style: TextStyle(color: AppColors.white, fontSize: 20),
            ),
            Text(
              "Age : $age",
              style: TextStyle(color: AppColors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
