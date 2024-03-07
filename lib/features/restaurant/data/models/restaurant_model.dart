import 'package:hackathon_msa_clean_architecture_bloc/features/restaurant/data/models/category_model.dart';
import 'package:hackathon_msa_clean_architecture_bloc/features/restaurant/data/models/coordinates_model.dart';
import 'package:hackathon_msa_clean_architecture_bloc/features/restaurant/data/models/location_model.dart';
import 'package:hackathon_msa_clean_architecture_bloc/features/restaurant/domain/entities/restaurant_entity.dart';

class Restaurant extends RestaurantEntity {
  Restaurant({
    required super.id,
    required super.alias,
    required super.name,
    required super.imageUrl,
    required super.isClosed,
    required super.url,
    required super.reviewCount,
    required super.categories,
    required super.rating,
    required super.coordinates,
    required super.transactions,
    required super.price,
    required super.location,
    required super.phone,
    required super.displayPhone,
    required super.distance,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'] ?? '',
      alias: json['alias'] ?? '',
      name: json['name'] ?? '',
      imageUrl: json['image_url'] ?? '',
      isClosed: json['is_closed'] ?? false,
      url: json['url'] ?? '',
      reviewCount: json['review_count'] ?? 0,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((category) => Category.fromJson(category))
              .toList() ??
          [],
      rating: json['rating']?.toDouble() ?? 0.0,
      coordinates: Coordinates.fromJson(json['coordinates'] ?? {}),
      transactions: (json['transactions'] as List<dynamic>?)
              ?.map((transaction) => transaction.toString())
              .toList() ??
          [],
      price: json['price'] ?? '',
      location: Location.fromJson(json['location'] ?? {}),
      phone: json['phone'] ?? '',
      displayPhone: json['display_phone'] ?? '',
      distance: json['distance']?.toDouble() ?? 0.0,
    );
  }
}







// {
//       "id": "PTFxtXS47ZVRCdZIrEWvGw",
//       "alias": "golden-boy-pizza-san-francisco",
//       "name": "Golden Boy Pizza",
//       "image_url": "https://s3-media3.fl.yelpcdn.com/bphoto/YP_8Tm4LXcI2FqTfZuxvAA/o.jpg",
//       "is_closed": false,
//       "url": "https://www.yelp.com/biz/golden-boy-pizza-san-francisco?adjust_creative=51SsU9NI_tuXrEuO3-2lqg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=51SsU9NI_tuXrEuO3-2lqg",
//       "review_count": 4391,
//       "categories": [
//         {
//           "alias": "pizza",
//           "title": "Pizza"
//         },
//         {
//           "alias": "italian",
//           "title": "Italian"
//         }
//       ],
//       "rating": 4.4,
//       "coordinates": {
//         "latitude": 37.7997956,
//         "longitude": -122.4080729
//       },
//       "transactions": [
//         "delivery",
//         "pickup"
//       ],
//       "price": "$",
//       "location": {
//         "address1": "542 Green St",
//         "address2": "",
//         "address3": "",
//         "city": "San Francisco",
//         "zip_code": "94133",
//         "country": "US",
//         "state": "CA",
//         "display_address": [
//           "542 Green St",
//           "San Francisco, CA 94133"
//         ]
//       },
//       "phone": "+14159829738",
//       "display_phone": "(415) 982-9738",
//       "distance": 1205.6870786305708
//     }