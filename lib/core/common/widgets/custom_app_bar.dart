import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../utils/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.centerTitle,
  });

  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool? centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      actions: actions,
      centerTitle: centerTitle,
      title: Builder(builder: (context) {
        return Text(
          title.tr(context: context),
          style: AppStyles.font28SatoshiW700(context),
        );
      }),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
