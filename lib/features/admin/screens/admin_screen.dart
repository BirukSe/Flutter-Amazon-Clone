import 'package:e_comm/constants/global_variables.dart';
import 'package:e_comm/features/admin/screens/posts_screen.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      PostsScreen(),
      Center(child: Text('Analytics Page')),
      Center(child: Text('Cart Page'))
    ];

    void updatePage(int page) {
      setState(() {
        print('dfd');
        print(page);
        _page = page;
      });
    }

    double bottomBarWidth = 42;
    double bottomBar = 5;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
              flexibleSpace: Container(
                decoration:
                    BoxDecoration(gradient: GlobalVariables.appBarGradient),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      child: Image.asset('assets/images/amazon_in.png',
                          width: 120, height: 45, color: Colors.black)),
                  Text('Admin',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black))
                ],
              ))),
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
                    child: Icon(Icons.analytics_outlined))),
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
                    child: Icon(Icons.all_inbox_outlined))),
          ]),
    );
  }
}
