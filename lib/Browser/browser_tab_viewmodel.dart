import 'package:flutter/material.dart';
import 'package:movies_app/api/api_manager.dart';
import '../model/MovieGenreResponse.dart';

class BrowserTabViewModel extends ChangeNotifier{
  List<Genres>? genreList;
  String? errorMessage;
  void getMoviesGenres()async{
    genreList = null;
    errorMessage = null;
    notifyListeners();
    try{
      var response = await ApiManager.getMoviesGenres();
      if(response?.success ==false){
        errorMessage= response?.status_message;
      }
      else{
        genreList = response?.genres;
      }

    }
    catch(e){
      errorMessage = 'Error loading genre list';
    }
    notifyListeners();
  }

}