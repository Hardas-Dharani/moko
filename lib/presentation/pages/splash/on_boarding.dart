import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moko/app/config/app_colors.dart';
import 'package:moko/presentation/pages/splash/start_page.dart';

import '../../../app/util/custom_button.dart';
import '../../../app/util/util.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/on_boarding.png',
      'title': 'Welcome to Moko',
      'description': 'Enjoy unlimited movies and TV shows on any device.'
    },
    {
      'image': 'assets/images/on_boarding.png',
      'title': 'Custom Profiles',
      'description':
          'Create and manage individual profiles for each family member.'
    },
    {
      'image': 'assets/images/on_boarding.png',
      'title': 'Download & Watch Offline',
      'description': 'Download your favorite shows and watch them offline.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    Utils.getImagePath("on_boarding"),
                  ))),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: onboardingData.length,
                  itemBuilder: (context, index) {
                    return buildOnboardingPage(onboardingData[index]);
                  },
                ),
              ),
              SizedBox(height: 24),
              buildPageIndicator(),
              SizedBox(height: 24),
              SizedBox(width: Get.width),
              CustomButton(
                borderBool: true,
                backGroundColor: AppColors.pinkColor,
                gradient: LinearGradient(
                    colors: [AppColors.pinkColor, AppColors.pinkColor]),
                onPressed: _currentPage == onboardingData.length - 1
                    ? () {
                        Get.to(StartPage());
                        // Handle the action when the user clicks on the "Get Started" button
                      }
                    : () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                child: Text(
                  _currentPage == onboardingData.length - 1
                      ? 'Get Started'
                      : 'Next',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOnboardingPage(Map<String, String> data) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image.asset(
          //   data['image']!,
          //   height: 200,
          //   width: 200,
          // ),
          SizedBox(height: 32),
          Text(
            data['title']!,
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            data['description']!,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[400], fontSize: 16),
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onboardingData.length,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          width: _currentPage == index ? 16 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: _currentPage == index
                ? AppColors.lightPurple
                : Colors.grey[500],
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
