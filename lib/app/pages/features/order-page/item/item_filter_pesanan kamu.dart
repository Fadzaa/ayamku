import 'package:ayamku_delivery/app/pages/features/order-page/order_page_controller.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_button.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ItemsFilterPesananKamu extends GetView<OrderPageController> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Obx(() => _buildStyledChip(
            context: context,
            label: controller.selectStatus.value,
            onTap: () => _showStatusBottomSheet(context, screenWidth),
            isSelected: controller.selectStatus.value != "Status",
          )),

          Obx(() => _buildStyledChip(
            context: context,
            label: controller.selectMethod.value,
            onTap: () => _showMethodBottomSheet(context, screenWidth),
            isSelected: controller.selectMethod.value != "Metode",
          )),

          // Obx(() => _buildStyledChip(
          //   context: context,
          //   label: controller.selectTime.value,
          //   onTap: () => _showTimeBottomSheet(context, screenWidth),
          //   isSelected: controller.selectTime.value != "Waktu",
          // )),
        ],
      ),
    );
  }

  Widget _buildStyledChip({
    required BuildContext context,
    required String label,
    required VoidCallback onTap,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: onTap,
      child: ChipTheme(
        data: ChipTheme.of(context).copyWith(
          side: isSelected ? BorderSide.none : BorderSide(color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Chip(
            label: Row(
              children: [
                Text(
                  label,
                  style: txtCaption.copyWith(color: blackColor),
                ),

                // SizedBox(width: 5,),
                //
                // SvgPicture.asset(icArrowUp),
              ],
            ),
            backgroundColor: isSelected ? primaryColor : baseColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),

          ),
        ),
      ),
    );
  }

  void _showStatusBottomSheet(BuildContext context, double screenWidth) {
    Get.bottomSheet(
      filterBottomSheet(
        context: context,
        title: "Status Pemesanan",
        options: ["Dalam Proses", "Menunggu Pembayaran","Telah Diterima", "Pesanan Selesai","Telah dikonfirmasi", "Dibatalkan"],
        onSelected: (value) => controller.setStatus(value),
        screenWidth: screenWidth,
        onCancel: () => controller.resetStatus(),
      ),
    );
  }

  void _showMethodBottomSheet(BuildContext context, double screenWidth) {
    Get.bottomSheet(
      filterBottomSheet(
        context: context,
        title: "Metode Pemesanan",
        options: ["On Delivery", "Pickup"],
        onSelected: (value) => controller.setMethod(value),
        screenWidth: screenWidth,
        onCancel: () => controller.resetMethod(),
      ),
    );
  }

  void _showTimeBottomSheet(BuildContext context, double screenWidth) {
    Get.bottomSheet(
      filterBottomSheet(
        context: context,
        title: "Waktu Pemesanan",
        options: ["09:40", "12:00"],
        onSelected: (value) => controller.setTime(value),
        screenWidth: screenWidth,
        onCancel: () => controller.resetTime(),
      ),
    );
  }

  Widget filterBottomSheet({
    required BuildContext context,
    required String title,
    required List<String> options,
    required Function(String) onSelected,
    required double screenWidth,
    VoidCallback? onCancel,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      width: screenWidth,
      decoration: BoxDecoration(
        border: Border.all(color: blackColor50),
        borderRadius: BorderRadius.circular(15),
        color: baseColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: txtHeadline3.copyWith(color: blackColor)),
              InkWell(
                onTap: () {
                  if (onCancel != null) {
                    onCancel();
                  }
                  Get.back();
                },
                child: Text(
                  "Batalkan",
                  style: txtCaption.copyWith(color: primaryColor),
                ),
              ),
            ],
          ),

          SizedBox(height: 15.0),

          ...options.map((option) => itemRadioButton(
            context: context,
            option: option,
            isSelected: option == controller.selectStatus.value ||
                option == controller.selectMethod.value ||
                option == controller.selectTime.value,
            onTap: () {
              onSelected(option);
              Get.back();
            },
          )),
          SizedBox(height: 20),

          CommonButton(
            height: 30,
            text: "Terapkan",
            onPressed: () async {
              // await controller.applyAllFilters();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget itemRadioButton({
    required BuildContext context,
    required String option,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(bottom: 5, top: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  option,
                  style: txtFormTitle.copyWith(
                    color: blackColor,
                  ),
                ),
                const Spacer(),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? primaryColor : Colors.grey,
                    ),
                    color: Colors.transparent,
                  ),
                  child: isSelected
                      ? Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: SvgPicture.asset(
                      icActiveRadioButton,
                      width: 13,
                      height: 13,
                    ),
                  )
                      : null,
                ),
              ],
            ),
          ),
        ),
        const Divider(color: blackColor80),
      ],
    );
  }

}
