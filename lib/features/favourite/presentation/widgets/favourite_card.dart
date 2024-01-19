import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../nav_bar/data/models/favourite_model.dart';
import '../../../nav_bar/presentation/blocs_cubits/favourites_cubit.dart';

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({super.key, required this.post});

  final FavouriteModel post;

  @override
  Widget build(BuildContext context) {
    // horizontal card with post image, title, desc and trailling icon to remove from favourites
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      height: MediaQuery.of(context).size.height * 0.15,
      child: Row(
        children: [
          // post image
          Container(
            margin: const EdgeInsets.only(left: 10),
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                    post.image,
                    errorListener: (p0) => const Icon(Icons.error),
                  ),
                )),
          ),
          const SizedBox(width: 10),
          // post title and description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // post title
                Text(
                  post.title,
                  style: AppStyles.font20SatoshiW500(context),
                  maxLines: 2,
                ),
                const SizedBox(height: 10),
                // post description
                Text(
                  post.description,
                  style: AppStyles.font16SatoshiBold(context).copyWith(
                    color: Colors.grey[400],
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          // remove from favourites icon
          IconButton(
            onPressed: () {
              getIt<FavouritesCubit>().removeFavourite(post);
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
