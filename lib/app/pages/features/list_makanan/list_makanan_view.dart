import 'package:ayamku_delivery/app/api/product/model/ListProductResponse.dart';
import 'package:ayamku_delivery/app/pages/features/list_makanan/items/item_list_makanan.dart';
import 'package:ayamku_delivery/app/pages/features/list_makanan/list_makanan_controller.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_search.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_textfield.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../router/app_pages.dart';

class ListMakananView extends GetView<ListMakananController> {
  const ListMakananView({super.key});

  @override
  Widget build(BuildContext context) {
    final String category = (Get.arguments as String?) ?? '';

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
              SizedBox(height: 15),

              CommonSearch(
                onTap: (){
                  controller.searchController;
                },
                text: "Temukan $category favorit kamu",
              ),
              SizedBox(height: 10),
              Expanded(
                  child: ContentPage(
                listCategory: controller.listProduct,
              )),
            ],
          ),
        ),
      ),
    );
  }
}




class ContentPage extends GetView<ListMakananController> {
  const ContentPage({
    Key? key,
    required this.listCategory
  });

  final List<Product> listCategory;


  @override
  Widget build(BuildContext context) {

    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }

      if (listCategory.isEmpty) {
        return Center(child: Text("No products found"));
      }

      return ListView.builder(
        itemCount: listCategory.length,
        itemBuilder: (context, index) {
          final product = listCategory[index];
          return InkWell(
            onTap: (){
              Get.toNamed(Routes.DETAIL_PAGE, arguments: product.id!.toString());
            
            },
            child: ItemListMakanan(
              name: product.name!,
              desc: product.description!,
              image: product.image!,
              rating: product.rating!,
              price: controller.formatPrice(double.parse(product.price!)),
            ),
          );
        },
      );
    });
  }
}
