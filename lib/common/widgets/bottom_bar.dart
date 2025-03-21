import 'package:e_comm/constants/global_variables.dart';
import 'package:e_comm/features/account/screens/account_screen.dart';
import 'package:e_comm/features/auth/screens/home_screen.dart';
import 'package:e_comm/features/cart/screens/cart_screen.dart';
import 'package:e_comm/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actualHome';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<Widget> pages = [HomeScreen(), AccountScreen(), CartScreen()];
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBar = 5;
  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          selectedItemColor: GlobalVariables.selectedNavBarColor,
          unselectedItemColor: GlobalVariables.unselectedNavBarColor,
          backgroundColor: GlobalVariables.backgroundColor,
          iconSize: 20,
          onTap: updatePage,
          items: [
            BottomNavigationBarItem(
                label: '',
                icon: Container(
                    width: bottomBarWidth,
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                color: _page == 0
                                    ? GlobalVariables.selectedNavBarColor
                                    : GlobalVariables.backgroundColor,
                                width: bottomBar))),
                    child: Icon(Icons.home_outlined))),
            BottomNavigationBarItem(
                label: '',
                icon: Container(
                    width: bottomBarWidth,
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                color: _page == 1
                                    ? GlobalVariables.selectedNavBarColor
                                    : GlobalVariables.backgroundColor,
                                width: bottomBar))),
                    child: Icon(Icons.person_outline_outlined))),
            BottomNavigationBarItem(
                label: '',
                icon: Container(
                    width: bottomBarWidth,
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                color: _page == 2
                                    ? GlobalVariables.selectedNavBarColor
                                    : GlobalVariables.backgroundColor,
                                width: bottomBar))),
                    child: badges.Badge(
                      badgeContent: Text(userCartLen.toString()),
                      child: Icon(Icons.shopping_cart_outlined),
                    )))
          ]),
    );
  }
}
