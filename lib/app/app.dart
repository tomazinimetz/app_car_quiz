import 'package:app/app/providers.dart';
import 'package:app/domain/splash/splash_route.dart';
import 'package:app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: Providers.all(),
        child: AppContainer(),
      );
}

class AppContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: Routes.all(),
        initialRoute: SplashRoute.name,
      );
}
