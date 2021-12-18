import 'package:bacakuy_app/app/data/preferences/preferences_helper.dart';
import 'package:bacakuy_app/app/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreferencesProvider extends ChangeNotifier{
  PreferencesHelper preferencesHelper;
  PreferencesProvider({required this.preferencesHelper}){
    _getTheme();
  }

  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;
  ThemeData get themeData => _isDarkTheme ? darkTheme : lightTheme;

  void _getTheme() async{
    _isDarkTheme = await preferencesHelper.isDarkTheme;
    notifyListeners();
  }

  void enableDarkTheme(bool enable){
    preferencesHelper.setDarkTheme(enable);
    _getTheme();
  }

}