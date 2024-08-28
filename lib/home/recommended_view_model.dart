import 'package:flutter/material.dart';
import 'package:movies_app/Api/api_manager.dart';
import '../model/PopularResponse.dart';

class RecommendedViewModel extends ChangeNotifier{
  List<Results>? recommendedList;
  String? errorMessage;
  Future<void> getRecommendedMovie()async{
    recommendedList=null;
    errorMessage=null;
    notifyListeners();
    try{
      var response=await ApiManager.getRecommend();
      if(response.status_code==7){
        errorMessage=response.status_message;
      }else{
        recommendedList=response.results;
      }
    }catch(e){
      errorMessage='no connection';
    }
    notifyListeners();
  }
}