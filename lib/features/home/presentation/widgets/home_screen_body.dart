import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/features/home/presentation/widgets/post_card/post_card.dart';

import '../blocs_cubits/home_cubit.dart';

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
