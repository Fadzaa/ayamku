import 'package:ayamku_delivery/app/pages/features/input_voucher/input_voucher_controller.dart';
import 'package:ayamku_delivery/app/pages/features/input_voucher/items/item_voucher_vertical.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class InputVoucherPageView extends GetView<InputVoucherController>{
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


            title: Row(
              children: [
                InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: SvgPicture.asset(
                    icBack,
                    width: 30,
                    height: 30,
                  ),
                ),
                Text(
                  "Voucher ",
                  style: txtTitlePage.copyWith(
                    color: blackColor,
                  ),
                ),
                Spacer(),
                // InkWell(
                //   onTap: (){
                //     Get.toNamed(Routes.ADD_INPUT_VOUCHER_PAGE);
                //   },
                //   child: Icon(Icons.add),
                // )
                InkWell(
                  onTap: (){
                    controller.cancelVoucher();
                  },
                  child: Text("Batal", style: txtListItemTitle.copyWith(color: primaryColor)),
                )
              ],
            )
          ),
          
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () async {
                await controller.getCurrentVoucher();
              },
              child: RefreshIndicator(
                onRefresh: () async {
                  await controller.getCurrentVoucher();
                },
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
          ),
        ),
      ],
    );
  }
}

class ContentPage extends GetView<InputVoucherController> {
  const ContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: controller.voucherList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final listVoucher = controller.voucherList[index];
          return ItemVoucherVertical(
            name: listVoucher.code.toString(),
            duration: controller.getVoucherDuration(listVoucher.startDate, listVoucher.endDate),
            onPressed: () {
              controller.redeemVoucher(listVoucher.code.toString());
            },
          );
        }
    );
  }
}

