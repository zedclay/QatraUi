import 'package:flutter/cupertino.dart';
import 'package:qatra/Donor/home/homePage.dart';
import 'package:qatra/Donor/points/pointsPage.dart';
import 'package:qatra/Donor/profile/profilePage.dart';

class BaseController extends ChangeNotifier {
  int _selectedIndex = 0;

  List<Widget> widgetOptions = <Widget>[
    Homepage(),
    Pointspage(),
    ProfileDonorPage()
  ];

  int get selected {
    return _selectedIndex;
  }

  set selected(final int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
