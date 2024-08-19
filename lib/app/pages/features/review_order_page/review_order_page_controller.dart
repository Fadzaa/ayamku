import 'package:ayamku_delivery/app/api/review/model/reviewResponse.dart';
import 'package:ayamku_delivery/app/api/review/review_service.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewOrderPageController extends GetxController {
  RxMap<int, int> ratings = RxMap<int, int>(); // Maps item IDs to their ratings
  RxMap<int, TextEditingController> commentControllers = RxMap<int, TextEditingController>(); // Maps item IDs to their comment controllers
  RxBool isLoading = false.obs;

  ReviewService reviewService = ReviewService();
  ReviewResponse reviewResponse = ReviewResponse();

  @override
  void onInit() {
    super.onInit();
  }

  void updateRating(int id, int newRating) {
    ratings[id] = newRating;
  }

  TextEditingController getCommentController(int id) {
    if (!commentControllers.containsKey(id)) {
      commentControllers[id] = TextEditingController();
    }
    return commentControllers[id]!;
  }

  Future storeReviews(List<dynamic> cartItems, orderId) async {
    try {
      isLoading(true);

      for (var i = 0; i < cartItems.length; i++) {
        var cartItem = cartItems[i];
        int? rating = ratings[cartItem.id];
        String comment = commentControllers[cartItem.id]?.text ?? '';

        dio.FormData formData = dio.FormData.fromMap({
          'product_id': cartItem.productId,
          'order_id': orderId,
          'rating': rating ?? 0,
          'comment': comment,
        });

        print("FormData: ${formData.fields}");

        final response = await reviewService.postReview(formData);
        print("Server response:");
        print(response.data);
      }

      Get.snackbar("Success", "All reviews have been successfully submitted");
      Get.offAllNamed(Routes.ORDER_PAGE);
    } catch (e) {
      Get.snackbar("Error", e.toString());
      print(e);
    } finally {
      isLoading(false);
    }
  }
}

