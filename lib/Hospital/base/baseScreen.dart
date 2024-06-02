import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:qatra/Hospital/base/baseController.dart';
import 'package:qatra/theme/app_dark_theme.dart';

class baseHospitalScreen extends StatefulWidget {
  const baseHospitalScreen({Key? key}) : super(key: key);

  @override
  State<baseHospitalScreen> createState() => _baseHospitalScreenState();
}

class _baseHospitalScreenState extends State<baseHospitalScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.grey[200], // Status bar color
      statusBarIconBrightness: Brightness.dark, // Icon brightness
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BaseController>(
          create: (context) => BaseController(),
        ),
      ],
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBarWidget(), // Custom AppBar
          body: Consumer<BaseController>(
            builder: (context, baseController, child) =>
                baseController.widgetOptions[baseController.selected],
          ),
          bottomNavigationBar: BottomNavigationBarTheme(
            data: AppDarkTheme().bottomNavigationBarThemeData,
            child: buildBottomNavBar(),
          ),
          drawer: buildDrawer(), // Custom Drawer
        ),
      ),
    );
  }

  Widget buildBottomNavBar() {
    return Consumer<BaseController>(
      builder: (context, baseController, child) => SalomonBottomBar(
        currentIndex: baseController.selected,
        onTap: (index) {
          baseController.selected = index;
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            selectedColor: Color(0xffC93636),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.local_hospital),
            title: Text('Find Donor'),
            selectedColor: Colors.blue,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
            selectedColor: Color.fromARGB(255, 45, 169, 18),
          ),
        ],
      ),
    );
  }

  Widget buildDrawer() {
    return Drawer(
      backgroundColor: Color(0xffF45151), // Drawer background color
      child: Consumer<BaseController>(
        builder: (context, baseController, child) {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Color(0xffF45151)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/blu.png',
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ],
                ),
              ),
              buildDrawerItem(
                context,
                Icons.account_balance,
                'Home',
                0,
                baseController,
              ),
              buildDrawerItem(
                context,
                Icons.bloodtype,
                'Find Doner',
                1,
                baseController,
              ),
              buildDrawerItem(
                context,
                Icons.person,
                'Profile',
                2,
                baseController,
              ),
              buildDrawerItem(
                context,
                Icons.people_alt_rounded,
                'Investors',
                2,
                baseController,
              ),
              Divider(color: Colors.white),
              buildDrawerItem(
                context,
                Icons.settings,
                'Settings',
                3,
                baseController,
              ),
              buildDrawerItem(
                context,
                Icons.logout,
                'Log out',
                4,
                baseController,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildDrawerItem(BuildContext context, IconData icon, String title,
      int index, BaseController baseController) {
    return ListTile(
      leading: Icon(
        icon,
        color:
            baseController.selected == index ? Colors.blue[400] : Colors.white,
        size: 40,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: baseController.selected == index
              ? Colors.blue[400]
              : Colors.white,
        ),
      ),
      onTap: () {
        baseController.selected = index;
        Navigator.pop(context); // Close the drawer
      },
    );
  }
}

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      elevation: 0,
      backgroundColor: Colors.grey[200], // Match status bar color
      title: Center(
        child: Image.asset(
          'assets/images/logo.png', // Replace with your logo image path
          height: 80.0, // Adjust height as needed
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications, color: Colors.black),
          onPressed: () {
            // Notification icon functionality
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
