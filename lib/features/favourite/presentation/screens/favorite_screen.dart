import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/core/common/widgets/errors/request_error_widget.dart';

import '../../../../core/common/enums/enums.dart';
import '../../../../core/common/widgets/animated_display.dart';
import '../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../../core/utils/locale_keys.g.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../nav_bar/presentation/blocs_cubits/favourites_cubit.dart';
import '../widgets/favorite_screen_body.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FavouritesCubit>(),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: LocaleKeys.favorites,
        ),
        body: BlocBuilder<FavouritesCubit, FavouritesState>(
          builder: (context, state) {
            if (state.status == RequestStatusEnum.loading) {
              return const CustomLoadingIndicator();
            } else if (state.status == RequestStatusEnum.error) {
              return RequestErrorWidget(message: state.errorMessage);
            } else {
              return const AnimatedDisplay(
                child: FavoriteScreenBody(),
              );
            }
          },
        ),
      ),
    );
  }
}
