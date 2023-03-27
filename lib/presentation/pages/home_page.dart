import 'package:educational_app_maquetacion/presentation/pages/discover_page.dart';
import 'package:educational_app_maquetacion/presentation/pages/search_page.dart';
import 'package:educational_app_maquetacion/shared/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentPageIndex = 0;

  
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).padding.bottom);
    return Scaffold(
      // Si lo pongo aqui no se aplica la transparencia
      //bottomNavigationBar: _bottomNavigationBar(),
      body: Stack(
        children: [
           Align(
            alignment: Alignment.topCenter,
            child: <Widget>[
              const DiscoverPage(),
              const SearchPage(),
              const Center(child: Text("Favoritos"),),
              const Center(child: Text("Profile"),),
            ][_currentPageIndex],
           ),
           
           // si lo aplico aqui no se ve todo el contenido por como funciona el stack
           Align(
            alignment: Alignment.bottomCenter,
            child: _bottomNavigationBar(),
           )
        ],
      )
    );
  }

  Widget _bottomNavigationBar(){
    return  BottomNavigationBar(
        iconSize: 24,
        selectedItemColor: AppColors.textColorTag,
        unselectedItemColor: AppColors.textColor,
        currentIndex: _currentPageIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.bottomColor.withOpacity(0.9),
        onTap: (int index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
        items: [
          BottomNavigationBarItem(
              
              icon: Image.asset('assets/images/discover_icon.png',),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/search_icon.png'),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              
              icon: Image.asset('assets/images/fav_icon.png'),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              
              icon: Image.asset('assets/images/profile_icon.png'),
              label: 'Profile',
            ),
        ],

    );
  }

}