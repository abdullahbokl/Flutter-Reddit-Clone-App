import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reddit_clone/core/utils/app_dimensions.dart';
import 'package:reddit_clone/core/utils/app_styles.dart';

import '../../../../../core/common/models/post_model.dart';
import '../../../../../core/config/size_config.dart';

class PostCardBody extends StatelessWidget {
  const PostCardBody({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          post.title,
          style: AppStyles.font16SatoshiBold(context).copyWith(
            fontSize: AppDimensions.getResponsiveFontSize(
              context,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          post.description ?? '',
          style: AppStyles.font16SatoshiBold(context).copyWith(
            color: Colors.grey,
            fontSize: AppDimensions.getResponsiveFontSize(
              context,
              fontSize: 18,
            ),
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 12.0),
        Container(
          height: SizeConfig.height * 0.3,
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: CachedNetworkImage(
            imageUrl: post.link ?? '',
            fit: BoxFit.cover,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ],
    );
  }
}
