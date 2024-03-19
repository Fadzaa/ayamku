import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../common/theme.dart';
import 'home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

            ],
          ),
        ),
      )
    );
  }
}










