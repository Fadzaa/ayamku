import 'package:ayamku_delivery/app/pages/global_component/common_textfield.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '';

class notificationPage extends StatelessWidget {
  const notificationPage({super.key});

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
          padding: const EdgeInsets.symmetric(vertical: 200),
          child: Column(
            

          ),
          ),
        ),
        
        ),
    );
  }
}