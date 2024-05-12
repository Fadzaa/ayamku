import 'package:ayamku_delivery/app/pages/features/list_makanan/items/item_geprek_vertical.dart';
import 'package:ayamku_delivery/app/pages/features/list_makanan/geprek_page_controller.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_textfield.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeprekPageView extends StatelessWidget {
  const GeprekPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(geprekPageController());
    List<String> myList = [
      "List data 1",
      "List data 2"
    ];


    return Scaffold(
      appBar: AppBar(
        backgroundColor: baseColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios), 
          onPressed: () {
            // Tambahkan aksi ketika tombol arrow left diklik
         },
      ),
        title: Row(
          children: [
            Text(
              "Geprek ",
              style: txtTitlePage.copyWith(
                color: blackColor,
              ),
            ),
          ],
        )
      ),
      
      backgroundColor: baseColor,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CommonTextField(
                  controller: controller.nameController,
                  hintText: "Temukan geprek favorit kamu",
                  prefixIcon: Icons.search,
                ),
                SizedBox(height: 10),  
                ContentPage(),
              ]
            ),
          )
      ) 
    );
  }
}

class ContentPage extends StatelessWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) => ItemGeprekVertical(),
    );
  }
}
