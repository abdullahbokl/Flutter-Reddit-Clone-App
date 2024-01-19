// reddit post card
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reddit_clone/core/utils/app_styles.dart';

import '../../../../../core/common/models/post_model.dart';
import '../../../../../core/utils/app_dimensions.dart';

class PostCardHeader extends StatelessWidget {
  const PostCardHeader({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // user avatar
        CircleAvatar(
          radius: 16.0,
          backgroundImage: CachedNetworkImageProvider('${post.userAvatar}'),
          onBackgroundImageError: (exception, stackTrace) =>
              const Icon(Icons.error),
        ),
        const SizedBox(width: 10.0),
        // user name and post time
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'r/${post.communityName}',
                style: AppStyles.font16SatoshiBold(context).copyWith(
                  fontSize: AppDimensions.getResponsiveFontSize(
                    context,
                    fontSize: 18,
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    'Posted by u/',
                    style: AppStyles.font16SatoshiBold(context).copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    post.userName,
                    style: AppStyles.font16SatoshiBold(context).copyWith(
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    ' ${DateTime.now().difference(post.createdAt).inHours} hours ago',
                    style: AppStyles.font16SatoshiBold(context).copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // more icon
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}
