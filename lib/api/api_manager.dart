import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/api/api_constants.dart';
import 'package:movies_app/home/new_release.dart';
import 'package:movies_app/model/details_responses.dart';
import 'package:movies_app/model/discover_response.dart';
import 'package:movies_app/model/PopularResponse.dart';
import 'package:movies_app/Model/samiler_response.dart';
import 'package:movies_app/model/searchResponse.dart';

class ApiManage {
  static Future<PopularResponse> getPopularApi() async {
    ///https://api.themoviedb.org/3/movie/popular?language=en-US&page=1'
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.popularUrl,
        {'api_key': '001980e37e125ade2ff7f7ff71d9e93a'});
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

//'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&with_release_type=2|3&release_date.gte={min_date}&release_date.lte={max_date}' \
  static Future<DiscoverResponse> getNewRelease() async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.discoverUrl, {
      'api_key': '001980e37e125ade2ff7f7ff71d9e93a',
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
      'api_key': '001980e37e125ade2ff7f7ff71d9e93a',
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
        {"api_key": "001980e37e125ade2ff7f7ff71d9e93a", 'movie_id': '$id'});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return DetailsResponses.fromJson(json);
    } catch (e) {
      throw e;
    }
  }




  static Future<SamilerResponse?> getSimilarMovies({required num? id}) async {
    Uri url = Uri.https(ApiConstant.baseUrl, "/3/movie/$id/similar",
        {"api_key": "001980e37e125ade2ff7f7ff71d9e93a", 'movie_id': '$id'});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SamilerResponse.fromJson(json);
    } catch (e) {
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