import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../my_theme_data.dart';

class WatchTab extends StatefulWidget {
  static const routeName = 'watchlist';

  @override
  State<WatchTab> createState() => _WatchTabState();
}

class _WatchTabState extends State<WatchTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AddedMovieProvider>(context);
    // if (provider.watchListMovie.isEmpty) {
    //   provider.readWatchListFromFireStore();
    // }
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.sizeOf(context).width * 0.03,
                top: MediaQuery.sizeOf(context).height * 0.08),
            child: Text(
              'Watchlist',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Padding(
                  padding:EdgeInsets.symmetric(horizontal:MediaQuery.sizeOf(context).width*0.05,vertical:MediaQuery.sizeOf(context).height*0.02),
                  child: Row(
                    children: [
                      Container(
                          child: MovieItem(movie: provider.watchListMovie[index])),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                provider.watchListMovie[index].title!,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                    color: MyTheme.whiteColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                              SizedBox(height: 10,),
                              Text(provider.watchListMovie[index].releaseDate!,style:Theme.of(context).textTheme.titleSmall!.copyWith(color:MyTheme.iconColor,fontSize: 13),),
                              // Text(provider.watchListMovie[index].!,style:Theme.of(context).textTheme.titleSmall!.copyWith(color:MyTheme.iconColor,fontSize: 13),)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: MyTheme.iconColor,
                  height: 20,
                  endIndent: 10,
                  indent: 10,
                  thickness: 0.8,
                );
              },
              itemCount: provider.watchListMovie.length,
            ),
          ),
        ],
      ),
    );
  }
}