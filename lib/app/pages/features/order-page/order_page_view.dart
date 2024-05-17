
import 'package:ayamku_delivery/app/pages/features/order-page/order_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/section/section_dalam_proses.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/section/section_riwayat.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OrderPageView extends StatelessWidget {
  const OrderPageView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: baseColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                "Order saya",
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

          bottom: TabBar(
            labelColor: primaryColor,
            unselectedLabelColor: blackColor90,
            indicatorColor: primaryColor,
            tabs: <Widget>[
              Tab(child: Text('Riwayat', style: txtButtonTab)),
              Tab(child: Text('Dalam Proses', style: txtButtonTab)),
            ],
          ),

        ),

        body: TabBarView(
          children: <Widget>[
            SectionRiwayat(txtDate: 'HariIni',),
            SectionDalamProses(),
          ],
        ),
      ),
    );
  }
}