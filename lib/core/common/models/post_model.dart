import 'package:equatable/equatable.dart';

import '../../utils/app_strings.dart';

class PostModel extends Equatable {
  final String id;
  final String title;
  final String? link;
  final String? description;
  final String communityName;
  final String communityProfilePic;
  final List<String> upvotes;
  final List<String> downvotes;
  final int commentCount;
  final String username;
  final String uid;
  final String type;
  final DateTime createdAt;
  final List<String> awards;

  const PostModel({
    required this.id,
    required this.title,
    this.link,
    this.description,
    required this.communityName,
    required this.communityProfilePic,
    required this.upvotes,
    required this.downvotes,
    required this.commentCount,
    required this.username,
    required this.uid,
    required this.type,
    required this.createdAt,
    required this.awards,
  });

  PostModel copyWith({
    String? id,
    String? title,
    String? link,
    String? description,
    String? communityName,
    String? communityProfilePic,
    List<String>? upvotes,
    List<String>? downvotes,
    int? commentCount,
    String? username,
    String? uid,
    String? type,
    DateTime? createdAt,
    List<String>? awards,
  }) {
    return PostModel(
      id: id ?? this.id,
      title: title ?? this.title,
      link: link ?? this.link,
      description: description ?? this.description,
      communityName: communityName ?? this.communityName,
      communityProfilePic: communityProfilePic ?? this.communityProfilePic,
      upvotes: upvotes ?? this.upvotes,
      downvotes: downvotes ?? this.downvotes,
      commentCount: commentCount ?? this.commentCount,
      username: username ?? this.username,
      uid: uid ?? this.uid,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      awards: awards ?? this.awards,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      AppStrings.postModelId: id,
      AppStrings.postModelTitle: title,
      AppStrings.postModelLink: link,
      AppStrings.postModelDescription: description,
      AppStrings.postModelCommunityName: communityName,
      AppStrings.postModelCommunityProfilePic: communityProfilePic,
      AppStrings.postModelUpVotes: upvotes,
      AppStrings.postModelDownVotes: downvotes,
      AppStrings.postModelCommentCount: commentCount,
      AppStrings.postModelUsername: username,
      AppStrings.postModelUid: uid,
      AppStrings.postModelType: type,
      AppStrings.postModelCreatedAt: createdAt.millisecondsSinceEpoch,
      AppStrings.postModelAwards: awards,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map[AppStrings.postModelId] ?? '',
      title: map[AppStrings.postModelTitle] ?? '',
      link: map[AppStrings.postModelLink],
      description: map[AppStrings.postModelDescription],
      communityName: map[AppStrings.postModelCommunityName] ?? '',
      communityProfilePic: map[AppStrings.postModelCommunityProfilePic] ?? '',
      upvotes: List<String>.from(map[AppStrings.postModelUpVotes]),
      downvotes: List<String>.from(map[AppStrings.postModelDownVotes]),
      commentCount: map[AppStrings.postModelCommentCount]?.toInt() ?? 0,
      username: map[AppStrings.postModelUsername] ?? '',
      uid: map[AppStrings.postModelUid] ?? '',
      type: map[AppStrings.postModelType] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(
          map[AppStrings.postModelCreatedAt]),
      awards: List<String>.from(map[AppStrings.postModelAwards]),
    );
  }

  @override
  String toString() {
    return 'Post(id: $id, title: $title, link: $link, description: $description, communityName: $communityName, communityProfilePic: $communityProfilePic, upvotes: $upvotes, downvotes: $downvotes, commentCount: $commentCount, username: $username, uid: $uid, type: $type, createdAt: $createdAt, awards: $awards)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      title,
      link,
      description,
      communityName,
      communityProfilePic,
      upvotes,
      downvotes,
      commentCount,
      username,
      uid,
      type,
      createdAt,
      awards,
    ];
  }
}
