import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ui_challenge/app/data/local_data.dart';
import 'package:ui_challenge/app/presentation/home/widgets/place_item.dart';
import 'package:ui_challenge/core/utils/config.dart';
import 'package:ui_challenge/core/utils/context_utils.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    super.key,
  });

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool _animateBody = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(Config.duration1500);
      setState(() {
        _animateBody = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Config.duration300,
      opacity: _animateBody ? 1 : 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Config.radius24),
          color: context.colorScheme.background,
        ),
        padding: Config.fromLTRB(6, 8, 6, 0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: StaggeredGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: LocalData.places
                    .map(
                      (place) => StaggeredGridTile.count(
                        crossAxisCellCount: place.hRatio,
                        mainAxisCellCount: place.vRatio,
                        child: PlaceItem(
                          image: place.image,
                          name: place.name,
                          alignment: place.hRatio > place.vRatio
                              ? Alignment.center
                              : Alignment.centerLeft,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
