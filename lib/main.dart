import 'package:app_eclipseworks/app_module.dart';
import 'package:app_eclipseworks/app_widget.dart';
import 'package:app_eclipseworks/ui/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppTheme(await SharedPreferences.getInstance());

  runApp(ModularApp(
    module: AppModule(),
    child: AppWidget(),
  ));
}
