import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/enums/enums.dart';
import '../../../../core/common/widgets/custom_loading_indicator.dart';
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
    return BlocConsumer<PostsBloc, PostsState>(
      listener: (context, state) {
        if (state.status == RequestStatusEnum.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
            ),
          );
        }
      },
      buildWhen: (previous, current) => _buildWhen(current, previous),
      builder: (context, state) {
        return ListView.builder(
          controller: scrollController,
          itemCount: state.isMax ? state.posts.length : state.posts.length + 1,
          itemBuilder: (BuildContext context, int index) {
            return index == state.posts.length
                ? const CustomLoadingIndicator()
                : PostCard(post: state.posts[index]);
          },
        );
      },
    );
  }

  bool _buildWhen(PostsState current, PostsState previous) {
    return current.status == RequestStatusEnum.loading ||
        previous.status == RequestStatusEnum.loading;
  }
}
