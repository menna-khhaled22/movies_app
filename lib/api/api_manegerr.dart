import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/api/api_constants.dart';
import 'package:movies_app/model/MovieGenreResponse.dart';

import '../model/MovieDetailsResponse.dart';
class ApiManagerr {
  static Future<MovieGenreResponse?> getMoviesGenres()async{
    Uri url = Uri.https(ApiConstants.baseUrl , ApiConstants.movieGenreApi ,
        {
          'api_key': '021a5163f6d9c38b567e24506fd38192'

        });
    try{
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return MovieGenreResponse.fromJson(json);
    }
    catch(e){
      throw e;
    }

  }
  static Future<MovieDetailsResponse?> getMovieByGenreId(String genre_id)async{
    Uri url = Uri.https(ApiConstants.baseUrl , ApiConstants.movieDetailsApi ,
        {
          'api_key':'021a5163f6d9c38b567e24506fd38192',
          'sort_by' : 'vote_count.desc',
          'with_genres': genre_id
        });

    try{
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return MovieDetailsResponse.fromJson(json);
    }
    catch(e){
      throw e;
    }
  }
}