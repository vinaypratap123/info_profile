import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:info_profile/presentation/routes/routes_name.dart';
import 'package:info_profile/presentation/utils/app_colors.dart';
import 'package:info_profile/presentation/utils/app_images.dart';
import 'package:info_profile/presentation/utils/app_strings.dart';
import 'package:info_profile/presentation/widgets/common_widgets/buttons/rectangle_button.dart';
import 'package:info_profile/presentation/widgets/common_widgets/text_fields/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: height,
              color: AppColor.white,
            ),
            Positioned(
              child: Container(
                height: height * 0.4,
                color: AppColor.primaryColor,
              ),
            ),
            Positioned(
                top: 60,
                left: width * 0.15,
                right: width * 0.15,
                child: SizedBox(
                    height: 60,
                    width: 250,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 60,
                            child: Image.asset(AppImage.circleLogo)),
                        SizedBox(
                            height: 40,
                            width: 200,
                            child: Image.asset(
                              AppImage.whiteNameLogo,
                              fit: BoxFit.cover,
                            )),
                      ],
                    ))),
            Positioned(
                top: 140,
                left: width * 0.05,
                right: width * 0.05,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppString.login,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: AppColor.white),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      AppString
                          .enterEmailAddressPhoneNumberAndPasswordToRegisterYourselfAsANewUser,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor.white),
                    )
                  ],
                )),
            Positioned(
                top: height * 0.3,
                left: width * 0.05,
                right: width * 0.05,
                child: Card(
                  elevation: 2,
                  surfaceTintColor: AppColor.white,
                  child: SizedBox(
                    height: height * 0.5,
                    width: width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextFormField(
                              prefixIcon: const Icon(Icons.email_outlined),
                              controller: emailController,
                              hintText: AppString.enterYourEmail,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your email";
                                }
                                return null;
                              }),
                          const Gap(15),
                          CustomTextFormField(
                              isPasswordField: true,
                              prefixIcon: const Icon(Icons.lock_outlined),
                              controller: passwordController,
                              hintText: AppString.enterYourPassword,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter password";
                                }
                                return null;
                              }),
                          const Gap(15),
                          RectangleButton(
                              btnName: AppString.login,
                              btnCallBack: () {},
                              height: 55,
                              width: width * 0.9)
                        ],
                      ),
                    ),
                  ),
                )),
            Positioned(
              left: width * 0.2,
              right: width * 0.2,
              bottom: height * 0.1,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.signup);
                },
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: AppString.donNotHaveAnAccount,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: AppString.signup,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
