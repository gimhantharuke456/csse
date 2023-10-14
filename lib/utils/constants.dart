import 'package:flutter/material.dart';

//urls
const String baseUrl =
    'https://77c2-2402-d000-a400-b8db-a0b1-6696-9f65-7b3c.ngrok-free.app';

//colors
const Color primaryColor = Color.fromARGB(255, 142, 154, 245);
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
