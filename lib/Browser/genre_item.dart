import 'package:flutter/material.dart';
import 'package:movies_app/my_theme_data.dart';
import '../model/MovieGenreResponse.dart';
import '../model/category_image.dart';

class GenreItem extends StatelessWidget{
  int index;
  List<Genres> genreList;

  GenreItem({required this.index , required this.genreList});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
            opacity: 0.3,
            child: Image.asset(CategoryImage.getGenres2(genreList)[index].ImageUrl ,
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(genreList[index].name??'', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: MyTheme.iconColor),
              ),
            ),
          ],
        )
      ],
    );

  }

}