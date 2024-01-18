import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/blocs_cubits/theme/theme_cubit.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/locale_keys.g.dart';
import '../../../../core/utils/service_locator.dart';
import '../widgets/setting_card.dart';

class ThemeSetting extends StatelessWidget {
  const ThemeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light;
    return SettingCard(
      title: LocaleKeys.theme,
      widget: Row(
        children: [
          Text(
            LocaleKeys.dark.tr(context: context),
            style: AppStyles.font20SatoshiW500(context),
          ),
          StatefulBuilder(
            builder: (context, setState) {
              return Switch(
                value: isLight,
                onChanged: (value) {
                  setState(() {
                    isLight = value;
                    getIt<ThemeCubit>().toggleTheme();
                  });
                },
              );
            },
          ),
          Text(
            LocaleKeys.light.tr(context: context),
            style: AppStyles.font20SatoshiW500(context),
          ),
        ],
      ),
    );
  }
}
