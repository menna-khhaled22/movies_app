import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/model/TopRatedResponse.dart';
import 'package:movies_app/model/UpComingResponse.dart';
import '../model/PopularResponse.dart';
import 'api_constants.dart';

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

  static Future<UpComingResponse> getNewRelease() async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.upComingUrl, {
      'api_key': '6b6055cc2c88703b542b7633d9d828a7',
      'primary_release_year': '${DateTime.now().year}'
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var object = UpComingResponse.fromJson(json);
      return object;
    } catch (e) {
      throw e;
    }
  }

  static Future<TopRatedResponse> getRecommend() async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.topRatedUrl, {
      'api_key': '6b6055cc2c88703b542b7633d9d828a7',
      'sort_by': 'vote_average.desc',
      'vote_count.gte': '200'
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var object = TopRatedResponse.fromJson(json);
      return object;
    } catch (e) {
      throw e;
    }
  }
}