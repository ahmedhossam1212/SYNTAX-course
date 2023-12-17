import 'package:flutter/material.dart';

void navigatTo(BuildContext context, Widget widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));
