import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{

  static SharedPreferences? sharedPreferences;
  static init()async{
    sharedPreferences =await SharedPreferences.getInstance();
  }
  
  static Future<bool?> putData({@required String? key, @required bool? value})async{
    await sharedPreferences!.setBool(key!, value!);
  }

  static bool? getData({@required String? key}){
     sharedPreferences!.getBool(key!);
  }
  
}