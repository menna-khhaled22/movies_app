import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/home/movie_details/similar_movies/similar_movies_view_model.dart';
import 'package:provider/provider.dart';
import '../../../model/PopularResponse.dart';
import '../../../my_theme_data.dart';
import '../../recommended_item.dart';

class SimilarMovies extends StatefulWidget {

  @override
  State<SimilarMovies> createState() => _SimilarMoviesState();
  SimilarMovieViewModel similarMovieViewModel = SimilarMovieViewModel();
  Results movie;
  SimilarMovies({required this.movie});
}

class _SimilarMoviesState extends State<SimilarMovies> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.similarMovieViewModel.getSimilarMovies(widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyTheme.greyColor,
      ),
      height:MediaQuery.sizeOf(context).height*0.56,
      child: ChangeNotifierProvider(
        create: (context) => widget.similarMovieViewModel,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("More Like this",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: MyTheme.whiteColor)),
            ),
            SizedBox(height: 20,),

            Consumer<SimilarMovieViewModel>(builder: (context,similarMovieViewModel,child){
              if(similarMovieViewModel.errorMessage != null){
                return Center(
                  child: Column(
                    children: [
                      Text("SomeThing went Wrong",style: TextStyle(color: Colors.white),),
                      ElevatedButton(
                          onPressed: () {
                            similarMovieViewModel.getSimilarMovies(widget.movie.id);
                            setState(() {
                              print(widget.movie.id);
                              print("------------------------------------");
                              print(similarMovieViewModel.errorMessage);
                              print("------------------------------------");

                            });
                          },
                          child: Text("Try Again"))
                    ],
                  ),
                );
              }
              else if(similarMovieViewModel.movies == null){
                return CircularProgressIndicator();
              }
              else{
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      final item =  similarMovieViewModel.movies![index];
                      return Padding(
                        padding:EdgeInsets.only(bottom: 15, left: 5, right: 10),
                        child: RecommendItem(movie: item),
                      );
                    },
                    itemCount: similarMovieViewModel.movies?.length,
                  ),
                );
              }
            },
            ),
          ],
        ),

      ),
    );

  }
}