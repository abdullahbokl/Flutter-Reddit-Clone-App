import 'dart:math';

import 'core/common/models/post_model.dart';
import 'core/utils/service_locator.dart';
import 'features/home/presentation/blocs_cubits/posts_bloc/posts_bloc.dart';

List<PostModel> generateRandomPosts() {
  final List<String> titles = [
    'Awesome Post',
    'Interesting Topic',
    'Code Challenge',
    'Daily Reflection',
    'Tech News',
    'Thoughts on Programming',
    'My Journey in Coding',
    'Fun with Dart',
    'Flutter Tips',
    'Best Practices',
  ];

  final List<String> descriptions = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
    'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore.',
    'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt.',
    'Aenean ut sagittis leo, nec scelerisque arcu.',
    'Proin sit amet egestas justo. Nam ac justo a odio feugiat feugiat.',
    'Maecenas fringilla mauris quis facilisis ultrices.',
    'Curabitur auctor, sapien et aliquet tincidunt, purus metus convallis augue.',
    'Vestibulum tristique erat in turpis aliquam venenatis.',
  ];

  final avatarImage = [
    "https://s.hdnux.com/photos/51/23/24/10827008/4/1200x0.jpg",
    "https://static.independent.co.uk/s3fs-public/thumbnails/image/2015/06/06/15/Chris-Pratt.jpg",
    "https://www.allprodad.com/wp-content/uploads/2021/03/05-12-21-happy-people.jpg",
    "https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/09/27/08/jennifer-lawrence.jpg",
  ];

  final postsImages = [
    "https://cdn.pixabay.com/photo/2015/09/16/08/55/online-942408_960_720.jpg",
    "https://images.tech.co/wp-content/uploads/2022/10/14123538/socialmedia-1-1024x512.jpg",
    "https://insights.som.yale.edu/sites/default/files/styles/max_2600x2600/public/2021-06/210606_AddictiveSocialMedia_FINAL_0.png?itok=Eiw5yNzF",
    "https://uploads-ssl.webflow.com/5f841209f4e71b2d70034471/60bb4a2e143f632da3e56aea_Flutter%20app%20development%20(2).png",
    "https://www.biztechcs.com/wp-content/uploads/2021/04/Why-Flutter-is-Better-for-App-Development-jpg-webp.webp",
  ];

  final List<String> comNames = [
    "FlutterDev",
    "Dart",
    "Firebase",
    "Flutter",
    "AndroidDev",
    "iOSDev",
    "ReactNative",
    "React",
    "Kotlin",
    "Swift",
    "Java",
    "JavaScript",
    "TypeScript",
  ];

  final Random random = Random();

  List<PostModel> posts = List.generate(50, (index) {
    return PostModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: titles[random.nextInt(titles.length)],
      description: descriptions[random.nextInt(descriptions.length)],
      createdAt: DateTime.now().subtract(Duration(days: random.nextInt(30))),
      userName: 'User${index + 1}',
      commentCount: random.nextInt(20),
      isFavourite: true,
      upVotes: random.nextInt(50),
      downVotes: random.nextInt(10),
      uid: random.nextInt(100).toString(),
      link:
          postsImages[random.nextInt(postsImages.length) % postsImages.length],
      communityName:
          comNames[random.nextInt(comNames.length) % comNames.length],
      userAvatar:
          avatarImage[random.nextInt(avatarImage.length) % avatarImage.length],
    );
  });

  return posts;
}

generateList() {
  List<PostModel> randomPosts = generateRandomPosts();
  int cnt = 0;
  getIt<PostsBloc>().add(AddPostEvent(
    post: randomPosts[cnt++],
  ));
  // Timer.periodic(const Duration(seconds: 2), (timer) async {
  //   print("post added");
  //   if (cnt == 1) {
  //     timer.cancel();
  //   }
  // });
}
