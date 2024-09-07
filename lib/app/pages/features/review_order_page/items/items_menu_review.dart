import 'package:ayamku_delivery/app/pages/features/review_order_page/review_order_page_controller.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ItemsMenuReview extends GetView<ReviewOrderPageController> {
  const ItemsMenuReview({
    super.key,
    required this.image,
    required this.title,
    required this.id,
  });

  final String image, title;
  final int id;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: 60,
                height: 60,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: txtListItemTitle,
                    ),
                    // Text(
                    //   id.toString(),
                    //   style: txtCaption,
                    // ),
                  ],
                ),
              ),
              Obx(() {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () => controller.updateRating(id, index + 1),
                      child: Padding(
                        padding: EdgeInsets.only(left: index > 0 ? 5 : 0),
                        child: SvgPicture.asset(
                          index < (controller.ratings[id] ?? 0) ? starFil : starOutline,
                          width: 20,
                          height: 20,
                        ),
                      ),
                    );
                  }),
                );
              }),
            ],
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: controller.getCommentController(id),
            maxLines: 3,
            decoration: InputDecoration(
              hintText: "Masukkan komentar",
              hintStyle: txtBody.copyWith(color: blackColor50),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: blackColor),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

