import 'package:ayamku_delivery/app/pages/features/detail_page/items/item_catatan.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/items/item_select_level.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/items/item_title.dart';
import 'package:flutter/material.dart';

class DetailPageSection extends StatelessWidget {
  const DetailPageSection({
    super.key,
    this.incrementQuantity,
    this.decrementQuantity,
    required this.noteController,
    required this.image,
    required this.txtTitle,
    required this.txtDesc,
    required this.selectedLevel,
    required this.quantityCount,
    required this.levelList,
    required this.rating,
    required this.onChangedLevel,
  });

  final VoidCallback? incrementQuantity, decrementQuantity;
  final TextEditingController noteController;
  final String image, txtTitle, txtDesc, selectedLevel;
  final int quantityCount;
  final List<String> levelList;
  final double rating;
  final ValueChanged<String?> onChangedLevel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            image,
            width: 363,
          ),
        ),
        ItemTitle(
          title: txtTitle,
          rating: rating,
          description: txtDesc,
          quantity: quantityCount,
          incrementQuantity: incrementQuantity,
          decrementQuantity: decrementQuantity,
        ),
        ItemDropdown(
          levelList: levelList,
          selectedValue: selectedLevel,
          onChanged: onChangedLevel,
        ),
        ItemCatatan(
          noteController: noteController,
        ),
        SizedBox(height: 35),
      ],
    );
  }
}

