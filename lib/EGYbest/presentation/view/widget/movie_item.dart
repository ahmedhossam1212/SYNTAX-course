import 'package:flutter/material.dart';
import 'package:syntax_course/EGYbest/models/model.dart';
import 'package:syntax_course/EGYbest/utils/colors.dart';

Widget buildMovieItem(Results model) => Material(
      clipBehavior: Clip.hardEdge,
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      elevation: 10,
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          color: AppColors.white,
        ),
        child: Column(
          children: [
            Text(
              model.title,
              style: TextStyle(fontSize: 15, color: AppColors.darkBlue),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.network(
              model.backdropPath,
              fit: BoxFit.cover,
              height: 250,
            ),
          ],
        ),
      ),
    );
