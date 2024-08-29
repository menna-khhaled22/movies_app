import 'package:flutter/cupertino.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/model/PopularResponse.dart';


class SearchDelegateViewModel extends ChangeNotifier{
  List<Results>? movieList ;
  String? errorMessage;

  void getSearch (String query)async{
    print(query);
    movieList = null;
    errorMessage = null;
    notifyListeners();
    try{
      var response = await ApiManager.Search(query: query);
      if(response?.status_code ==7){
        errorMessage = response?.status_message;
      }
      else{
        movieList = response?.results;
      }
    }
    catch(e){
      errorMessage = "Error Loading";
    }
    notifyListeners();
  }
}