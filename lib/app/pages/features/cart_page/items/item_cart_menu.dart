import 'package:ayamku_delivery/app/pages/features/cart_page/cart_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/items/item_quantity.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/items/item_select_level.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ItemCartMenu extends StatelessWidget {
  const ItemCartMenu({
    super.key,
    // required this.image,
    required this.name,
    required this.quantity,
    required this.add,
    required this.min,
    required this.price,
    // required this.levelList,
    // required this.selectedValue,
    // required this.onChanged,
  });

  // final String image;
  final String name;
  final RxInt quantity;
  final VoidCallback add;
  final VoidCallback min;
  final String price;
  // final List<String> levelList;
  // final RxString selectedValue;
  // final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Image.asset(
              //   image,
              //   width: 70,
              // ),
              // SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: txtListItemTitle,
                  ),
                  SizedBox(height: 4,),
                  Text(
                    price,
                    style: txtSecondaryTitle.copyWith(color: blackColor40),
                  ),
                  SizedBox(height: 10,),
                  // Container(
                  //   height: 42,
                  //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: blackColor50),
                  //     borderRadius: BorderRadius.circular(15),
                  //   ),
                  //   child: Obx(() {
                  //     return DropdownButton<String>(
                  //       dropdownColor: Colors.white,
                  //       style: txtCaption.copyWith(color: blackColor),
                  //       elevation: 1,
                  //       isExpanded: true,
                  //       icon: const Icon(Icons.keyboard_arrow_down),
                  //       borderRadius: BorderRadius.circular(8),
                  //       underline: Container(),
                  //       items: levelList.map((String selectedLevel) {
                  //         return DropdownMenuItem<String>(
                  //           value: selectedLevel,
                  //           child: Text(
                  //             selectedLevel,
                  //             style: txtSecondaryTitle.copyWith(color: blackColor50),
                  //           ),
                  //         );
                  //       }).toList(),
                  //       hint: const Text("Pilih Level"),
                  //       onChanged: (value) {
                  //         selectedValue.value = value!;
                  //         onChanged(value);
                  //       },
                  //       value: selectedValue.value,
                  //     );
                  //   }),
                  // ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              ItemQuantity(
                  icon: icAdd,
                  onPressed: add
              ),
              SizedBox(width: 10,),
              Obx(() => Text(
                quantity.toString(),
                style: txtSecondaryTitle.copyWith(color: blackColor),
              )),
              SizedBox(width: 10,),
              ItemQuantity(
                  icon: icMin,
                  onPressed: min
              ),
            ],
          )
        ],
      ),
    );
  }
}
