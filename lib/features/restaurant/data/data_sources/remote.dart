import 'package:hackathon_msa_clean_architecture_bloc/core/constants/constants.dart';
import 'package:hackathon_msa_clean_architecture_bloc/core/network/network_service.dart';
import 'package:hackathon_msa_clean_architecture_bloc/core/utils/typedef.dart';

class SpotRemoteDataSource {
  EitherResponse getData(
    String location,
    String search,
  ) async =>
      NetworkService.getApi(location, search, yelpAPIBaseURL);
}
