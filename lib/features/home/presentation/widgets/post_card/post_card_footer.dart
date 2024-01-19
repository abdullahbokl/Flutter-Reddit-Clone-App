import 'package:flutter/material.dart';
import 'package:reddit_clone/core/utils/app_styles.dart';

class PostCardFooter extends StatelessWidget {
  const PostCardFooter({super.key});

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
              '1.5k',
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
              '100',
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
