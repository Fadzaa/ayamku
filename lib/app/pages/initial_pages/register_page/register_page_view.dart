import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/theme.dart';
import 'register_page_controller.dart';

class RegisterPageView extends GetView<RegisterPageController> {
  const RegisterPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [


              ]
            ),
          )
      )
    );
  }
}




