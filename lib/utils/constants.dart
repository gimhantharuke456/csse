import 'package:flutter/material.dart';

//colors
const Color primaryColor = Color(0xFFFFCE30);
const Color darkBlue = Color(0xFF182B69);
const Color successColor = Color(0xFF06B44B);
const Color rejectedColor = Color(0xFFFD0000);
const Color lightGrey = Color(0xFFF0F4FF);
const Color darkGrey = Color(0xFF626262);
//measurements
const Duration defaultDuration = Duration(milliseconds: 800);
const double defaultPadding = 16.0;

Color orderStateColors(String status) {
  switch (status) {
    case 'pending':
      return primaryColor;
    case 'approved':
      return successColor;
    case 'rejected':
      return rejectedColor;
    default:
      return primaryColor;
  }
}
