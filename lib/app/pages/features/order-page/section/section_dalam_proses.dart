import 'package:ayamku_delivery/app/pages/features/order-page/item/item_list_dalam_proses.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/item/item_timeline.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/model/timeline_date.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_button.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SectionDalamProses extends StatelessWidget {
  const SectionDalamProses({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
          width: screenWidth,
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 3),
              ),
            ],
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            child: Column(
              children: [

                ItemListDalamProses(
                  image: exampleFood,
                  name: 'PAHE GEPREK',
                  date: '20 Jan 2024, 1:54 pm',
                ),

                SizedBox(height: 15,),

                SizedBox(
                  height: 145,
                  child: ListView.builder(
                    itemCount: timeline_data.length,
                    itemBuilder: (context, index) {
                      return ItemTimeline(
                          title: timeline_data[index].title,
                          time: timeline_data[index].time,
                          description: timeline_data[index].description);
                    },
                  ),
                ),

                SizedBox(height: 15,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    CommonButton(
                        height: 30,
                        width: 159.5,
                        text: "Batalkan pesanan",style: txtCaption.copyWith(color: blackColor),
                        onPressed: (){}
                    ),

                    SizedBox(width: 15,),

                    CommonButton(
                        height: 30,
                        width: 142.5,
                        text: "Hubungi admin",style: txtCaption.copyWith(color: blackColor),
                        onPressed: (){}
                    ),

                  ],
                ),

              ],

            ),
          ),
        ),

        SizedBox(height: 40,),

        Center(
          child: Text(
            "You’ve seen all your orders.",
            style: txtCaption.copyWith(color: blackColor50),
          ),
        )
      ],
    );
  }
}
