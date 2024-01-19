import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reddit_clone/core/utils/app_dimensions.dart';
import 'package:reddit_clone/core/utils/app_styles.dart';

import '../../../../../core/config/size_config.dart';

class PostCardBody extends StatelessWidget {
  const PostCardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Flutter is awesome!',
          style: AppStyles.font16SatoshiBold(context).copyWith(
            fontSize: AppDimensions.getResponsiveFontSize(
              context,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          'Flutter is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.',
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
            imageUrl:
                "https://cdn.pixabay.com/photo/2015/09/16/08/55/online-942408_960_720.jpg",
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
