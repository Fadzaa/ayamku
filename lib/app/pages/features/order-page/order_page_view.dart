import 'package:ayamku_delivery/app/pages/features/order-page/order_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/section/section_pesanan_kamu.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/section/section_riwayat.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OrderPageView extends StatelessWidget {
  const OrderPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderPageController());
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: baseColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(
              "Pesanan saya",
              style: txtTitlePage.copyWith(
                  color: blackColor
              ),
            ),

            InkWell(
              onTap: (){
                Get.toNamed(Routes.CART_PAGE);
              },
              child: SvgPicture.asset(
                icCart,
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TabBar(
                  indicatorColor: primaryColor,
                  labelColor: primaryColor,
                  unselectedLabelColor: const Color(0xFF707070).withOpacity(0.7),
                  labelStyle: txtButtonTab,
                  unselectedLabelStyle: txtButtonTab,
                  dividerColor: Colors.transparent,
                  tabAlignment: TabAlignment.start,
                  labelPadding: const EdgeInsets.only(right: 20),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  isScrollable: true,
                  controller: controller.tabController,
                  tabs:  [
                    Tab(text: "Pesanan kamu"),
                    Tab(text: "Riwayat")
                  ]
              ),
            ),

            Flexible(
              child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    SectionPesananKamu(),
                    SectionRiwayat()
                  ]
              ),
            )
          ],
        ),
      ),
    );
  }
}