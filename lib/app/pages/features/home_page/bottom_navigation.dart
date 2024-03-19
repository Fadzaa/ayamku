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
    Container(child: Center(child: Text("Profiel"),),),

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
            icon: SvgPicture.asset(icExplore),
            activeIcon: SvgPicture.asset(icExploreActive),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(icOrder),
            activeIcon: SvgPicture.asset(icOrderActive),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(icChat),
            activeIcon: SvgPicture.asset(icChatActive),
            label: 'Chat',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedLabelStyle: tsLabelLarge.copyWith(
            fontWeight: FontWeight.w500,
            color: const Color(0xFF707070).withOpacity(0.5)
        ),
        selectedLabelStyle: tsLabelLarge.copyWith(
          fontWeight: FontWeight.w500,
          color: primaryColor
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
