import 'package:ayamku_delivery/app/pages/features/payment_page/payment_page_controller.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ItemSelectPaymentVertical extends StatelessWidget {
  const ItemSelectPaymentVertical({
    Key? key,
    required this.image,
    required this.name, required this.value,
  }) : super(key: key);

  final String image, name, value;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PaymentPageController());

    return Column(
      children: [
        InkWell(
          onTap: () => controller.setOrderType(value),
          child: Container(
            margin: const EdgeInsets.only(bottom: 5, top: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Image.asset(
                  image,
                  width: 24,
                  height: 24,
                ),

                const SizedBox(width: 10),

                Text(
                  name,
                  style: txtFormTitle.copyWith(
                    color: blackColor,
                  ),
                ),
                const Spacer(),

                Obx(() => Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: controller.orderTypeString.value == value
                          ? primaryColor
                          : Colors.grey,
                    ),
                    color: Colors.transparent,
                  ),
                  child: controller.orderTypeString.value == value
                      ? Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: SvgPicture.asset(
                      icActiveRadioButton,
                      width: 13,
                      height: 13,
                    ),
                  )
                      : null,
                )),

              ],
            ),
          ),
        ),
        const Divider(color: blackColor80),
      ],
    );
  }
}
