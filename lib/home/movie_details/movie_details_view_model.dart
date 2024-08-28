import 'package:flutter/material.dart';
import 'package:movies_app/Api/api_manager.dart';
import '../../model/DetailsResponses.dart';

class MovieDetailsViewModel extends ChangeNotifier{
  List<Genres>? genres;
  String? errorMessage;


  void getId(num ?movieId)async{
    genres=null;
    errorMessage = null;
    notifyListeners();

    try{
      var response = await ApiManager.getMovieDetailsById(id: movieId);
      if(response?.status_code == 7) {
        errorMessage = response?.status_message;
        print(errorMessage);
      }
      else{
        genres = response?.genres;
        print("-------------------------");
        print(genres);
      }
    }catch(e){
      errorMessage = "Loading Error";
    }
    notifyListeners();
  }
}