import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../global_component/common_button.dart';
import 'package:ayamku_delivery/app/pages/features/notification_page/items/item_notification_vertical.dart';

class NotificationPageView extends StatelessWidget {
  const NotificationPageView({super.key});

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
            InkWell(
              onTap: () {
                Get.back();
              },
              child: SvgPicture.asset(
                icBack,
                width: 30,
                height: 30,
              ),
            ),
            SizedBox(width: 10),
            Text("Notification", style: txtTitlePage),
          ],
        ),
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
      itemBuilder: (context, index) => ItemNotificationVertical(),
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
              image: AssetImage(imgEmptyNotif),
              width: 250,
              height: 250,
              ),
            SizedBox(height: 20,),
            Text(
              "Kamu belum memiliki notifikasi apapun",
              style: txtTitlePage.copyWith(
                color: blackColor,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),  
          ],
        ),
        ),
        
        );
  }
}