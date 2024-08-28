import 'package:flutter/material.dart';
// import 'package:movies/Model/details_responses.dart';
// import 'package:movies/movie_details/movie_details_view_model.dart';
import 'package:provider/provider.dart';
import '../../model/PopularResponse.dart';
import '../../my_theme_data.dart';
import 'movie_details_view_model.dart';

class MovieDetails extends StatefulWidget {
  @override
  State<MovieDetails> createState() => _MovieDetailsState();
  // List<Genres>?genres;
  Results results;
  MovieDetails({required this.results});
}

class _MovieDetailsState extends State<MovieDetails> {
  MovieDetailsViewModel movieDetailsViewModel = MovieDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    movieDetailsViewModel.getId(widget.results.id);

    print("**********************");
    print(widget.results.genreIds);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => movieDetailsViewModel,
        child: Consumer<MovieDetailsViewModel>(
            builder: (context, movieDetailsViewModel, child) {
              if (movieDetailsViewModel.errorMessage != null) {
                print("-------------------------");
                print(movieDetailsViewModel.errorMessage);
                print("-------------------------");

                return
                  Column(
                    children: [
                      Text("SomeThing went Wrong",style: TextStyle(color: Colors.white),),
                      ElevatedButton(
                          onPressed: () {
                            movieDetailsViewModel.getId(widget.results.id);
                            setState(() {
                              print(movieDetailsViewModel.errorMessage);
                            });
                          },
                          child: Text("Try Again"))
                    ],
                  );


              } else if (movieDetailsViewModel.genres == null) {
                return CircularProgressIndicator(
                  color: MyTheme.yellowColor,
                );
              } else {
                var item = movieDetailsViewModel.genres;
                print(item);
                return

                  //   ListView.builder(
                  //   cacheExtent: 10,
                  //
                  //   scrollDirection: Axis.horizontal,
                  //   physics:NeverScrollableScrollPhysics() ,
                  //   itemBuilder: (context, index) {
                  //     return
                  //
                  //       Container(
                  //       width: 65,
                  //       height: 25,
                  //       child:Text('${item[index].name}',style: Theme.of(context).textTheme.titleSmall!.copyWith(color: MyTheme.iconColor,fontSize: 13),) ,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(5),
                  //
                  //       border: Border.all(
                  //           width: 2,
                  //           color: MyTheme.geryColor,
                  //         ),
                  //       ),
                  //     );
                  //   },
                  //   itemCount: item!.length,
                  // );
                  GridView.builder(
                    // shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 3,
                      mainAxisExtent: 40,
                      childAspectRatio:(4/.3),
                    ),
                    itemBuilder: (context, index) {
                      return

                        Container(
                            height: 20,
                            width: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: MyTheme.greyColor,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              // color: Colors.red,
                            ),
                            child:
                            Center(child: Text('${item[index].name}',style: Theme.of(context).textTheme.titleSmall!.copyWith(color: MyTheme.iconColor,fontSize: 13), textAlign: TextAlign.center,))


                        );
                    },
                    itemCount:item!.length,
                    // ),

                  );
              }
            }));
  }
}