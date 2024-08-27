import 'package:flutter/material.dart';
import 'package:movies_app/home/popular_slider.dart';

import 'new_release.dart';
// import 'package:movies/Home/new_release.dart';
// import 'package:movies/Home/recommended.dart';
// import 'package:movies/Model/added_movie_provider.dart';
// import 'package:provider/provider.dart';
class HomeScreenTab extends StatefulWidget {
  static const routeName='home_screen_tab';

  @override
  State<HomeScreenTab> createState() => _HomeScreenTabState();
}

class _HomeScreenTabState extends State<HomeScreenTab> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PopularSlider(),
          NewRelease(),
          SizedBox(height:MediaQuery.sizeOf(context).height*0.03,),
          // Recommended(),
          SizedBox(height:MediaQuery.sizeOf(context).height*0.03,),
        ],
      ),
    );
  }


}