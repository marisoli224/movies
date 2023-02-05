import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/search/search_screen.dart';
import 'package:movies/watch_list/watch_list_screen.dart';
import 'browse/browse_screen.dart';
import 'home_sc/home_screen.dart';

class Home extends StatefulWidget {
  static String routName = "home ";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> taps = [
    HomeScreen(),
    SearchScreen(),
    BrowseScreen(),
    WatchListScreen(),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: taps[index],
      bottomNavigationBar: Theme(

        data: Theme.of(context).copyWith(
            canvasColor: Colors.black54
        ),
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          selectedItemColor: Colors.yellow[900],
          currentIndex: index,
          onTap: (clicked){
            index = clicked;

            setState(() {

            });
          },

          items:  const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",

            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Search"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                label: "Browse"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.collections_bookmark),
                label: "WatchList"
            ),

          ],


        ),
      ),
    );
  }
}
