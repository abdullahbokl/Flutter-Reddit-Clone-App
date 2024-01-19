// reddit post card
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reddit_clone/core/utils/app_styles.dart';

import '../../../../../core/utils/app_dimensions.dart';

class PostCardHeader extends StatelessWidget {
  const PostCardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // user avatar
        CircleAvatar(
          radius: 16.0,
          backgroundImage: const CachedNetworkImageProvider(
            "https://cdn2.iconfinder.com/data/icons/ui-v-1-circular-glyph/48/UI_v.1-Circular-Glyph-20-512.png",
          ),
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
                'r/FlutterDev',
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
                    'AbdulRafay',
                    style: AppStyles.font16SatoshiBold(context).copyWith(
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    ' 1 hour ago',
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
