import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/model/SimilarResponse.dart';
import '../model/DetailsResponses.dart';
import '../model/DiscoverResponse.dart';
import '../model/PopularResponse.dart';
import 'api_constants.dart';
import 'package:movies_app/model/MovieGenreResponse.dart';
import 'package:movies_app/model/MovieDetailsResponse.dart';
import 'package:movies_app/model/searchResponse.dart';
class ApiManager{

  static Future<PopularResponse> getPopularApi() async {
    ///https://api.themoviedb.org/3/movie/popular?language=en-US&page=1'
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.popularUrl,
        {'api_key': '6b6055cc2c88703b542b7633d9d828a7'});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var object = PopularResponse.fromJson(json);
      return object;
    } catch (e) {
      throw e;
    }
  }

  static Future<DiscoverResponse> getNewRelease() async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.discoverUrl, {
      'api_key': '6b6055cc2c88703b542b7633d9d828a7',
      'primary_release_year': '${DateTime.now().year}'
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var object = DiscoverResponse.fromJson(json);
      return object;
    } catch (e) {
      throw e;
    }
  }

  static Future<DiscoverResponse> getRecommend() async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.discoverUrl, {
      'api_key': '6b6055cc2c88703b542b7633d9d828a7',
      'sort_by': 'vote_average.desc',
      'vote_count.gte': '200'
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var object = DiscoverResponse.fromJson(json);
      return object;
    } catch (e) {
      throw e;
    }
  }

  static Future<DetailsResponses?> getMovieDetailsById({required num? id}) async {
    // https://api.themoviedb.org/3/movie/{movie_id}
    Uri url = Uri.https(ApiConstant.baseUrl, "/3/movie/$id",
        {"api_key": "6b6055cc2c88703b542b7633d9d828a7", 'movie_id': '$id'});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return DetailsResponses.fromJson(json);
    } catch (e) {
      throw e;
    }
  }




  static Future<SimilarResponse?> getSimilarMovies({required num? id}) async {
    Uri url = Uri.https(ApiConstant.baseUrl, "/3/movie/$id/similar",
        {"api_key": "6b6055cc2c88703b542b7633d9d828a7", 'movie_id': '$id'});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SimilarResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<MovieGenreResponse?> getMoviesGenres()async{
    Uri url = Uri.https(ApiConstant.baseUrl2 , ApiConstant.movieGenreApi ,
        {
          'api_key': '6b6055cc2c88703b542b7633d9d828a7'

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

  static Future<MovieDetailsResponse?> getMovieByGenreId(String genreId)async{
    Uri url = Uri.https(ApiConstant.baseUrl2 , ApiConstant.movieDetailsApi ,
        {
          'api_key':'6b6055cc2c88703b542b7633d9d828a7',
          'sort_by' : 'vote_count.desc',
          'with_genres': genreId
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
  static Future<SearchResponse?> Search({String? query}) async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.SearchUrl,
        {"api_key": "001980e37e125ade2ff7f7ff71d9e93a", "query": query});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SearchResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
