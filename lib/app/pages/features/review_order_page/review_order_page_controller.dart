import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewOrderPageController extends GetxController {
  var rating = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadRating();
  }

  void updateRating(int newRating) async {
    rating.value = newRating;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('rating', newRating);
  }

  void loadRating() async {
    final prefs = await SharedPreferences.getInstance();
    rating.value = prefs.getInt('rating') ?? 0;
  }
}
