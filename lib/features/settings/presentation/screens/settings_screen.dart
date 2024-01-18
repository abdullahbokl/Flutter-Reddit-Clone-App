import 'package:flutter/material.dart';
import 'package:reddit_clone/core/common/widgets/custom_app_bar.dart';

import '../../../../core/utils/locale_keys.g.dart';
import '../widgets/language_setting.dart';
import '../widgets/theme_setting.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.settings,
      ),
      body: Column(
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
