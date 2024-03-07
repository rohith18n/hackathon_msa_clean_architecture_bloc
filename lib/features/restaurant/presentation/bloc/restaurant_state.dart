part of 'restaurant_bloc.dart';

abstract class RestaurantState {}

class RestaurantInitial extends RestaurantState {}

class RestaurantLoading extends RestaurantState {}

class RestaurantLoaded extends RestaurantState {
  final List<Restaurant> restaurant;

  RestaurantLoaded({required this.restaurant});
}

class RestaurantError extends RestaurantState {
  final String message;

  RestaurantError({required this.message});
}
