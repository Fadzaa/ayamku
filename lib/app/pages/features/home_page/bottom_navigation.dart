import 'package:ayamku_delivery/app/pages/features/profile_page/profile_page_view.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/theme.dart';
import 'home_page_view.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  final tabs = [
    const HomePageView(),
    Container(child: Center(child: Text("Order"),),),
    Container(child: Center(child: Text("Favourite"),),),
    const ProfilePageView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
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
          BottomNavigationBarItem(
            icon: SvgPicture.asset(icFavorite),
            activeIcon: SvgPicture.asset(icFavoriteActive),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(icUser),
            activeIcon: SvgPicture.asset(icUserActive),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedLabelStyle: txtCaption.copyWith(
            fontWeight: FontWeight.w500,
            color: blackColor
        ),
        selectedLabelStyle: txtCaption.copyWith(
          fontWeight: FontWeight.w500,
          color: blackColor
        ),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
