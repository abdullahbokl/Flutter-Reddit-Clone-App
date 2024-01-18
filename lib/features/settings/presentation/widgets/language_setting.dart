import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_dimensions.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/locale_keys.g.dart';
import 'setting_card.dart';

class LanguageSetting extends StatelessWidget {
  const LanguageSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingCard(
      title: tr(LocaleKeys.language),
      // dropdown list of languages
      widget: DropdownButton<String>(
        value: context.locale.toString(),
        icon: const Icon(Icons.expand_circle_down),
        iconSize: AppDimensions.getResponsiveIconSize(context, iconSize: 24),
        underline: const SizedBox.shrink(),
        onChanged: (String? newValue) async {
          await context.setLocale(Locale(newValue!));
        },
        items: context.supportedLocales.map((Locale locale) {
          return DropdownMenuItem<String>(
            value: locale.toString(),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
              child: Text(
                locale.languageCode.toUpperCase(),
                style: AppStyles.font20SatoshiW500(context),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
