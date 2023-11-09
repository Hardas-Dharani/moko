import 'package:get/get.dart';
import 'package:moko/presentation/pages/add_playlist/add_playlist_page.dart';
import 'package:moko/presentation/pages/add_playlist/binding/add_playlist_binding.dart';
import 'package:moko/presentation/pages/bottom_nav_bar/binding/bottom_nav_bar_binding.dart';
import 'package:moko/presentation/pages/bottom_nav_bar/bottom_nav_bar_page.dart';
// import 'package:moko/presentation/pages/change_password_screen/binding/edit_profile_screen_binding.dart';
// import 'package:moko/presentation/pages/change_password_screen/change_password_page.dart';
import 'package:moko/presentation/pages/creater_screen/binding/creater_screen_binding.dart';
import 'package:moko/presentation/pages/creater_screen/creater_screen_page.dart';
import 'package:moko/presentation/pages/dashboard_screen/binding/dashboard_screen_binding.dart';
import 'package:moko/presentation/pages/dashboard_screen/dashboard_screen_page.dart';
import 'package:moko/presentation/pages/dashboard_screen_user/binding/dashboard_screen_user_binding.dart';
import 'package:moko/presentation/pages/dashboard_screen_user/dashboard_screen_user_page.dart';
import 'package:moko/presentation/pages/edit_profile_screen/binding/edit_profile_screen_binding.dart';
import 'package:moko/presentation/pages/edit_profile_screen/edit_profile_screen_page.dart';
import 'package:moko/presentation/pages/edit_video_screen/binding/edit_video_screen_binding.dart';
import 'package:moko/presentation/pages/home_screen/binding/home_screen_binding.dart';
import 'package:moko/presentation/pages/home_screen/widget/live_stream.dart';
import 'package:moko/presentation/pages/movie_detail/movie_detail_screen_page.dart';
import 'package:moko/presentation/pages/my_channel_screen/binding/my_channel_binding.dart';
import 'package:moko/presentation/pages/my_channel_screen/my_channel_page.dart';
import 'package:moko/presentation/pages/related_movie_detail/releted_movie_detail_screen_page.dart';
import 'package:moko/presentation/pages/sign_in/binding/sign_in_binding.dart';
import 'package:moko/presentation/pages/sign_in/sign_in_page.dart';
import 'package:moko/presentation/pages/sign_up/binding/sign_up_binding.dart';
import 'package:moko/presentation/pages/sign_up/sign_up_page.dart';
import 'package:moko/presentation/pages/update_video_screen/binding/update_video_screen_binding.dart';
import 'package:moko/presentation/pages/update_video_screen/update_video_screen_page.dart';
import 'package:moko/presentation/pages/user_video_lst/binding/user_video_lst_binding.dart';
import 'package:moko/presentation/pages/user_video_lst/user_video_lst_screen.dart';

import '../presentation/pages/edit_video_screen/edit_video_screen_page.dart';
import '../presentation/pages/movie_detail/binding/movie_detail_screen_binding.dart';
import '../presentation/pages/my_playlist_playlist/binding/my_playlist_binding.dart';
import '../presentation/pages/my_playlist_playlist/my_playlist_page.dart';
import '../presentation/pages/related_movie_detail/binding/related_movie_detail_screen_binding.dart';
import '../presentation/pages/splash/splash.dart';
import 'app_routes.dart';

class RoutingModule {
  List<GetPage> routingList = [
    GetPage(
      name: Routes.splashScreen,
      page: () => SplashScreen(),
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
      name: Routes.dashBoardUserScreen,
      page: () => DashBoardScreenUser(),
      binding: DashBoardScreenUserBinding(),
      transition: Transition.fadeIn, // Example animation: Fade In
    ),
    GetPage(
      name: Routes.createrScreen,
      page: () => CreaterScreen(),
      binding: CreaterBinding(),
      transition: Transition.fadeIn, // Example animation: Fade In
    ),
    GetPage(
      name: Routes.editProfileScreen,
      page: () => EditProfileScreen(),
      binding: EditProfileBinding(),
      transition: Transition.fadeIn, // Example animation: Fade In
    ),
    GetPage(
      name: Routes.editVideoScreen,
      page: () => EditVideoScreen(),
      binding: EditVideoBinding(),
      transition: Transition.fadeIn, // Example animation: Fade In
    ),
    GetPage(
      name: Routes.updateVideo,
      page: () => UpdateVideoScreen(),
      binding: UpdateVideoBinding(),
      transition: Transition.fadeIn, // Example animation: Fade In
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => DashBoardScreen(),
      binding: DashBoardBinding(),
      transition: Transition.fadeIn, // Example animation: Fade In
    ),
    GetPage(
      name: Routes.videoLst,
      page: () => UserVideoLstScreen(),
      binding: UserVideoLstScreenBinding(),
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
      name: Routes.addPlayList,
      page: () => AddPlayListScreen(),
      binding: AddPlayListBinding(),
      transition: Transition.fadeIn, // Example animation: Fade In
    ),
    GetPage(
      name: Routes.myPlayList,
      page: () => MyPlayListScreen(),
      binding: MyPlayListBinding(),
      transition: Transition.fadeIn, // Example animation: Fade In
    ),
    GetPage(
      name: Routes.myChannel,
      page: () => MyChannelScreen(),
      binding: MyChannelBinding(),
      transition: Transition.fadeIn, // Example animation: Fade In
    ),
    GetPage(
      name: Routes.relatedMovieDetail,
      page: () => ReleatedMovieDetailScreen(),
      binding: ReleatedMovieDetailBinding(),
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
