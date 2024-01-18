import 'package:flutter/material.dart';

import 'app_assets.dart';
import 'app_dimensions.dart';

abstract class AppStyles {
  /* Font Styles */

  static TextStyle generateTextStyle(
    BuildContext context, {
    required double fontSize,
    FontWeight fontWeight = FontWeight.normal,
    String fontFamily = AppAssets.fontsSatoshiMedium,
    bool responsive = true,
  }) {
    if (responsive) {
      fontSize = AppDimensions.getResponsiveFontSize(
        context,
        fontSize: fontSize,
      );
    }

    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static TextStyle font24TelmaBold(BuildContext context) {
    return generateTextStyle(
      context,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle font32TelmaW900(BuildContext context) {
    return generateTextStyle(
      context,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle font12SatoshiW100(BuildContext context) {
    return generateTextStyle(
      context,
      fontSize: 12,
      fontWeight: FontWeight.w100,
    );
  }

  static TextStyle font16SatoshiBold(BuildContext context) {
    return generateTextStyle(
      context,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle font20SatoshiW500(BuildContext context) {
    return generateTextStyle(
      context,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle font24SatoshiW700(BuildContext context) {
    return generateTextStyle(
      context,
      fontSize: 24,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle font28SatoshiW700(BuildContext context) {
    return generateTextStyle(
      context,
      fontSize: 28,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle font32SatoshiW900(BuildContext context) {
    return generateTextStyle(
      context,
      fontSize: 32,
      fontWeight: FontWeight.w900,
    );
  }
}
