import 'package:ayamku_delivery/app/pages/features/favourite_page/items/item_favourite_vertical.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../global_component/common_button.dart';

class FavouritePageView extends StatelessWidget {
  const FavouritePageView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> myList = [
      "List data 1",
      "List data 2"
    ];


    return Scaffold(
      appBar: AppBar(
        backgroundColor: baseColor,
        automaticallyImplyLeading: false,
        
        title: Row(
          children: [
            Text(
              "Favorit Saya ",
              style: txtTitlePage.copyWith(
                color: blackColor,
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {
              },
              child: SvgPicture.asset(
                icKeranjang,
                width: 20,
                height: 20,
              ),
            ),
          ],
        )
      ),
      
      backgroundColor: baseColor,
      
      body: myList.length == 0 ? FavouriteEmptyPage() :  ContentPage() 
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
      itemBuilder: (context, index) => ItemFavouriteVertical(),
    );
  }
}


class FavouriteEmptyPage extends StatelessWidget {
  const FavouriteEmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 67),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(imgEmptyFav),
              width: 250,
              height: 250,
              ),
            SizedBox(height: 20,),
            Text(
              "Kamu belum memiliki produk favorit",
              style: txtTitlePage.copyWith(
                color: blackColor,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20,),
            CommonButton(
              text: 'Belanja Sekarang',   
              onPressed: () {  },
            //height: 56,
            ),
          ],
        ),
        ),
        
        );
  }
}