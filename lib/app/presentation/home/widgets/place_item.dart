import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_challenge/app/presentation/home/widgets/slide_button.dart';
import 'package:ui_challenge/core/utils/config.dart';

class PlaceItem extends StatelessWidget {
  const PlaceItem({
    super.key,
    required this.image,
    required this.name,
    this.alignment = Alignment.centerLeft,
  });

  final String image;
  final String name;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Config.radius24),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: Config.all(10),
          alignment: Alignment.bottomLeft,
          child: SliderButton(
            label: name,
            onPressed: () {},
            alignment: alignment,
          ),
        ),
      ],
    );
  }
}
