import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/widgets/animated_display.dart';
import '../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../core/utils/locale_keys.g.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: LocaleKeys.favorites,
      ),
      body: AnimatedDisplay(
        child: Center(
          child: Text(LocaleKeys.favorites.tr(context: context)),
        ),
      ),
    );
  }
}
