import 'package:app_eclipseworks/data/services/apod_api.dart';
import 'package:app_eclipseworks/data/shared_preferences_service.dart';
import 'package:app_eclipseworks/data/services/apod_remote_api.dart';
import 'package:app_eclipseworks/data/custom_dio.dart';
import 'package:app_eclipseworks/ui/main_page/view_model/main_view_models.dart';
import 'package:app_eclipseworks/ui/favorites_page/view_model/favorite_view_model.dart';
import 'package:app_eclipseworks/ui/favorites_page/favorites_page.dart';
import 'package:app_eclipseworks/ui/main_page/main_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add<Dio>(Dio.new);
    i.addSingleton<CustomDio>(CustomDio.new);
    i.addSingleton<ApodApi>(ApodApiImpl.new);
    i.addSingleton(MainViewModel.new);
    i.addSingleton(ApodFavoritesViewModel.new);
    i.addSingleton(SharedPreferencesService.new);
  }

  @override
  void routes(r) {
    r.child(AppRoutes.initial, child: (context) => MainPage());
    r.child(AppRoutes.favorites, child: (context) => FavoritesPage());
  }
}

class AppRoutes {
  static const initial = '/';
  static const favorites = '/favorites';
}
