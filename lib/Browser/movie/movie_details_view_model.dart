import 'package:flutter/material.dart';
// import 'package:movies/model/MovieDetailsResponse.dart';
import '../../api/api_manager.dart';
import 'package:movies_app/model/popular_response.dart';



class MovieDetailsViewModel extends ChangeNotifier{
  List<Results>? moviesList;
  String? errorMessage;
  void getMoviesByGenreId(String genreId)async{
    moviesList = null;
    errorMessage = null;
    notifyListeners();
    try{
      var response = await ApiManager.getMovieByGenreId(genreId);
      if(response?.success ==false){
        errorMessage= response?.status_message;
      }
      else{
        moviesList = response?.results ;
      }
    }
    catch(e){
      errorMessage = 'Error loading genre list';
    }
    notifyListeners();
  }
}