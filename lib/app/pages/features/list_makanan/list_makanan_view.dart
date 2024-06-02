import 'package:ayamku_delivery/app/api/product/model/ListProductResponse.dart';
import 'package:ayamku_delivery/app/pages/features/list_makanan/items/item_list_makanan.dart';
import 'package:ayamku_delivery/app/pages/features/list_makanan/list_makanan_controller.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_textfield.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListMakananView extends StatelessWidget {
  const ListMakananView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ListMakananController());
    final String category = Get.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: baseColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        title: Row(
          children: [
            Text(
              "$category ",
              style: txtTitlePage.copyWith(
                color: blackColor,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: baseColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonTextField(
                controller: controller.searchController,
                hintText: "Temukan $category favorit kamu",
                prefixIcon: Icons.search,
              ),

              SizedBox(height: 10),

              Expanded(child: ContentPage(listCategoryProducts: controller.listProduct,)),
            ],
          ),
        ),
      ),
    );
  }
}



class ContentPage extends StatelessWidget {
  const ContentPage({
    Key? key,
    required this.listCategoryProducts
  });

  final List<Product> listCategoryProducts;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ListMakananController>();

    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }

      if (controller.listProduct.isEmpty) {
        return Center(child: Text("No products found"));
      }

      return ListView.builder(
        itemCount: listCategoryProducts.length,
        itemBuilder: (context, index) {
          final product = listCategoryProducts[index];
          return ItemListMakanan(
            name: product.name!,
            desc: product.description!,
            image: product.image!,
            rating: product.rating!,
            price: product.price!,
          );
        },
      );
    });
  }
}
