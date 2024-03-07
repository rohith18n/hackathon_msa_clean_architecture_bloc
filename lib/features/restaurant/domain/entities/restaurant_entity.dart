import 'package:hackathon_msa_clean_architecture_bloc/features/restaurant/domain/entities/category_entity.dart';
import 'package:hackathon_msa_clean_architecture_bloc/features/restaurant/domain/entities/coordinates_entity.dart';
import 'package:hackathon_msa_clean_architecture_bloc/features/restaurant/domain/entities/location_entity.dart';

class RestaurantEntity {
  final String id;
  final String alias;
  final String name;
  final String imageUrl;
  final bool isClosed;
  final String url;
  final int reviewCount;
  final List<CategoryEntity> categories;
  final double rating;
  final CoordinatesEntity coordinates;
  final List<String> transactions;
  final String price;
  final LocationEntity location;
  final String phone;
  final String displayPhone;
  final double distance;

  RestaurantEntity({
    required this.id,
    required this.alias,
    required this.name,
    required this.imageUrl,
    required this.isClosed,
    required this.url,
    required this.reviewCount,
    required this.categories,
    required this.rating,
    required this.coordinates,
    required this.transactions,
    required this.price,
    required this.location,
    required this.phone,
    required this.displayPhone,
    required this.distance,
  });
}
