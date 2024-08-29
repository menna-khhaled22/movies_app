import 'package:flutter/material.dart';
import '../model/PopularResponse.dart';
import '../my_theme_data.dart';
import 'movie_item.dart';


class PopularItem extends StatefulWidget {

  Results index ;
  PopularItem({required this.index});

  @override
  State<PopularItem> createState() => _PopularItemState();
}

class _PopularItemState extends State<PopularItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
              height: MediaQuery.sizeOf(context).height * 0.4,
              child: Image.network(
                width: double.infinity,
                "https://image.tmdb.org/t/p/w500" +
                    widget.index.backdropPath!,
              )),
          Center(
              heightFactor: 5,
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Image.asset('assets/images/play-button-2.png', scale: 1.2),
              )),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.sizeOf(context).height * 0.15,
                // bottom: MediaQuery.sizeOf(context).height * 0.15,
                left: MediaQuery.sizeOf(context).width * 0.04),
            // padding: EdgeInsets.symmetric(vertical:MediaQuery.sizeOf(context).height*0.15,horizontal:MediaQuery.sizeOf(context).width*0.04),
            child: Stack(
              children: [
                MovieItem(movie:widget.index),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.sizeOf(context).height * 0.21,
                      // bottom: MediaQuery.sizeOf(context).height * 0.21,
                      left: MediaQuery.sizeOf(context).width * 0.42),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        widget.index.title!,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize:15,color:MyTheme.whiteColor),
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * 0.01,),
                      Text(
                        widget.index.releaseDate!,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize:12,color:MyTheme.iconColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}