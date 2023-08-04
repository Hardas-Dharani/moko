import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moko/app/config/app_colors.dart';
import 'package:moko/app/util/common_txt.dart';
import 'package:moko/presentation/pages/explore_screen/explore_screen_page.dart';
import '../../../app/util/util.dart';
import '../edit_profile_screen/edit_profile_screen_page.dart';
import '../home_screen/home_screen_page.dart';
import 'controller/bottom_nav_bar_controller.dart';

class BottomNavBarScreen extends GetView<BottomNavBarController> {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 66),
        child: AppBar(
          leading: IconButton(
              onPressed: () {
                controller.scaffoldKey.currentState!.openDrawer();
              },
              icon: Image.asset(Utils.getImagePath("menu"))),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border))
          ],
          title: Image.asset(
            Utils.getImagePath("logo"),
            width: 108,
            height: 250,
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [AppColors.pinkColor, AppColors.lightPurple],
              ),
            ),
          ),
        ),
      ),
      body: GetBuilder<BottomNavBarController>(
        initState: (v) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {});
        },
        builder: (value) {
          return WillPopScope(
            child: Stack(
              children: [
                buildScreen(value.currentItem),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          canvasColor: AppColors.black.withOpacity(0.2)),
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: BottomNavigationBar(
                          selectedItemColor: AppColors.pinkColor,
                          unselectedItemColor: Colors
                              .white, // Set unselected label color to white
                          type: BottomNavigationBarType.fixed,
                          showUnselectedLabels: true,
                          selectedLabelStyle: TextStyle(color: AppColors.white),
                          unselectedLabelStyle:
                              TextStyle(color: AppColors.white),
                          unselectedIconTheme:
                              IconThemeData(color: AppColors.white),
                          // backgroundColor: Colors.transparent,
                          elevation:
                              1, // Set elevation to 0 to remove any shadows added by BottomNavigationBar
                          currentIndex: BottomNavigationItem.values
                              .indexOf(value.currentItem),
                          onTap: (index) {
                            final item = BottomNavigationItem.values[index];
                            value.changeCurrentItem(item);
                          },
                          items: [
                            BottomNavigationBarItem(
                              label: 'HOME',
                              icon: Icon(Icons.home_outlined),
                            ),
                            BottomNavigationBarItem(
                              label: 'EXPLORE',
                              icon: Icon(Icons.search_outlined),
                            ),
                            BottomNavigationBarItem(
                              label: 'MY LIST',
                              icon: Icon(Icons.bookmark_outline_outlined),
                            ),
                            BottomNavigationBarItem(
                              label: 'PROFILE',
                              icon: Icon(Icons.person_2_outlined),
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
            onWillPop: () async {
              return false;
            },
          );
        },
      ),
      // bottomNavigationBar:
      drawer: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: AppColors.black.withOpacity(0.2)),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  decoration:
                      BoxDecoration(color: AppColors.black.withOpacity(0.5)),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzF7xJ5l0YlkeFb-85hvKDGbnBMprT8P8HL5t-ctDH&s'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'John Doe',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'john.doe@example.com',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  )),
              for (Map<String, dynamic> drawerItem in [
                {'label': 'Home', 'icon': Icons.home_outlined},
                {'label': 'My Wish Lists', 'icon': Icons.list},
                {'label': 'TV Shows', 'icon': Icons.tv},
                {'label': 'Movies', 'icon': Icons.movie},
                {'label': 'Live Streaming Profile', 'icon': Icons.live_tv},
                {'label': 'Settings', 'icon': Icons.settings},
                {'label': 'Sign Out', 'icon': Icons.logout},
              ])
                ListTile(
                  leading: Icon(
                    drawerItem['icon'],
                    color: AppColors.white,
                  ),
                  title: Text(
                    drawerItem['label'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    // Handle onTap action for each drawer item
                    Navigator.pop(context);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildScreen(BottomNavigationItem item) {
    switch (item) {
      case BottomNavigationItem.Home:
        // Get.put(HomeController());
        return HomeScreen();
      case BottomNavigationItem.explore:
        // Get.put(ConnectionController());
        return ExploreScreen();
      case BottomNavigationItem.mywishlist:
        // controller.hasNewNotification = false;
        return Screen3();
      case BottomNavigationItem.profile:
        // Get.put(ChatController());
        return EditProfileScreen();

      default:
        return Container();
    }
  }
}

// Rest of the screen widgets remain the same

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: Text('Screen 1', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: Text('Screen 2', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: Text('Screen 3', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: Text('Screen 4', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
