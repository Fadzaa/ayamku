import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/constant.dart';
import '../../../../common/theme.dart';
import '../../global_component/common_button.dart';
import 'model/onboard_data.dart';
import 'onboarding_page_controller.dart';
import 'widget/dot_indicator.dart';
import 'widget/onboard_content.dart';

class OnboardingPageView extends GetView<OnboardingPageController> {
  const OnboardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          logoPrimary,
                          width: 45,
                        ),

                        TextButton(
                            onPressed: () => controller.skipOnboarding(),
                            child: Text("Skip", style: txtSecondaryTitle.copyWith(color: blackColor),)
                        )
                      ],
                    ),

                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 50),
                        child: PageView.builder(
                          controller: controller.pageController,
                          itemCount: onboard_data.length,
                          onPageChanged: (index) {
                            controller.onPageChanged(index);
                          },
                          itemBuilder: (context, index) => OnboardContent(
                            image: onboard_data[index].image,
                            text: onboard_data[index].text,
                            description: onboard_data[index].text,
                          ),
                        ),
                      )
                    ),

                    Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        ...List.generate(onboard_data.length, (index) =>
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: DotIndicator(
                                isActive: index == controller.pageIndex.value,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.07,),

                    ElevatedButton(
                        onPressed: () => controller.onPressedButton(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)
                          ),
                        ),

                        child: Obx(() => controller.pageIndex.value == 2
                            ? CommonButton(
                            text: "Get Started",
                            onPressed: (){}
                        )
                            : SizedBox(
                          height: 65,
                        ))


                    ),

                    const SizedBox(height: 20,)
                  ],
                )
            )
        )
    );
  }
}
