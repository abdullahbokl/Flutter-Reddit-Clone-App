import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/locale_keys.g.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Builder(builder: (context) {
          return Text(
            LocaleKeys.favorites.tr(context: context),
          );
        }),
      ),
      body: Center(
        child: Text(LocaleKeys.favorites.tr(context: context)),
      ),
    );
  }
}
