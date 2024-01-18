import 'package:flutter/material.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.wifi_off,
          color: Colors.red,
          size: 50.0,
        ),
        SizedBox(height: 10.0),
        Text(
          'No Internet Connection!',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Please check your internet connection',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}
