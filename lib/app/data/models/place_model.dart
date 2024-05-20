class PlaceModel {
  final String image;
  final String name;
  final int hRatio;
  final int vRatio;

  PlaceModel({
    required this.image,
    required this.name,
    this.hRatio = 1,
    this.vRatio = 1,
  });
}
