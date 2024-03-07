import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:hackathon_msa_clean_architecture_bloc/core/resources/data_state.dart';
import 'package:hackathon_msa_clean_architecture_bloc/features/restaurant/data/data_sources/remote.dart';
import 'package:hackathon_msa_clean_architecture_bloc/features/restaurant/data/models/restaurant_model.dart';
import 'package:hackathon_msa_clean_architecture_bloc/features/restaurant/domain/repositories/yelp_entity.dart';

typedef FailureOrCreator = Future<Either<AppException, List<Restaurant>>>;

class SpotRepositoryImpl extends SpotRepository {
  final spotRemoteDataSource = SpotRemoteDataSource();

  FailureOrCreator createSpot(String location, String search) async {
    log("createSpot Function is running");
    final response = await spotRemoteDataSource.getData(location, search);

    // log("${response.toString()}");
    final result = response.fold(
      (error) => error,
      (data) {
        if (data['businesses'].runtimeType == List<dynamic>) {
          log("success");
          final businesses = data['businesses'] as List<dynamic>;
          log("number of restaurants coming --- ${businesses.length.toString()}");
          log(businesses[0].toString());
          return businesses.map((json) => Restaurant.fromJson(json)).toList();

          // return Restaurant.fromJson(data['businesses']);
        } else {
          log('Failed to get Restaurants');
          return CustomException(message: 'Failed to get Restaurants');
        }
      },
    );
    return response.isLeft()
        ? Left(result as AppException)
        : Right(result as List<Restaurant>);
  }
}
