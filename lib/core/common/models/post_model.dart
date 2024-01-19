import 'package:equatable/equatable.dart';

import '../../utils/app_strings.dart';

class PostModel extends Equatable {
  // post
  final String id;
  final String title;
  final String? link;
  final String? description;
  final int? upVotes;
  final int? downVotes;
  final int commentCount;
  final DateTime createdAt;
  final bool isFavourite;

  // user
  final String userName;
  final String uid;
  final String? userAvatar;

  // community
  final String? communityName;

  const PostModel({
    required this.id,
    required this.title,
    this.link,
    this.description,
    required this.upVotes,
    required this.downVotes,
    required this.commentCount,
    required this.userName,
    required this.uid,
    required this.createdAt,
    required this.isFavourite,
    this.userAvatar,
    this.communityName,
  });

  PostModel copyWith({
    // post
    String? id,
    String? title,
    String? link,
    String? description,
    int? upVotes,
    int? downVotes,
    int? commentCount,
    bool? isFavourite,
    DateTime? createdAt,
    // user
    String? username,
    String? uid,
    String? userAvatar,
    // community
    String? communityName,
  }) {
    return PostModel(
      id: id ?? this.id,
      title: title ?? this.title,
      link: link ?? this.link,
      description: description ?? this.description,
      upVotes: upVotes ?? this.upVotes,
      downVotes: downVotes ?? this.downVotes,
      commentCount: commentCount ?? this.commentCount,
      userName: username ?? this.userName,
      uid: uid ?? this.uid,
      createdAt: createdAt ?? this.createdAt,
      isFavourite: isFavourite ?? this.isFavourite,
      userAvatar: userAvatar ?? this.userAvatar,
      communityName: communityName ?? this.communityName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      AppStrings.postModelId: id,
      AppStrings.postModelTitle: title,
      AppStrings.postModelLink: link,
      AppStrings.postModelDescription: description,
      AppStrings.postModelUpVotes: upVotes,
      AppStrings.postModelDownVotes: downVotes,
      AppStrings.postModelCommentCount: commentCount,
      AppStrings.postModelUsername: userName,
      AppStrings.postModelUid: uid,
      AppStrings.postModelCreatedAt: createdAt.millisecondsSinceEpoch,
      AppStrings.postModelIsFavourite: isFavourite,
      AppStrings.postModelUserAvatar: userAvatar,
      AppStrings.postModelCommunityName: communityName,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map[AppStrings.postModelId] ?? '',
      title: map[AppStrings.postModelTitle] ?? '',
      link: map[AppStrings.postModelLink],
      description: map[AppStrings.postModelDescription],
      upVotes: map[AppStrings.postModelUpVotes] ?? 0,
      downVotes: map[AppStrings.postModelDownVotes] ?? 0,
      commentCount: map[AppStrings.postModelCommentCount]?.toInt() ?? 0,
      userName: map[AppStrings.postModelUsername] ?? '',
      uid: map[AppStrings.postModelUid] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(
          map[AppStrings.postModelCreatedAt]),
      isFavourite: map[AppStrings.postModelIsFavourite] ?? false,
      userAvatar: map[AppStrings.postModelUserAvatar],
      communityName: map[AppStrings.postModelCommunityName],
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      title,
      link,
      description,
      upVotes,
      downVotes,
      commentCount,
      userName,
      uid,
      createdAt,
      isFavourite,
      userAvatar,
      communityName,
    ];
  }
}
