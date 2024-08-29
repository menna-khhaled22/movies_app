import 'package:flutter/material.dart';
// import 'package:movies/Home/movie-item.dart';
// import 'package:movies/Model/added_movie_provider.dart';
// import 'package:movies/Model/popular_response.dart';
import 'package:provider/provider.dart';

import '../model/PopularResponse.dart';
import '../my_theme_data.dart';
import 'movie_item.dart';

class RecommendItem extends StatefulWidget {
  Results movie;
  RecommendItem({required this.movie});

  @override
  State<RecommendItem> createState() => _RecommendItemState();
}

class _RecommendItemState extends State<RecommendItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            color: Colors.black45,
            spreadRadius: 4,
            blurRadius: 7,
            offset: Offset(5, 7)
          )],
          borderRadius: BorderRadius.circular(7),
          color: MyTheme.greyContainer,
        ),
        width: MediaQuery.sizeOf(context).width * 0.4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieItem(movie: widget.movie),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: MyTheme.yellowColor,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.02,
                  ),
                  Text(
                    widget.movie.voteAverage.toString(),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(color: MyTheme.whiteColor),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              Text(
                '${widget.movie.title}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: MyTheme.whiteColor),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              Text(
                widget.movie.releaseDate!,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 13, fontWeight: FontWeight.normal, color: MyTheme.greyText),
              )
            ],
          ),
        ),
      ),
    );
  }
}