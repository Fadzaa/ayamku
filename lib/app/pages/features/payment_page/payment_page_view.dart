
import 'package:ayamku_delivery/app/pages/features/payment_page/items/item_select_payment_vertical.dart';
import 'package:ayamku_delivery/app/pages/features/payment_page/model/payment_data.dart';
import 'package:ayamku_delivery/app/pages/features/payment_page/payment_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/succes_transaction_page/success_transaction_page.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_button_pay.dart';
import 'package:ayamku_delivery/app/pages/global_component/not_found_page/not_found_page.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PaymentPageView extends GetView<PaymentPageController>{
  const PaymentPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: baseColor,
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

                SizedBox(width: 10,),

                Text(
                  "Pembayaran",
                  style: txtTitlePage.copyWith(
                    color: blackColor,
                  ),
                )
              ],
            ),
          ),

          body: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Metode pembayaran",style: txtListItemTitle.copyWith(color: blackColor20),),

                    SizedBox(height: 10,),

                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: payment_data.length,
                        itemBuilder: (context, index) =>
                            Column(
                              children: [
                                ItemSelectPaymentVertical(
                                    image: payment_data[index].image,
                                    name: payment_data[index].name,
                                    value: payment_data[index].value,
                                ),
                              ],
                            )
                    ),


                  ],
                ),
              ),

              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: CommonButtonPay(
                  width: 184,
                  text: 'Bayar  Sekarang',
                  // price: Future.value('Rp.13.000'),
                  price: 'Rp.13.000',
                  onPressed: (){
                    Get.to(SuccessTransactionPage(),transition: Transition.noTransition,);
                  },
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}