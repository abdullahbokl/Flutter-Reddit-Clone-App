import 'package:flutter/material.dart';

import '../../../utils/app_styles.dart';

class RequestErrorWidget extends StatelessWidget {
  const RequestErrorWidget({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 50.0,
          ),
          const SizedBox(height: 10.0),
          Text(
            'Error Occurred!',
            style: AppStyles.font16SatoshiBold(context),
          ),
          const SizedBox(height: 10.0),
          Text(
            message,
            textAlign: TextAlign.center,
            style: AppStyles.font16SatoshiBold(context),
          ),
        ],
      ),
    );
  }
}
