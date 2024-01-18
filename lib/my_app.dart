import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/common/blocs_cubits/theme/theme_cubit.dart';
import 'core/common/widgets/errors/no_internet_widget.dart';
import 'core/utils/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return ConnectivityAppWrapper(
          app: MaterialApp(
            theme: AppTheme.getTheme(),
            title: 'Flutter Demo',
            home: const Scaffold(
              body: ConnectivityWidgetWrapper(
                disableInteraction: true,
                offlineWidget: NoInternetWidget(),
                child: _BuildApp(),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _BuildApp extends StatelessWidget {
  const _BuildApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            shrinkWrap: true,
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
            shrinkWrap: true,
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
    );
  }
}
