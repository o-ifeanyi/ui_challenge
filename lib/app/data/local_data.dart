import 'package:ui_challenge/app/data/models/place_model.dart';

const basePath = 'assets/images';

class LocalData {
  static List<PlaceModel> places = [
    PlaceModel(
      image: '$basePath/place_1.jpeg',
      name: 'Gladkova St., 25',
      hRatio: 2,
      vRatio: 1,
    ),
    PlaceModel(
      image: '$basePath/place_2.jpeg',
      name: 'Gubina St., 11',
      hRatio: 1,
      vRatio: 2,
    ),
    PlaceModel(
      image: '$basePath/place_3.jpeg',
      name: 'Trefoleva St., 43',
      hRatio: 1,
      vRatio: 1,
    ),
    PlaceModel(
      image: '$basePath/place_4.jpeg',
      name: 'Sedova St., 22',
      hRatio: 1,
      vRatio: 1,
    ),
  ];
}
