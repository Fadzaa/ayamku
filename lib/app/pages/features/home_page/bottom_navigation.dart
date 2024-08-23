import 'package:ayamku_delivery/app/pages/features/favourite_page/favourite_page_view.dart';
import 'package:ayamku_delivery/app/pages/features/home_page/home_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/order_page_view.dart';
import 'package:ayamku_delivery/app/pages/features/profile_page/profile_page_view.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_alert.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../common/theme.dart';
import 'home_page_view.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({super.key});

  static final GlobalKey<_BottomNavigationState> navKey = GlobalKey();

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  final HomePageController controller = Get.find();

  @override
  void initState() {
    super.initState();
    _selectedIndex = Get.arguments ?? 0;
  }

  void setSelectedIndex(int index) async {
    await controller.fetchToken();

    if ((index == 1 ) && controller.token.value.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CommonAlert(
            image: guest,
            title: 'Kamu dalam mode guest',
            content: "Silahkan login untuk melanjutkan",
            onCancel: () {
              Get.back();
            },
            onConfirm: () async {
              Get.back();
              Get.offAllNamed(Routes.LOGIN_PAGE);
            },
            confirmText: 'Login Sekarang',
            cancelText: 'Tetap lanjutkan guest mode',
          );
        },
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }


  final tabs = [
    const HomePageView(),
    const OrderPageView(),
     // FavouritePageView(),
    const ProfilePageView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: BottomNavigation.navKey,
      backgroundColor: baseColor,
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(icHome),
            activeIcon: SvgPicture.asset(icHomeActive),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(icOrder),
            activeIcon: SvgPicture.asset(icOrderActive),
            label: 'Order',
          ),
          // BottomNavigationBarItem(
          //   icon: SvgPicture.asset(icFavorite),
          //   activeIcon: SvgPicture.asset(icFavoriteActive),
          //   label: 'Favorite',
          // ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(icUser),
            activeIcon: SvgPicture.asset(icUserActive),
            label: 'Profile',
          ),
        ],
        backgroundColor: baseColor,
        currentIndex: _selectedIndex,
        unselectedLabelStyle: txtCaption.copyWith(
            color: const Color(0xFF707070).withOpacity(0.5)
        ),
        selectedLabelStyle: txtCaption.copyWith(
            color: primaryColor
        ),
        selectedItemColor: primaryColor,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setSelectedIndex(index);
        },
      ),
    );
  }
}