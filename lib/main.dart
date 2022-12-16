import 'package:doctor_system/service/dio_helper.dart';
import 'package:doctor_system/service/local/sp_helper.dart';
import 'package:doctor_system/src/app_root.dart';
import 'package:flutter/cupertino.dart';

main() {
  DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefrenceHelper.init();
  runApp(AppRoot());
}
