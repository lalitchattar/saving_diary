import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Color getColorFromHex(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor"; // add alpha if missing
  }
  return Color(int.parse(hexColor, radix: 16));
}

String formatNumber(double value, {String pattern = "#.##"}) {
  try {
    final formatter = NumberFormat(pattern);
    return formatter.format(value);
  } catch (e) {
    return value.toString();
  }
}

String maskString(String input, {int maskLength = 4}) {
  if (input.isEmpty) return '';

  // Ensure maskLength is 4 or 5
  maskLength = maskLength.clamp(4, 5);

  // Get last 4 characters
  final visiblePart = input.length <= 4 ? input : input.substring(input.length - 4);

  // Return masked string
  return '${'*' * maskLength}$visiblePart';
}

