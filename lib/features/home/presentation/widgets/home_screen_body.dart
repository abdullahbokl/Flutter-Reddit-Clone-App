import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs_cubits/home_cubit.dart';
import 'post_card/post_card.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.posts.length,
          itemBuilder: (BuildContext context, int index) {
            final post = state.posts[index];
            return PostCard(post: post);
          },
        );
      },
    );
  }
}
