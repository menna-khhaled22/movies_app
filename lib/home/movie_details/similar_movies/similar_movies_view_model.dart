import 'package:flutter/foundation.dart';
import 'package:movies_app/Api/api_manager.dart';

import '../../../model/PopularResponse.dart';

class SimilarMovieViewModel extends ChangeNotifier{
  String? errorMessage;
  List<Results>? movies;

  void getSimilarMovies(num? id) async{
    errorMessage= null;
    movies= null;
    notifyListeners();
    try{
      var response = await ApiManager.getSimilarMovies(id: id);
      if(response?.status_code == 34){
        errorMessage = response?.status_message;
      }
      else
      {
        movies = response?.results;
      }
    }catch(e){
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}