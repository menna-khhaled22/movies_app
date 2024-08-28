import 'MovieGenreResponse.dart';

class CategoryImage{
  String ImageUrl;
  CategoryImage({ required this.ImageUrl});

  static List<CategoryImage> getGenres2(List<Genres> genreList) {
    List<CategoryImage> newGenreList = [];
    CategoryImage categoryImage;
    for(int i = 0 ; i<genreList.length ; i++){
      categoryImage =CategoryImage( ImageUrl: 'assets/images/${genreList[i].name}.jpg');
      newGenreList.add(categoryImage);
    }
    return newGenreList;
  }

}
