import 'package:hackathon_msa_clean_architecture_bloc/features/restaurant/domain/entities/coordinates_entity.dart';

class Coordinates extends CoordinatesEntity {
  Coordinates({required super.latitude, required super.longitude});

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      latitude: json['latitude']?.toDouble() ?? 0.0,
      longitude: json['longitude']?.toDouble() ?? 0.0,
    );
  }
}
