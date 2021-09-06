class Geo {
  final double lat;
  final double lng;

  Geo({
    required this.lat,
    required this.lng,

  });

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: double.parse(json['lat']),
      lng: double.parse(json['lng'])
    );
  }
}