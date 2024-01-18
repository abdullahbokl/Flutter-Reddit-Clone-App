import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../core/utils/locale_keys.g.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: LocaleKeys.home,
      ),
      body: Center(
        child: Text(LocaleKeys.home.tr(context: context)),
      ),
    );
  }
}
