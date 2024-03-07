import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:hackathon_msa_clean_architecture_bloc/features/restaurant/data/models/restaurant_model.dart';
import 'package:hackathon_msa_clean_architecture_bloc/features/restaurant/data/repositories/yelp_repositories.dart';
part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final SpotRepositoryImpl repository;

  RestaurantBloc({required this.repository}) : super(RestaurantInitial()) {
    on<CreateRestaurantEvent>((event, emit) async {
      try {
        log("CreateRestaurantEvent is Running");
        final result =
            await repository.createSpot(event.location, event.search);
        log("-----List<Restaurant> finally came to Bloc >${result.length.toString()}-----");
        result.fold(
          (error) => emit(RestaurantError(message: error.message)),
          (data) => emit(RestaurantLoaded(restaurant: data)),
        );
      } catch (e) {
        log(e.toString());
        emit(RestaurantError(message: e.toString()));
      }
    });
  }
}
