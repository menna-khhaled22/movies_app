import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'PopularResponse.dart';

class FirebaseUtils {
  static CollectionReference<Results> getWatchListMovies() {
    return FirebaseFirestore.instance.collection('users').withConverter<Results>(
      fromFirestore: (snapshot, options) =>
          Results.fromJson(snapshot.data()),
      toFirestore: (value, options) =>value.toJson(),
    );
  }
  static Future<void> addWatchListMovie(Results movie){
    return getWatchListMovies().doc(movie.id.toString()).set(movie);
  }
  static Future<void> deleteWatchListMovie(Results movie){
    return getWatchListMovies().doc(movie.id.toString()).delete();
  }
}