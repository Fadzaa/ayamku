import 'package:ayamku_delivery/app/pages/features/cart_page/cart_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/items/item_quantity.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/items/item_select_level.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemCheckoutMenu extends StatelessWidget {
  const ItemCheckoutMenu({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  final String image, name;
  final int price;

  @override
  Widget build(BuildContext context) {
    final List<String> level_select = ["Pedas", "Sedang", "Tidak pedas"];
    final controller = Get.put(CartPageController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Row(
          children: [

            Image.asset(
              image,
              width: 70,
            ),

            SizedBox(width: 10,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  name,
                  style: txtListItemTitle,
                ),

                SizedBox(height: 4,),

                Text(
                  controller.formatPrice(price.toDouble()), // Convert price to double
                  style: txtSecondaryTitle.copyWith(color: blackColor40),
                ),

                SizedBox(height: 10,),

                Container(
                    height: 30,
                    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                    width: 120,
                    decoration: BoxDecoration(
                        border: Border.all(color: blackColor50),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Obx(() => DropdownButton(
                      dropdownColor: Colors.white,
                      style: txtCaption.copyWith(color: blackColor),
                      elevation: 1,
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      borderRadius: BorderRadius.circular(8),
                      underline: Container(),
                      items: level_select.map((String level) => DropdownMenuItem(child: Text(level), value: level,)).toList(),
                      hint: const Text("Pilih Level"),
                      onChanged: (value) =>  controller.onChangeDropdown(value ?? "Pedas", level_select),
                      value: controller.dropdownValue.value,
                    ),)
                )

              ],
            ),



          ],
        ),


      ],
    );
  }
}
