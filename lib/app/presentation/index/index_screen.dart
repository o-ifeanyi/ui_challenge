import 'package:flutter/material.dart';
import 'package:ui_challenge/app/presentation/home/home_screen.dart';
import 'package:ui_challenge/app/presentation/index/widgets/custom_nav_bar.dart';
import 'package:ui_challenge/app/presentation/profile/profile_screen.dart';
import 'package:ui_challenge/app/presentation/search/search_screen.dart';
import 'package:ui_challenge/core/utils/app_icons.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  late PageController _controller;
  int _pageIndex = 2;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            children: [
              const SearchScreen(),
              Center(child: Icon(AppIcons.message, size: 40)),
              const HomeScreen(),
              Center(child: Icon(AppIcons.heart, size: 40)),
              const ProfileScreen(),
            ],
          ),
          CustomNavBar(
            activeIndex: _pageIndex,
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}
