import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:hackathon_msa_clean_architecture_bloc/core/constants/constants.dart';
import 'package:hackathon_msa_clean_architecture_bloc/core/resources/data_state.dart';
import 'package:http/http.dart' as http;
import '../utils/typedef.dart';

class NetworkService {
  static final _headers = {
    'Authorization': 'Bearer $apiKey',
    'Accept': 'application/json',
  };

  static EitherResponse getApi(
      String location, String search, String url) async {
    final encodedLocation = Uri.encodeComponent(location);
    final uri = Uri.parse("$url?term=$search&location=111$encodedLocation");
    // final uri = Uri.parse(
    //     "$url?term=pizza&location=111%20Sutter%20St,%20San%20Francisco,%20");
    log("${url}term=$search&location=$encodedLocation");
    dynamic fetchedData;
    try {
      log("trying http get ---");
      final response = await http.get(uri, headers: _headers);
      log("http get response running completed---");
      log("status code for http.get ${response.statusCode}");
      fetchedData = _getResponse(response);
      log("-----fetched Data Runtimetype-----${fetchedData.runtimeType}-----");
    } on SocketException {
      return Left(InternetException());
    } on http.ClientException {
      // return Left(RequestTimeOUtException());
    } catch (e) {
      return Left(BadRequestException());
    }
    return Right(fetchedData);
  }

  static dynamic _getResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return (jsonDecode(response.body));
      case 400:
        throw BadRequestException();
      default:
        throw BadRequestException();
    }
  }
}
