import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/service_locator.dart';
import '../blocs_cubits/posts_bloc/posts_bloc.dart';
import 'post_card/post_card.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 100) {
        getIt<PostsBloc>().add(FetchPostsEvent());
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsBloc, PostsState>(
      buildWhen: (previous, current) => previous.posts != current.posts,
      builder: (context, state) {
        return ListView.builder(
          controller: scrollController,
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
