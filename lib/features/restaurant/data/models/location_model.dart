import 'package:hackathon_msa_clean_architecture_bloc/features/restaurant/domain/entities/location_entity.dart';

class Location extends LocationEntity {
  Location({
    required super.address1,
    required super.address2,
    required super.address3,
    required super.city,
    required super.zipCode,
    required super.country,
    required super.state,
    required super.displayAddress,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      address1: json['address1'] ?? '',
      address2: json['address2'] ?? '',
      address3: json['address3'] ?? '',
      city: json['city'] ?? '',
      zipCode: json['zip_code'] ?? '',
      country: json['country'] ?? '',
      state: json['state'] ?? '',
      displayAddress: (json['display_address'] as List<dynamic>?)
              ?.map((address) => address.toString())
              .toList() ??
          [],
    );
  }
}
