import 'package:flutter/material.dart';

import '../screen/favorites_page.dart';
import '../screen/my_home_page.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPageIndex = 0; // stato dello stateful widget

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getNavigationPage(currentPageIndex),
      bottomNavigationBar: NavigationBar(
         onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.favorite),
            icon: Badge(child: Icon(Icons.favorite_border)),
            label: 'Favorite',
          ),
          NavigationDestination(
            selectedIcon: Badge(
              child: Icon(Icons.messenger_sharp),
              label: Text('2'),
            ),
            icon: Badge(
              child: Icon(Icons.messenger_outline),
              label: Text('2'),
            ),
            label: 'page 3',
          ),
        ],
      ),
    );
  }


  // Dato l'index ottieni un widget(le pagine da visualizzare) 
  Widget getNavigationPage(int index) {

    if(index == 0) {
      return MyHomePage();
    } else if(index == 1) {
      return FavoritePage();
    } else {
      return SafeArea(child: Container(child: Text("No page for this index")));
    }
  }
}