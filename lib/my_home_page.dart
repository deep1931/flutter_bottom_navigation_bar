import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation_bar/tabs/about_tab.dart';
import 'package:flutter_bottom_navigation_bar/tabs/category_tab.dart';
import 'package:flutter_bottom_navigation_bar/tabs/home_tab.dart';
import 'package:flutter_bottom_navigation_bar/tabs/notification_tab.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Widget> screensList=[HomeTab(),CategoryTab(),NotificationTab(),AboutTab()];

  int currentIndex=0;

  void onTapSelected(index)
  {
    setState(() {
      currentIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(currentIndex==0?'Home Tab':currentIndex==1?'Category Tab':'Notification Tab'),),
     bottomNavigationBar: BottomNavigationBar(

       currentIndex: currentIndex,
       onTap: (index){
         onTapSelected(index);
       },

       type: BottomNavigationBarType.fixed,

       unselectedFontSize: 12,
       selectedFontSize: 16,
       unselectedItemColor: Colors.red,
       selectedItemColor: Colors.blue,
       showUnselectedLabels: true,
       showSelectedLabels: true,

       items: [
         BottomNavigationBarItem(
           title: Text('Home'),
           icon: Icon(Icons.home),
           activeIcon: Icon(Icons.add_to_home_screen)
         ),
         BottomNavigationBarItem(
             title: Text('Category'),
             icon: Icon(Icons.category),
             activeIcon: Icon(Icons.control_point_duplicate)

         ),
         BottomNavigationBarItem(
             title: Text('Notifications'),
             icon: Icon(Icons.notifications),
             activeIcon: Icon(Icons.dashboard)

         ),

         BottomNavigationBarItem(
             title: Text('About'),
             icon: Icon(Icons.info_outline
         ),)

       ],
     ),
        body: Container(

          child: screensList[currentIndex],

        ));


  }
}
