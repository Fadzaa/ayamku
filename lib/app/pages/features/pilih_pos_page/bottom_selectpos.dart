import 'package:ayamku_delivery/app/pages/features/pilih_pos_page/pilih_pos_page_controller.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSelectPos extends StatelessWidget {
  const BottomSelectPos({super.key});


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    return Container(
      width: screenWidth,
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: ButtonSelect(),
    );
  }
}

  class ButtonSelect extends GetView<PilihPosPageController> {
  const ButtonSelect({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: () {
        if (controller.selectedPos.value != null) {
          Get.back();
        } else {
          Get.snackbar("Error", "Please select a pos first");
        }
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ),
          elevation: 2,
          fixedSize: Size.fromHeight(44),
      ),

      child: Center(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "📌 Pilih Pos",
              style: txtButtonTab.copyWith(color: blackColor),
            ),
            if (controller.selectedPos.value != null)
              Text(
                " - ${controller.selectedPos.value!.name}",
                style: txtButtonTab.copyWith(color: blackColor),
              ),
          ],
        ),
      ),
    );
  }
}
