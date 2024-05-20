import 'package:flutter/material.dart';
import 'package:ui_challenge/app/presentation/home/widgets/home_body.dart';
import 'package:ui_challenge/app/presentation/home/widgets/home_header.dart';
import 'package:ui_challenge/core/utils/context_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.2, 1.0],
          colors: [
            context.theme.scaffoldBackgroundColor,
            context.colorScheme.surfaceVariant,
          ],
        ),
      ),
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              scrolledUnderElevation: 0,
              expandedHeight: context.screenSize.height * 0.5,
              flexibleSpace: const FlexibleSpaceBar(
                background: HomeHeader(),
              ),
              pinned: true,
            ),
          ];
        },
        body: const HomeBody(),
      ),
    );
  }
}
