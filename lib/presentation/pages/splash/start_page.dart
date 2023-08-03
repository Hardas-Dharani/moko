import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../app/config/app_colors.dart';
import '../../../app/extensions/color.dart';
import '../../../app/util/common_txt.dart';
import '../../../app/util/custom_button.dart';
import '../../../app/util/gradient_button.dart';
import '../../../app/util/scaffold_widget.dart';
import '../../../app/util/util.dart';
import '../../../routes/app_routes.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScafoldedWidget(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height * 0.13,
          ),
          Image.asset(
            Utils.getImagePath("couple_movie"),
            height: 230,
          ),
          // SvgPicture.asset(
          //   Utils.getSvgFilePath("i-connect-icon"),
          // ),
          SizedBox(
            height: Get.height * 0.04,
          ),
          // CommonText(
          //   text: 'Welcome to',
          //   fontSize: 21,
          //   color: AppColors.white,
          // ),

          CommonText(
            text: "Let's you In",
            fontSize: 26,
            weight: FontWeight.bold,
            color: AppColors.white,
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CustomButton(
              height: 40,
              onPressed: () {
                Get.toNamed(Routes.signInScreen);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Utils.getImagePath("signup_logo")),
                  SizedBox(
                    width: 30,
                  ),
                  CommonText(
                    text: "Create An Account",
                    fontSize: 12,
                    color: AppColors.white,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            CustomButton(
              height: 40,
              onPressed: () {
                Get.toNamed(Routes.signInScreen);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Utils.getImagePath("email_logo")),
                  SizedBox(
                    width: 30,
                  ),
                  CommonText(
                    text: "Sign In with Email    ",
                    fontSize: 12,
                    color: AppColors.white,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            CustomButton(
              height: 40,
              onPressed: () {
                Get.toNamed(Routes.signInScreen);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Utils.getImagePath("facebook_logo")),
                  SizedBox(
                    width: 20,
                  ),
                  CommonText(
                    text: "Sign In with Facebook",
                    fontSize: 12,
                    color: AppColors.white,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            CustomButton(
              onPressed: () {
                Get.toNamed(Routes.signInScreen);
              },
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Utils.getImagePath("gmail_logo")),
                  SizedBox(
                    width: 30,
                  ),
                  CommonText(
                    text: "Sign In with Gmail",
                    fontSize: 12,
                    color: AppColors.white,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Divider(
                  height: 2,
                  thickness: 4,
                  color: AppColors.white,
                ),
                CommonText(
                  text: " Or ",
                  fontSize: 14,
                  color: AppColors.white,
                ),
                Divider(
                  height: 2,
                  thickness: 4,
                  color: AppColors.white,
                )
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            CustomButton(
              borderBool: true,
              backGroundColor: AppColors.pinkColor,
              gradient: LinearGradient(
                  colors: [AppColors.pinkColor, AppColors.pinkColor]),
              onPressed: () {},
              child: Text(
                'Sign In',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(
                  text: "Don't have an account? ",
                  color: AppColors.white,
                  fontSize: 12,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.signInScreen);
                  },
                  child: CommonText(
                    text: "Sign up",
                    color: AppColors.blue,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ])
        ],
      ),
    );
  }
}
