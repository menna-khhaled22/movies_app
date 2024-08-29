import 'package:movies_app/Api/api_manager.dart';
import '../model/PopularResponse.dart';
import 'package:flutter/material.dart';

class PopularSliderViewModel extends ChangeNotifier{
  int scroll=0;
  List<Results>? popularList;
  String? errorMessage;
  Future<void> getPopularMovie()async{
    popularList=null;
    errorMessage=null;
    notifyListeners();
    try{
      var response=await ApiManager.getPopularApi();
      if(response.status_code==7){
        errorMessage=response.status_message;
      }else{
        popularList=response.results!.cast<Results>();
      }
    }catch(e){
      errorMessage=e.toString();
    }
    notifyListeners();
  }
}