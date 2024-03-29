import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:reddit_clone/core/utils/service_locator.dart';

import '../../../../../core/common/models/post_model.dart';
import 'post_card_body.dart';
import 'post_card_footer.dart';
import 'post_card_header.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: getIt<ConnectivityResult>() == ConnectivityResult.none,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostCardHeader(post: post),
            const SizedBox(height: 8.0),
            PostCardBody(post: post),
            const SizedBox(height: 8.0),
            PostCardFooter(post: post),
          ],
        ),
      ),
    );
  }
}
