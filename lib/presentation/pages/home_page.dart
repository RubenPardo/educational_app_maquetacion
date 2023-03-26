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
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(),
      body: 
           <Widget>[
              const DiscoverPage(),
              const SearchPage(),
              const Center(child: Text("Favoritos"),),
              const Center(child: Text("Profile"),),
            ][_currentPageIndex],
        
    );
  }

  Widget _bottomNavigationBar(){
    return NavigationBar(
      // TODO como hacer transparencia en el navigation bar
      // TODO como quitar el color de fondo del icono
      backgroundColor: AppColors.bottomColor,
      onDestinationSelected: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        selectedIndex: _currentPageIndex,
      destinations: const [
        NavigationDestination(
            selectedIcon: Icon(Icons.explore, color: Colors.white,),
            icon: Icon(Icons.explore, color: AppColors.iconColor,),
            label: 'Discover',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.search, color: Colors.white,),
            icon: Icon(Icons.search, color: AppColors.iconColor,),
            label: 'Search',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.favorite, color: Colors.white,),
            icon: Icon(Icons.favorite, color: AppColors.iconColor,),
            label: 'Favorites',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person, color: Colors.white,),
            icon: Icon(Icons.person, color: AppColors.iconColor,),
            label: 'Profile',
          ),
      ],
    );
  }

}