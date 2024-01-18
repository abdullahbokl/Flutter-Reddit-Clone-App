import 'package:flutter/material.dart';

import '../../../../core/common/widgets/animated_display.dart';
import '../../../../core/common/widgets/custom_app_bar.dart';
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
      body: AnimatedDisplay(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              ThemeSetting(),
              SizedBox(height: 10),
              LanguageSetting(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
