import 'package:get/get.dart';
import 'package:moko/presentation/pages/bottom_nav_bar/binding/bottom_nav_bar_binding.dart';
import 'package:moko/presentation/pages/bottom_nav_bar/bottom_nav_bar_page.dart';
import 'package:moko/presentation/pages/dashboard_screen/binding/dashboard_screen_binding.dart';
import 'package:moko/presentation/pages/dashboard_screen/dashboard_screen_page.dart';
import 'package:moko/presentation/pages/edit_profile_screen/binding/edit_profile_screen_binding.dart';
import 'package:moko/presentation/pages/edit_profile_screen/edit_profile_screen_page.dart';
import 'package:moko/presentation/pages/home_screen/binding/home_screen_binding.dart';
import 'package:moko/presentation/pages/home_screen/widget/live_stream.dart';
import 'package:moko/presentation/pages/movie_detail/movie_detail_screen_page.dart';
import 'package:moko/presentation/pages/sign_in/binding/sign_in_binding.dart';
import 'package:moko/presentation/pages/sign_in/sign_in_page.dart';
import 'package:moko/presentation/pages/sign_up/binding/sign_up_binding.dart';
import 'package:moko/presentation/pages/sign_up/sign_up_page.dart';

import '../presentation/pages/movie_detail/binding/movie_detail_screen_binding.dart';
import '../presentation/pages/splash/splash.dart';
import 'app_routes.dart';

class RoutingModule {
  List<GetPage> routingList = [
    GetPage(
      name: Routes.splashScreen,
      page:() => SplashScreen(),
      // binding: SplashBinding(),
      transition: Transition.fadeIn, // Example animation: Fade In
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: SignupBinding(),
      transition: Transition.fadeIn, // Example animation: Fade In
    ),
    GetPage(
      name: Routes.editProfileScreen,
      page: () => EditProfileScreen(),
      binding: EditProfileBinding(),
      transition: Transition.fadeIn, // Example animation: Fade In
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => DashBoardScreen(),
      binding: DashBoardBinding(),
      transition: Transition.fadeIn, // Example animation: Fade In
    ),
    GetPage(
      name: Routes.signInScreen,
      page: () => SignInScreen(),
      binding: SignInBinding(),
      transition: Transition.fadeIn, // Example animation: Fade In
    ),
    GetPage(
      name: Routes.movieDetail,
      page: () => MovieDetailScreen(),
      binding: MovieDetailBinding(),
      transition: Transition.fadeIn, // Example animation: Fade In
    ),
    GetPage(
      name: Routes.liveStream,
      page: () => LiveStreamScreen(),
      binding: HomeBinding(),
      transition: Transition.fadeIn, // Example animation: Fade In
    ),
    GetPage(
      name: Routes.bottomBar,
      page: () => BottomNavBarScreen(),
      binding: BottomNavBarBinding(),
      transition: Transition.fadeIn, // Example animation: Fade In
    ),
  ];
}
