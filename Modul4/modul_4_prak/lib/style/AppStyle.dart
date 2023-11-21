// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppStyle {
  static Color primaryColor = const Color(0xFF24A19C);
  static Color secondColor = const Color(0xFFFFFFFF);
  static Color tirtaColor = const Color(0xFF727986);
  static Color tirtaOnActiveColor = const Color(0xFF1F2937);
  static Color backgroundColor = const Color(0XFF111827);

  static Text titleAppBar = Text(
    "Headline.",
    style: TextStyle(color: primaryColor, fontSize: 24),
  );
  static Text timeDate = Text(
    "Today, ${DateFormat('MMMM d').format(DateTime.now())}",
    style: TextStyle(color: tirtaColor, fontSize: 16),
  );
}
