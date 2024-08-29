import 'package:flutter/material.dart';
import 'package:movies_app/Browser/genre_item.dart';
import 'package:movies_app/my_theme_data.dart';
import '../model/MovieGenreResponse.dart';
import 'browser_tab_viewmodel.dart';
import 'movie/movie_details.dart';

class GenreScreen extends StatelessWidget{
  static const routeName = 'genre_screen';
  List<Genres> genreList;
  BrowserTabViewModel viewModel = BrowserTabViewModel();


  GenreScreen({ required this.genreList });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all( MediaQuery.of(context).size.height*0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 30,),
          Text('Browse Category' ,style: Theme.of(context).textTheme.titleLarge!.copyWith(color: MyTheme.iconColor) ),
          Expanded(
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2 ,
                crossAxisSpacing: 30,
                mainAxisSpacing: 50,
                childAspectRatio: 2/1

            ),itemBuilder: (context , index){
              return
                InkWell(

                    onTap: (){
                      Navigator.of(context).pushNamed(MovieDetails.routeName ,arguments : genreList[index]);
                    },
                    child: GenreItem(index: index, genreList: genreList ,));
            }, itemCount: genreList.length,),
          )
        ],
      ),
    );
  }

}