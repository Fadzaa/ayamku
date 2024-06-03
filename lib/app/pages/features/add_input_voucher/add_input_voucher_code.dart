import 'package:ayamku_delivery/app/pages/features/add_input_voucher/add_input_voucher_vode_controller.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_button.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../global_component/common_textfield.dart';

class InputAddVoucherPageView extends GetView<inputAddVoucherController>{
  const InputAddVoucherPageView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: baseColor,
            automaticallyImplyLeading: false,
            elevation: 0,

            title: Row(
              children: [
                InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: SvgPicture.asset(
                    icBack
                  ),
                ),
                Text(
                  "Tambahkan Kode Voucher",
                  style: txtTitlePage.copyWith(
                    color: blackColor,
                  ),
                ),
              ],
            )
          ),
          
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    CommonTextField(
                      controller: controller.nameController,
                      hintText: "ugyftfxdfghjytrssrtyuugfzs",
                      heading: "Masukkan kode voucher",
                    ),

                    SizedBox(height: 73),

                    CommonButton(
                      text: 'Periksa Voucher',
                      height: 50,
                      onPressed: (){},
                      )

                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

