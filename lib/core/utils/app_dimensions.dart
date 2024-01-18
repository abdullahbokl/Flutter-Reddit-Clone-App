import 'package:flutter/material.dart';

import '../config/size_config.dart';

abstract class AppDimensions {
  static double getResponsiveFontSize(context, {required double fontSize}) {
    double scaleFactor = getScaleFactor(context);
    double responsiveFontSize = fontSize * scaleFactor;

    double lowerLimit = fontSize * .8;
    double upperLimit = fontSize * 1.2;

    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }

  static double getResponsiveIconSize(context, {required double iconSize}) {
    double scaleFactor = getScaleFactor(context);
    double responsiveIconSize = iconSize * scaleFactor;

    double lowerLimit = iconSize * .8;
    double upperLimit = iconSize * 1.2;

    return responsiveIconSize.clamp(lowerLimit, upperLimit);
  }

  static double getScaleFactor(context) {
    // var dispatcher = PlatformDispatcher.instance;
    // var physicalWidth = dispatcher.views.first.physicalSize.width;
    // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
    // double width = physicalWidth / devicePixelRatio;

    double width = MediaQuery.sizeOf(context).width;
    if (width < SizeConfig.tablet) {
      return width / 550;
    } else if (width < SizeConfig.desktop) {
      return width / 1000;
    } else {
      return width / 1920;
    }
  }
}
