import 'package:flutter/material.dart';
import '../my_theme_data.dart';
import 'home_screen_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';
  List<Widget>tabs=[HomeScreenTab()];
  // ,SearchTab(),BrowserTab(),WatchTab()

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTap = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:MyTheme.primaryColor,
      bottomNavigationBar:Theme(
        data:Theme.of(context).copyWith(
            canvasColor:MyTheme.navigateColor
        ),
        child: BottomNavigationBar(

            currentIndex:selectedTap,
            onTap:(select){
              selectedTap=select;
              setState(() {

              });
            },
            items:[
              BottomNavigationBarItem(icon:Icon(Icons.home),label:'HOME',),
              BottomNavigationBarItem(icon:Icon(Icons.search),label:'SEARCH', ),
              BottomNavigationBarItem(icon:Icon(Icons.movie_rounded),label: 'BROWSER',),
              BottomNavigationBarItem(icon:Icon(Icons.checklist),label:'WATCHLIST'),
            ]),
      ),
      body:widget.tabs[selectedTap],
    );
  }
}
