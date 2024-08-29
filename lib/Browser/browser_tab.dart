import 'package:flutter/material.dart';
import 'package:movies_app/Browser/browser_tab_viewmodel.dart';
import 'package:movies_app/Browser/genre_screen.dart';
import 'package:provider/provider.dart';

class BrowserTab extends StatefulWidget {
  static const routeName='browser';

  @override
  State<BrowserTab> createState() => _BrowserTabState();

}

class _BrowserTabState extends State<BrowserTab> {
  BrowserTabViewModel viewModel = BrowserTabViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getMoviesGenres();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel ,
      child: Consumer<BrowserTabViewModel>(
        builder: (context,viewModel,child) {
          if(viewModel.errorMessage!=null){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(viewModel.errorMessage! , style: Theme.of(context).textTheme.titleMedium,),
                  ElevatedButton(onPressed:(){
                    viewModel.getMoviesGenres();}
                      , style: ElevatedButton.styleFrom(
                          backgroundColor:Theme.of(context).primaryColor ),
                      child:Text('Try Again'))
                ],
              ),
            );
          }
          else if(viewModel.genreList==null){
            return Center(child: CircularProgressIndicator(
              color: Theme.of(context).canvasColor,));
          }
          else{
            return
              GenreScreen(genreList: viewModel.genreList!) ;

          }


        },
      ),

    );
  }

}