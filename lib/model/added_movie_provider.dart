import 'package:flutter/material.dart';
import 'PopularResponse.dart';
import 'firebase_utils.dart';

class AddedMovieProvider extends ChangeNotifier {
  onClickedWatchList(Results movie,bool isWatchList)async{
    if (isWatchList==false) {
      isWatchList=true;
      await FirebaseUtils.addWatchListMovie(movie);
      await readWatchListFromFireStore(movie);
    } else {
      isWatchList=false;
      await FirebaseUtils.deleteWatchListMovie(movie);
      await readWatchListFromFireStore(movie);


    }
  }

  List<Results> watchListMovie=[];
  Future<void> readWatchListFromFireStore(Results movie) async {
    var querySnapShot = await FirebaseUtils.getWatchListMovies().get();
    watchListMovie = querySnapShot.docs.map((doc) {
      return doc.data();
    }).toList();
    watchListMovie.sort((a, b) => a.title!.compareTo(b.title!));
    notifyListeners();
  }

  checkExistMovie(Results movie) {
    for (int i = 0; i <watchListMovie.length; i++) {
      if (watchListMovie[i].id == movie.id) {
        return true;
      }

    }return false;

  }

}