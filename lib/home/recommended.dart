import 'package:flutter/material.dart';
import 'package:movies_app/home/recommended_item.dart';
// import 'package:movies/Api/api_manage.dart';
// import 'package:movies/Home/movie-item.dart';
// import 'package:movies/Home/recommend_item.dart';
import 'package:movies_app/home/recommended_view_model.dart';
import 'package:provider/provider.dart';
import '../my_theme_data.dart';

class Recommended extends StatefulWidget {
  @override
  State<Recommended> createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  RecommendedViewModel viewModel=RecommendedViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getRecommendedMovie();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(7),
        color: MyTheme.greyColor,
      ),
      height:MediaQuery.sizeOf(context).height*0.52,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding:EdgeInsets.symmetric(vertical:10,horizontal:16),
            child: Text('Recommended ',style:Theme.of(context).textTheme.titleMedium!.copyWith(color: MyTheme.whiteColor , fontSize: 22),),
          ),
          SizedBox(height: 10,),
          ChangeNotifierProvider(
            create:(context) => viewModel,
            child: Consumer<RecommendedViewModel>(
              builder:(context, value, child) {
                if(viewModel.errorMessage!=null){
                  return Column(
                    children: [
                      Text(viewModel.errorMessage!,style:TextStyle(color:MyTheme.whiteColor)),
                      ElevatedButton(onPressed: () {
                        viewModel.getRecommendedMovie();
                      }, child: Text('Try Again',style:TextStyle(color:MyTheme.whiteColor)))
                    ],
                  );
                }else if(viewModel.recommendedList==null){
                  return Center(child:CircularProgressIndicator(color:MyTheme.yellowColor),);
                }else{
                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder:(context, index) {
                        return Padding(
                          padding:EdgeInsets.only(bottom: 15,left:5,right: 10),
                          child:RecommendItem(movie:viewModel.recommendedList![index]),
                        );
                      },itemCount:viewModel.recommendedList!.length,
                    ),
                  );
                }
              },),
          )
        ],
      ),
    );
  }
}