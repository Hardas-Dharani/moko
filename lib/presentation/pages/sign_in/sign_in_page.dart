import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moko/app/util/util.dart';
import '../../../app/config/app_colors.dart';
import '../../../app/util/common_txt.dart';
import '../../../app/util/custom_button.dart';
import '../../../app/util/custom_txt_field.dart';
import '../../../app/util/scaffold_widget.dart';
import '../../../app/util/term_check_box.dart';
import '../../../routes/app_routes.dart';
import 'controller/sign_in_controller.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ScafoldedWidget(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height * 0.3,
          ),

          // CommonText(
          //   text: 'Welcome to',
          //   fontSize: 21,
          //   color: AppColors.white,
          // ),

          CommonText(
            text: "Sign In To Continue",
            fontSize: 26,
            weight: FontWeight.bold,
            color: AppColors.white,
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),

          CustomTextField(
            height: 40,
            controller: TextEditingController(),
            hintText: 'info@yourdomain.com',
            prefixIcon: Image.asset(Utils.getImagePath("mail_icon")),
            // suffixIconData: Icons.clear,
            obscureText: false,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            style: TextStyle(color: AppColors.white, fontSize: 12),
            // maxLines: 1,
            onSubmitted: (value) {
              // Handle the submitted value here if needed.
            },
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          CustomTextField(
            height: 40,
            controller: TextEditingController(),
            hintText: 'Password',
            prefixIcon: Image.asset(Utils.getImagePath("lock_icon")),

            // suffixIconData: Icons.clear,
            obscureText: false,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            style: TextStyle(color: AppColors.white, fontSize: 12),
            // maxLines: 1,
            onSubmitted: (value) {
              // Handle the submitted value here if needed.
            },
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  fillColor: MaterialStatePropertyAll(AppColors.pinkColor),
                  checkColor: AppColors.white,
                  shape: CircleBorder(),
                  value: false,
                  onChanged: (bool? value) {},
                ),
                CommonText(
                  text: "Remember Me",
                  fontSize: 12,
                  color: AppColors.white,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextButton(
                onPressed: () {},
                child: CommonText(
                  text: "Forgot Password?",
                  color: AppColors.white,
                  fontSize: 12,
                )),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          AcceptTermsAndPrivacyText(
            isChecked: true, // Set the initial state of the checkbox
            onChanged: (value) {
              // Handle the checkbox state changes here if needed
            },
            onTermsPressed: () {
              // Handle the terms and conditions action here
            },
            onPrivacyPressed: () {
              // Handle the privacy policy action here
            },
          ),
          SizedBox(
            height: Get.height * 0.08,
          ),
          CustomButton(
            borderBool: true,
            backGroundColor: AppColors.pinkColor,
            gradient: LinearGradient(
                colors: [AppColors.pinkColor, AppColors.pinkColor]),
            onPressed: () {
              Get.toNamed(Routes.bottomBar);
            },
            child: Text(
              'Sign In',
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(
            height: Get.height * 0.07,
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
                  Get.toNamed(Routes.signUpScreen);
                },
                child: CommonText(
                  text: "Sign Up",
                  color: AppColors.blue,
                  fontSize: 12,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
