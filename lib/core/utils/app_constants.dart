import 'package:flutter/material.dart';
import 'package:ui_challenge/core/utils/app_icons.dart';

typedef MenuItem = ({int index, IconData icon, String label});

class AppConstants {
  static List<MenuItem> navItems = [
    (index: 0, icon: AppIcons.searchFill, label: ''),
    (index: 1, icon: AppIcons.message, label: ''),
    (index: 2, icon: AppIcons.home, label: ''),
    (index: 3, icon: AppIcons.heart, label: ''),
    (index: 4, icon: AppIcons.profile, label: ''),
  ];
  static List<MenuItem> mapMenuItems = [
    (index: 0, icon: AppIcons.security, label: 'Cosy areas'),
    (index: 1, icon: AppIcons.wallet, label: 'Price'),
    (index: 2, icon: AppIcons.bag, label: 'Infrastructure'),
    (index: 3, icon: AppIcons.layer, label: 'Without any layer'),
  ];
}
