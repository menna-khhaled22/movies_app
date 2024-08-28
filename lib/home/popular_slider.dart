import 'package:flutter/material.dart';
import 'package:movies_app/home/popular_item.dart';
import 'package:movies_app/home/popular_slider_view_model.dart';
import 'package:provider/provider.dart';
import '../my_theme_data.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:movies/Home/popular_Item.dart';


// import '../Api/api_manager.dart';

class PopularSlider extends StatefulWidget {
  @override
  State<PopularSlider> createState() => _PopularSliderState();
}

class _PopularSliderState extends State<PopularSlider> {
  PopularSliderViewModel viewModel = PopularSliderViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getPopularMovie();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<PopularSliderViewModel>(
          builder: (context, value, child) {
            if (viewModel.errorMessage != null) {
              return Column(
                children: [
                  Text('${viewModel.errorMessage}',
                      style: TextStyle(color: MyTheme.whiteColor)),
                  ElevatedButton(onPressed: () {
                    viewModel.getPopularMovie();
                  },
                      child: Text(
                          'Try Again',
                          style: TextStyle(color: MyTheme.whiteColor)))
                ],
              );
            } else if (viewModel.popularList == null) {
              return Center(
                child: CircularProgressIndicator(color: MyTheme.yellowColor),);
            } else {
              return CarouselSlider(
                  items: viewModel.popularList!.map((e) =>
                      PopularItem(index: e)).toList(),
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      viewModel.scroll = index;
                    },
                    pageSnapping: true,

                    height: MediaQuery
                        .sizeOf(context)
                        .height * 0.5,
                    viewportFraction: 1,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.linearToEaseOut,
                    initialPage: 0,
                    enlargeFactor: 0,
                    scrollDirection: Axis.horizontal,
                  ));
            }
          }),
    );
  }}