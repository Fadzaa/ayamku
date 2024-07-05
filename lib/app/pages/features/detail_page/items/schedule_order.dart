import 'package:ayamku_delivery/app/pages/features/checkout_page/items/item_select_metode.dart';
import 'package:ayamku_delivery/app/pages/features/checkout_page/items/item_slot_delivery.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/detail_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/items/picker_schedule.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_button.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

void ScheduleOrder(BuildContext context) {
  final controller = Get.put(DetailPageController());
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => Container(
        height: 230,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            decoration: BoxDecoration(
              color: baseColor,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(
                        Icons.close,
                        color: blackColor60,
                        size: 25,
                      ),
                    ),

                    SizedBox(width: 10),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pesan untuk", style: txtCaption.copyWith(color: blackColor50)),

                        SizedBox(height: 3),

                        Text("Jadwalkan pesanan", style: txtListItemTitle),

                      ],
                    )
                  ],
                ),

                SizedBox(height: 5,),

                Divider(color: blackColor60, height: 0.5,),

                SizedBox(height: 15,),

                // ContainerMetode(
                //   width: 130,
                //   icon: icPickup,
                //   text: "Pick Up",
                //   borderColor: controller.isOnDeliverySelected.value ? blackColor50 : primaryColor,
                //   onPressed: controller.selectPickUp,
                // ),
                //
                // SizedBox(height: 15,),

                // SelectSlot(
                //   icon: icDate,
                //   text: "Schedule",
                //   onPressed: () {
                //   },
                // ),

                SchedulePicker(),


                SizedBox(height: 15,),

                CommonButton(
                    height: 45,
                    text: "Konfirmasi",
                    onPressed: (){}
                ),

                SizedBox(height: 5,),
              ],
            ),
          )
      ),
  );
}