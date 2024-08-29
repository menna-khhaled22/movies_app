import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../my_theme_data.dart';
import 'movie_item.dart';
import 'new_release_view_model.dart';

class NewRelease extends StatefulWidget {
  @override
  State<NewRelease> createState() => _NewReleaseState();
}

class _NewReleaseState extends State<NewRelease> {
  NewReleaseViewModel viewModel = NewReleaseViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewReleaseMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.35,
      color: MyTheme.greyColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Text(
              'New Releases ',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: MyTheme.whiteColor, fontSize: 22),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.01,
          ),
          ChangeNotifierProvider(
            create: (context) => viewModel,
            child: Consumer<NewReleaseViewModel>(
              builder: (context, value, child) {
                if (viewModel.errorMessage != null) {
                  return Column(
                    children: [
                      Text(
                        viewModel.errorMessage!,
                        style: TextStyle(color: MyTheme.whiteColor),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            viewModel.getNewReleaseMovie();
                          },
                          child: Text('Try Again',
                              style: TextStyle(color: MyTheme.whiteColor)))
                    ],
                  );
                } else if (viewModel.newReleaseList == null) {
                  return Center(
                    child:
                    CircularProgressIndicator(color: MyTheme.yellowColor),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                          EdgeInsets.only(left: 14 , right: 14 , bottom: 8),
                          child: MovieItem(
                              movie:
                              viewModel.newReleaseList![index]
                              ),
                        );
                        // viewModel.newReleaseList![index]
                        // child: InkWell(
                        //   onTap: (){
                        //
                        //     Navigator.of(context).pushNamed(MovieDetailsTab.routeName,arguments:viewModel.newReleaseList![index], );
                        //   },
                        //   child: MovieItem(
                        //       pathImage:
                        //       viewModel.newReleaseList![index].posterPath!),
                        // ),
                      },
                      itemCount: viewModel.newReleaseList!.length,
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}