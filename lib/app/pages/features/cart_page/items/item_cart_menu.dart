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
    required this.image,
    required this.name,
    required this.quantity,
    required this.add,
    required this.min,
    required this.price,
    // required this.levelList,
    // required this.selectedValue,
    // required this.onChanged,
  });

  final String image,name,price;
  final int quantity;
  final VoidCallback add,min;
  // final List<String> levelList;
  // final RxString selectedValue;
  // final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: screenWidth * 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.network(
                image,
                width: 70,
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   padding: EdgeInsets.only(right: 5),
                  //   width: screenWidth * 0.5,
                  //   child: Text(
                  //     name,
                  //     style: txtListItemTitle,
                  //     maxLines: 2, // Limits the text to 2 lines
                  //   ),
                  // ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.38,
                    child: Text(
                      name,
                      style: txtListItemTitle,
                      maxLines: 2, // Limits the text to 2 lines
                    ),
                  ),


                  SizedBox(height: 10,),
                  Text(
                    price,
                    style: txtSecondaryTitle.copyWith(color: blackColor40),
                  ),
                  // SizedBox(height: 10,),
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
          Quantity(
            quantity: quantity,
            incrementQuantity: add,
            decrementQuantity: min,
            txtColor: blackColor,
            color: primaryColor,
          ),
        ],
      ),
    );
  }
}
