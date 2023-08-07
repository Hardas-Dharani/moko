import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../app/services/network_binding.dart';
import '../routes/app_routes.dart';
import '../routes/app_routings.dart';
import 'pages/splash/splash.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final customFont = const TextStyle(fontFamily: 'Futura');
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        theme: ThemeData(
          textTheme: textTheme.apply(
            fontFamily: 'Futura', // Apply the custom font to the whole app
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialBinding: NetworkBinding(),
        initialRoute: Routes.splashScreen,
        home: SplashScreen(),
        getPages: RoutingModule().routingList,
      );
    });
  }
}
