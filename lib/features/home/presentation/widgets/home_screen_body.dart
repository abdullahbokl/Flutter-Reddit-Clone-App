import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/service_locator.dart';
import '../blocs_cubits/posts_bloc/posts_bloc.dart';
import 'post_card/post_card.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsBloc, PostsState>(
      buildWhen: (previous, current) => previous.posts != current.posts,
      builder: (context, state) {
        return ListView.builder(
          controller: getIt<PostsBloc>().scrollController,
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
