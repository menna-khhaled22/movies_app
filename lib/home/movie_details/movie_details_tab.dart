import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/home/movie_details/similar_movies/similar_movies.dart';
// import 'package:movies/Api/api_manager.dart';
// import 'package:movies/Model/details_responses.dart';
import '../../model/PopularResponse.dart';
import '../../my_theme_data.dart';
import '../movie_item.dart';
import 'movie_details.dart';

class MovieDetailsTab extends StatefulWidget {
  static String routeName = "MovieDetails";

  @override
  State<MovieDetailsTab> createState() => _MovieDetailsTabState();
}

class _MovieDetailsTabState extends State<MovieDetailsTab> {
  bool isSave = false;
  Results? result;
  // Genres? genres;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (result == null) {
      result = ModalRoute.of(context)!.settings.arguments as Results;
    }
    return Scaffold(
      backgroundColor: MyTheme.primaryColor,
      appBar: AppBar(
        leading: BackButton(
          color: MyTheme.whiteColor,
        ),
        backgroundColor: MyTheme.greyColor,
        title: Text(result?.title ?? "" ,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(color: MyTheme.whiteColor),),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: CachedNetworkImage(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.3,
                      fit: BoxFit.cover,
                      imageUrl: "https://image.tmdb.org/t/p/w500" +
                          "${result?.backdropPath}",
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                          color: MyTheme.yellowColor,
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(
                        Icons.error,
                        color: MyTheme.yellowColor,
                      ),
                    ),
                  ),
                  Center(
                      heightFactor: 5,
                      child:
                      Image.asset('assets/images/play-button-2.png', scale: 1.2)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10 , left: 10),
                child: Text(
                  result?.title ?? "",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20,color: MyTheme.whiteColor),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(result?.releaseDate ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 12, color: MyTheme.iconColor)),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 45),
                            child: MovieItem(
                              movie: result!,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // color: Colors.deepOrange,
                            height: MediaQuery.of(context).size.height*0.1,
                            width: MediaQuery.of(context).size.width*0.57,
                            child: MovieDetails(
                              results: result!,
                            )),
                        SizedBox(height: 10,),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.48,
                          height: MediaQuery.of(context).size.width * 0.4,
                          child: SingleChildScrollView(
                            child: Text(
                              "${result?.overview}",
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(color: MyTheme.greyText),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.01,
                        ),
                        Row(
                          children: [
                            Image.asset("assets/images/star.png"),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.02,
                            ),
                            Text(
                              "${result?.voteAverage}",
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: MyTheme.whiteColor),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.01,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              SimilarMovies(movie: result!),
            ],
          ),
        ),
      ),
    );
  }
}