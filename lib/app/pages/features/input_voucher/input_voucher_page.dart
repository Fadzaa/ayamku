import 'package:ayamku_delivery/app/pages/features/input_voucher/input_voucher_controller.dart';
import 'package:ayamku_delivery/app/pages/features/input_voucher/items/item_voucher_vertical.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputVoucherPageView extends GetView<inputVoucherController>{
  const InputVoucherPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: baseColor,
            automaticallyImplyLeading: false,
            elevation: 0,

            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios), 
              onPressed: () {
                // Tambahkan aksi ketika tombol arrow left diklik
            },
          ),

            title: Row(
              children: [
                Text(
                  "Voucher ",
                  style: txtTitlePage.copyWith(
                    color: blackColor,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {  }, 
                ),
              ],
            )
          ),
          
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),

                  ContentPage(),
                 
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ContentPage extends StatelessWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, index) => ItemVoucherVertical(),
    );
  }
}

