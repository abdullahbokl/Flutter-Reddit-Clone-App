import 'package:flutter/material.dart';

import '../../../../../core/common/models/post_model.dart';
import '../../../../../core/utils/app_styles.dart';

class PostCardFooter extends StatelessWidget {
  const PostCardFooter({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_upward),
            ),
            Text(
              post.upVotes.toString(),
              style: AppStyles.font16SatoshiBold(context).copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_downward),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.comment),
            ),
            Text(
              "${post.commentCount}",
              style: AppStyles.font16SatoshiBold(context).copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.bookmark_border),
        ),
      ],
    );
  }
}
