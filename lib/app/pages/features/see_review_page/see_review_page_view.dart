import 'package:ayamku_delivery/app/pages/features/see_review_page/items/items_see_review_page.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SeeReviewPageView extends StatelessWidget {
  const SeeReviewPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final argument = Get.arguments;
    print(argument['review']);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: baseColor,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.DETAIL_ORDER_PAGE);
                },
                child: SvgPicture.asset(
                  icBack,
                  width: 30,
                  height: 30,
                ),
              ),
              SizedBox(width: 10),
              Text(
                "Lihat penilaian",
                style: txtTitlePage.copyWith(
                  color: blackColor,
                ),
              )
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            children: [
              (argument != null &&
                      argument['review'] != null &&
                      argument['review'].length > 0)
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: argument['review'].length,
                      itemBuilder: (context, index) {
                        final review = argument['review'][index];
                        return Expanded(
                          child: ItemsSeeReviewPage(
                            image: exampleFood,
                            rating : int.parse(review.rating.toString()),
                            productName : review.productName,
                            comment : review.comment,
                          ),
                        );
                      },
                    )
                  : Text("Maaf, anda tidak memiliki List review"),
            ],
          )),
        ));
  }
}
