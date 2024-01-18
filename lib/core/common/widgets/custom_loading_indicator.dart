import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../utils/app_colors.dart';
import '../../utils/service_locator.dart';
import '../blocs_cubits/theme/theme_cubit.dart';
import '../enums/enums.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = getIt<ThemeCubit>().themeMode;
    return SpinKitFadingCircle(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: theme.name == ThemeModesEnum.light.name
                ? AppColors.lightOnPrimaryColor
                : AppColors.darkOnPrimaryColor,
          ),
        );
      },
    );
  }
}
