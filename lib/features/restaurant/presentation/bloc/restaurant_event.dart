part of 'restaurant_bloc.dart';

abstract class RestaurantEvent {}

class CreateRestaurantEvent extends RestaurantEvent {
  final String location;
  final String search;

  CreateRestaurantEvent({required this.location, required this.search});
}
