import 'package:flutter/material.dart';
import 'package:movies_app/Api/api_manage.dart';
import 'package:movies_app/Api/api_manager.dart';
import '../model/UpComingResponse.dart';

class NewReleaseViewModel extends ChangeNotifier{
  List<Results>? newReleaseList;
  String? errorMessage;
  Future<void> getNewReleaseMovie()async{
    errorMessage=null;
    newReleaseList=null;
    notifyListeners();
    try{
      var response=await ApiManage.getNewRelease();
      if(response.status_code==7){
        errorMessage=response.status_message;
      }else {
        newReleaseList = response.results;
      }
    }catch(e){
      errorMessage='no connection';
    }
    notifyListeners();
  }
}