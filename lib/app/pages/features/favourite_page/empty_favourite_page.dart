import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import '../../global_component/common_button.dart';

class EmptyFavouritePageView extends StatelessWidget {
  const EmptyFavouritePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: baseColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: () {
            // Tambahkan aksi ketika tombol arrow left diklik
         },
      ),
        title: Row(
          children: [
            Text(
              "Favorit Saya ",
              style: txtTitlePage.copyWith(
                color: blackColor,
              ),
            ),
            Spacer(),
            Icon(
              Icons.shopping_cart, 
              color: blackColor,
              size: 20,
            ),
          ],
        )
      ),
      backgroundColor: baseColor,
      body: SafeArea(
        child: Center(
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 150),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
        ),
        
        ),
    );
  }
}