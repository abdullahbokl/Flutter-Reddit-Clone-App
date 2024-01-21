import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/enums/enums.dart';
import '../../../../core/common/widgets/animated_display.dart';
import '../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../../core/common/widgets/errors/request_error_widget.dart';
import '../../../../core/utils/locale_keys.g.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../../dummy_data.dart';
import '../blocs_cubits/posts_bloc/posts_bloc.dart';
import '../widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PostsBloc>(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.home,
          actions: [
            IconButton(
              onPressed: () {
                generateList();
              },
              icon: const Icon(Icons.add_circle_rounded),
            ),
          ],
        ),
        body: BlocBuilder<PostsBloc, PostsState>(
          // build the body only when the status is initial or error
          buildWhen: (previous, current) => _buildWhen(current, previous),
          builder: (context, state) {
            if (state.status == RequestStatusEnum.initial) {
              return const CustomLoadingIndicator();
            } else if (state.status == RequestStatusEnum.error) {
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

  bool _buildWhen(PostsState current, PostsState previous) {
    return current.status == RequestStatusEnum.initial ||
        previous.status == RequestStatusEnum.initial ||
        previous.status == RequestStatusEnum.error ||
        current.status == RequestStatusEnum.error;
  }
}
