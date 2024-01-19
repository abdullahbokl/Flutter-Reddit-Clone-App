import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../nav_bar/presentation/blocs_cubits/favourites_cubit.dart';
import 'favourite_card.dart';

class FavoriteScreenBody extends StatelessWidget {
  const FavoriteScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: BlocBuilder<FavouritesCubit, FavouritesState>(
        builder: (context, state) {
          return ListView.separated(
            itemCount: state.favourites.length,
            itemBuilder: (BuildContext context, int index) {
              return FavouriteCard(
                post: state.favourites[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 10);
            },
          );
        },
      ),
    );
  }
}
