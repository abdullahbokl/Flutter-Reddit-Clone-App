import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/animated_display.dart';
import '../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../core/utils/locale_keys.g.dart';
import '../../../../core/utils/service_locator.dart';
import '../blocs_cubits/home_cubit.dart';
import '../widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.home,
          actions: [
            //   add post button
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_circle_rounded),
            ),
          ],
        ),
        body: const AnimatedDisplay(
          child: HomeScreenBody(),
        ),
      ),
    );
  }
}
