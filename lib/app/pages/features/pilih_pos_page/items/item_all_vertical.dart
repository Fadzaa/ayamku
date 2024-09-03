import 'package:ayamku_delivery/app/pages/features/pilih_pos_page/pilih_pos_page_controller.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemAllVertical extends GetView<PilihPosPageController> {
  const ItemAllVertical({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Obx(() {
      if (controller.isLoadingAll.value) {
        return Center(child: CircularProgressIndicator());
      }

      if (controller.listPos.isEmpty) {
        return Center(child: Text("No pos found"));
      }

      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: controller.listPos.length,
        itemBuilder: (context, index) {
          final pos = controller.listPos[index];

          return Obx(() => GestureDetector(
            onTap: () => controller.selectPos(pos),
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: controller.selectedPos.value?.id == pos.id
                      ? Colors.yellow
                      : Colors.transparent,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 2,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          child: Image.network(
                            width: screenWidth,
                            height: 190,
                            pos.image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pos.name.toString(),
                          style: txtListItemTitle.copyWith(color: blackColor),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: screenWidth,
                          child: Text(
                            pos.description.toString(),
                            style: txtCaption.copyWith(color: blackColor),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ));
        },
      );
    });
  }
}
