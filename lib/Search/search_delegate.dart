import 'package:flutter/material.dart';
import 'package:movies_app/my_theme_data.dart';
import 'package:movies_app/Search/searchItem.dart';
import 'package:movies_app/Search/search_delegate_view_model.dart';
import 'package:provider/provider.dart';

import '../my_theme_data.dart';

class searchDelegate extends SearchDelegate {

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () => showResults(context), icon: Icon(Icons.search)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Container(
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close)),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final searchDelegateViewModel = Provider.of<SearchDelegateViewModel>(context,listen: false);
    searchDelegateViewModel.getSearch(query);

    if (query == "") {
      return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/movieIcon.png"),
              SizedBox(
                height: 14,
              ),
              Text(
                "No movies found",
                style:
                Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 18 ,color: Colors.white),
              ),
            ],
          ));
    }

    return
      Consumer<SearchDelegateViewModel>(
          builder: (context, searchDelegateViewModel, child) {
            if (searchDelegateViewModel.errorMessage != null) {
              return Center(
                child: Column(
                  children: [
                    Text(
                      searchDelegateViewModel.errorMessage!,
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: MyTheme.whiteColor),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          MyTheme.yellowColor, // background (button) color
                          foregroundColor: Colors
                              .white, // foreground (text) color
                        ),
                        onPressed: () {
                          searchDelegateViewModel.getSearch(query);
                        },
                        child: Text("Try Again"))
                  ],
                ),
              );
            } else if (searchDelegateViewModel.movieList == null) {
              return Center(
                  child: CircularProgressIndicator(
                    color: MyTheme.yellowColor,
                  ));
            } else {
              print(searchDelegateViewModel.movieList);
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      searchItem(
                          item: searchDelegateViewModel.movieList![index]),
                      Divider(
                        color: MyTheme.greyColor,
                        thickness: 1,
                        indent: 25.0,
                        endIndent: 25.0,
                      ),
                    ],
                  );
                },
                itemCount: searchDelegateViewModel.movieList!.length,
              );
            }
          }
      );
    // ],
    // )
  }

  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: MyTheme.primaryColor,
      textTheme: TextTheme(
        headlineMedium: TextStyle(fontSize: 24.0, color: MyTheme.whiteColor),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: MyTheme.greyColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        hintStyle:
        Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 18),
      ),
    );
  }
}