import 'package:flutter/material.dart';
import 'package:les_vagues/pages/ajout_page.dart';
import 'package:les_vagues/pages/auth_page.dart';
import 'package:les_vagues/pages/home_page.dart';
import 'package:les_vagues/pages/search_page.dart';
import 'package:les_vagues/widgets/bottom_nav.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = List.generate(
    4,
    (_) => GlobalKey<NavigatorState>(),
  );

  void _onItemTapped(int index) {
    if (_selectedIndex == index) {
      _navigatorKeys[index].currentState!.popUntil((route) => route.isFirst);
    }else{
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex, 
        children: [
          _buildNavigator(0, const MyHomePage(title: 'Les Vagues')),
          _buildNavigator(1, const SearchPage(title: 'Les Vagues')),
          _buildNavigator(2, const AjoutSpotPage()),
          _buildNavigator(3, const AuthPage(title: 'Les Vagues')),
        ],
      ),
      bottomNavigationBar: MyBottomNav(
        currentIndex: _selectedIndex, 
        onTap: _onItemTapped,
        isLoggedIn: true,
      ),  
    );
  }

  Widget _buildNavigator(int index, Widget child) {
    return Navigator(
      key: _navigatorKeys[index],
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => child,
        );
      },
    );
  }
}


