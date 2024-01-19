import 'package:flutter/material.dart';

import '../../../../../core/common/models/post_model.dart';
import 'post_card_body.dart';
import 'post_card_footer.dart';
import 'post_card_header.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostCardHeader(),
          SizedBox(height: 8.0),
          PostCardBody(),
          SizedBox(height: 8.0),
          PostCardFooter(),
        ],
      ),
    );
  }
}
