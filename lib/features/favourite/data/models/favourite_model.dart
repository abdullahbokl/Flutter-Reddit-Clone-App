import 'package:reddit_clone/core/utils/app_strings.dart';

class FavouriteModel {
  final String id;
  final String title;
  final String image;
  final String description;

  FavouriteModel({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
  });

  factory FavouriteModel.fromMap(Map<String, dynamic> json) {
    return FavouriteModel(
      id: json[AppStrings.postModelId],
      title: json[AppStrings.prefsFavouriteName],
      image: json[AppStrings.prefsFavouriteImage],
      description: json[AppStrings.prefsFavouriteDescription],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      AppStrings.postModelId: id,
      AppStrings.prefsFavouriteName: title,
      AppStrings.prefsFavouriteImage: image,
      AppStrings.prefsFavouriteDescription: description,
    };
  }

  FavouriteModel copyWith({
    String? id,
    String? name,
    String? image,
    String? description,
  }) {
    return FavouriteModel(
      id: id ?? this.id,
      title: name ?? this.title,
      image: image ?? this.image,
      description: description ?? this.description,
    );
  }
}
