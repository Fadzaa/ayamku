import 'package:ayamku_delivery/common/constant.dart';
import 'package:flutter/material.dart';

import '../../../../router/app_pages.dart';
import 'profile.dart';

List<Profile> list_profile = [
  Profile(
      icon: icUser,
      name: "Edit Profile",
      isDarkMode: false,
      routes: Routes.EDIT_PROFILE_PAGE,
  ),
  Profile(
      icon: icFavorite,
      name: "Favorit Saya",
      isDarkMode: false
  ),
  Profile(
      icon: icLock,
      name: "Reset Kata Sandi",
      isDarkMode: false
  ),
  Profile(
      icon: icTheme,
      name: "Mode Gelap",
      isDarkMode: true
  ),
];