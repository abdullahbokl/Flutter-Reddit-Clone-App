import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/locale_keys.g.dart';
import '../widgets/language_setting.dart';
import '../widgets/theme_setting.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Builder(builder: (context) {
          return Text(
            LocaleKeys.settings.tr(context: context),
            style: AppStyles.font24SatoshiW700(context),
          );
        }),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          ThemeSetting(),
          SizedBox(height: 10),
          LanguageSetting(),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
