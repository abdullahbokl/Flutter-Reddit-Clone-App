import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/enums/enums.dart';
import '../../../../core/common/widgets/animated_display.dart';
import '../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../../core/common/widgets/errors/request_error_widget.dart';
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
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_circle_rounded),
            ),
          ],
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            print("state.requestStatus  ${state.requestStatus}  ");
            if (state.requestStatus == RequestStatusEnum.loading) {
              return const CustomLoadingIndicator();
            } else if (state.requestStatus == RequestStatusEnum.error) {
              return RequestErrorWidget(message: state.errorMessage ?? '');
            } else {
              return const AnimatedDisplay(
                child: HomeScreenBody(),
              );
            }
          },
        ),
      ),
    );
  }
}
