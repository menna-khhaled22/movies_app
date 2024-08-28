import 'package:flutter/material.dart';
import 'package:movies_app/Browser/browser_tab.dart';
import 'package:provider/provider.dart';
import '../../my_theme_data.dart';
import '../../model/MovieGenreResponse.dart';
import 'movie_details_view_model.dart';
import 'movie_screen.dart';

class MovieDetails extends StatefulWidget {
  static const routeName='movie_details';

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  MovieDetailsViewModel viewModel = MovieDetailsViewModel();
  Genres? args  ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(args==null){
      args = ModalRoute.of(context)!.settings.arguments as Genres;
    }
    viewModel.getMoviesByGenreId(args?.id.toString()??'');


    return  Scaffold(
      backgroundColor:MyTheme.primaryColor  ,
      appBar: AppBar(
        title: Text(args?.name??""),
        backgroundColor:MyTheme.primaryColor,
        leading: BackButton(
          color: MyTheme.whiteColor,
          onPressed: (){
            Navigator.of(context).pop(BrowserTab.routeName);
          },
        ),
      ),
      body: ChangeNotifierProvider(create: (context) => viewModel ,
        child: Consumer<MovieDetailsViewModel>(
            builder: (context,viewModel,child){
              if(viewModel.errorMessage!=null){
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(viewModel.errorMessage! , style: Theme.of(context).textTheme.titleMedium,),
                      ElevatedButton(onPressed:(){viewModel.getMoviesByGenreId(args?.id.toString() ?? '');}
                          , style: ElevatedButton.styleFrom(
                              backgroundColor:Theme.of(context).primaryColor ),
                          child:Text('Try Again'))
                    ],
                  ),
                );
              }
              else if(viewModel.moviesList==null){
                return Center(child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,));
              }
              else{
                return  MovieScreen(moviesList: viewModel.moviesList);
              }
            }
        ) ,) ,

    );
  }

}