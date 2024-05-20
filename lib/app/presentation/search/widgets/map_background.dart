import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ui_challenge/app/presentation/profile/profile_screen.dart';
import 'package:ui_challenge/core/theme/app_theme.dart';
import 'package:ui_challenge/core/utils/config.dart';
import 'package:ui_challenge/core/utils/context_utils.dart';
import 'package:ui_challenge/core/utils/extensions.dart';

class MapBackground extends StatefulWidget {
  const MapBackground({super.key});

  @override
  State<MapBackground> createState() => MapBackgroundState();
}

class MapBackgroundState extends State<MapBackground> {
  final _controller = Completer<GoogleMapController>();
  static const _abuja = CameraPosition(
    target: LatLng(9.072264, 7.491302),
    zoom: 16,
  );
  final _markerList = <Marker>[];

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  Future<BitmapDescriptor> _getCustomIcon(String label) async {
    return Container(
      padding: Config.all(10),
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: BorderRadius.only(
          topRight: Config.radius8,
          topLeft: Config.radius8,
          bottomRight: Config.radius8,
        ),
      ),
      child: Text(label, style: context.textTheme.bodySmall),
    ).toBitmapDescriptor();
  }

  Future<void> _markerSetUp() async {
    await Future.delayed(Config.duration600);
    _markerList.addAll([
      Marker(
        markerId: const MarkerId('pos_1'),
        position: const LatLng(9.07660067424618, 7.489331737160682),
        icon: await _getCustomIcon('10.3 mn P'),
      ),
      Marker(
        markerId: const MarkerId('pos_2'),
        position: const LatLng(9.075541223385581, 7.489946633577348),
        icon: await _getCustomIcon('11 mn P'),
      ),
      Marker(
        markerId: const MarkerId('pos_3'),
        position: const LatLng(9.07402951402084, 7.493143826723098),
        icon: await _getCustomIcon('7.8 mn P'),
      ),
      Marker(
        markerId: const MarkerId('pos_4'),
        position: const LatLng(9.070272064269941, 7.49326553195715),
        icon: await _getCustomIcon('8.5 mn P'),
      ),
      Marker(
        markerId: const MarkerId('pos_5'),
        position: const LatLng(9.068230927177968, 7.491813451051713),
        icon: await _getCustomIcon('6.95 mn P'),
      ),
      Marker(
        markerId: const MarkerId('pos_6'),
        position: const LatLng(9.071225584189008, 7.489267364144325),
        icon: await _getCustomIcon('13.3 mn P'),
      ),
    ]);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _markerSetUp();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: themeNotifier,
        builder: (context, theme, child) {
          return GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _abuja,
            style: AppTheme.mapTheme(theme),
            markers: _markerList.toSet(),
            onMapCreated: (GoogleMapController controller) async {
              _controller.complete(controller);
            },
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
          );
        },
      ),
    );
  }
}
