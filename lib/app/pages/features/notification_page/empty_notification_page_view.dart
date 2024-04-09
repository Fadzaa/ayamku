import 'package:ayamku_delivery/app/pages/global_component/common_textfield.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'empty_notification_page_view.dart';

class EmptyNotificationPageView extends StatelessWidget {
  const EmptyNotificationPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: baseColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: () {
            // Tambahkan aksi ketika tombol arrow left diklik
         },
      ),
        title: Row(
          children: [
            Text(
              "Notifikasi ",
              style: txtTitlePage.copyWith(
                color: blackColor,
              ),
            ),
            Spacer(),
            Text(
              "mark all as read",
              style: txtTitlePage.copyWith(
                fontSize: 14,
                color: primaryColor,
              )
            ),
          ],
        )
      ),
      backgroundColor: baseColor,
      body: SafeArea(
        child: Center(
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image(
                image: AssetImage(imgEmptyNotif),
                width: 200,
                height: 200,
                ),
              SizedBox(height: 10,),
              Text(
                "Kamu belum memiliki notifikasi apapun",
                style: txtTitlePage.copyWith(
                  color: blackColor,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          ),
        ),
        
        ),
    );
  }
}