import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/core/utils/app_theme.dart';

import 'core/common/blocs_cubits/theme/theme_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // throw Exception("test");
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          theme: AppTheme.getTheme(),
          title: 'Flutter Demo',
          home: Scaffold(
            appBar: AppBar(
              title: Text('Reddit Clone'),
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                  icon: Icon(Icons.brightness_4_outlined),
                ),
              ],
            ),
            body: Column(
              // card
              // horizontal list
              // vertical list
              children: [
                // card
                ElevatedButton(
                  onPressed: () {
                    throw Exception("test");
                  },
                  child: Card(
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.red,
                    ),
                  ),
                ),
                // horizontal list
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 100,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 10,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        width: 100,
                        color: Colors.green,
                        child: Center(child: Text('Item $index')),
                      );
                    },
                  ),
                ),
                // vertical list
                Expanded(
                  child: ListView.separated(
                    itemCount: 10,
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        width: 100,
                        color: Colors.red,
                        child: Center(child: Text('Item $index')),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
