// app_bar_util.dart
import 'package:flutter/material.dart';

class AppBarUtil {
  static AppBar buildAppBar(BuildContext context) {
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
      backgroundColor: Colors.grey[200],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png', // Replace with your logo image path
            height: 80.0, // Adjust the height as needed
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {
            // Add your notification icon functionality here
          },
        ),
      ],
    );
  }
}
