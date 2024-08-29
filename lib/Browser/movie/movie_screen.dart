import 'package:flutter/material.dart';
import 'package:movies_app/Browser/movie/movie_item.dart';


class MovieScreen extends StatelessWidget {
  var moviesList;
  MovieScreen({required this.moviesList});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context , index){
        return MovieItem(moviesList: moviesList , index: index,);
      },itemCount: moviesList.length,);

  }
}