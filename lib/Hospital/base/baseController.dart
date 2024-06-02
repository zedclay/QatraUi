import 'package:flutter/cupertino.dart';
import 'package:qatra/Hospital/find%20doner/findDoner.dart';
import 'package:qatra/Hospital/home/homePage.dart';
import 'package:qatra/Hospital/profil/profilePage.dart';

class BaseController extends ChangeNotifier {
  int _selectedIndex = 0;

  List<Widget> widgetOptions = <Widget>[
    Homepage(),
    FindDonor(),
    ProfileHospitalPage(),
  ];

  int get selected {
    return _selectedIndex;
  }

  set selected(final int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
