import 'package:flutter/material.dart';
import 'theme.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.body
  });

  final bool isLoading;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return isLoading ? Stack(
        children: [
          body,

          Container(
            color: Colors.black.withOpacity(0.25),
            child: const Center(
              child: CircularProgressIndicator(color: primaryColor,),
            ),)

        ]
    ) : body;
  }
}
