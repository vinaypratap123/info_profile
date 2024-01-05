import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:info_profile/domain/entities/user/user_entity.dart';
import 'package:info_profile/presentation/cubit/credential/credential_cubit.dart';
import 'package:info_profile/presentation/utils/app_colors.dart';
import 'package:info_profile/presentation/utils/app_images.dart';
import 'package:info_profile/presentation/utils/app_strings.dart';
import 'package:info_profile/presentation/widgets/common_widgets/buttons/rectangle_button.dart';
import 'package:info_profile/presentation/widgets/common_widgets/text_fields/custom_text_form_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  bool _isSigningIn = false;
  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    aboutController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

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
                      AppString.signup,
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
                    height: height * 0.6,
                    width: width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextFormField(
                              hintText: AppString.enterYourName,
                              prefixIcon: const Icon(Icons.person_outlined),
                              controller: fullNameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your name";
                                }
                                return null;
                              }),
                          const Gap(15),
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
                              prefixIcon: const Icon(Icons.info_outline),
                              controller: aboutController,
                              hintText: "Enter your about",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your about";
                                }
                                return null;
                              }),
                          const Gap(15),
                          CustomTextFormField(
                              hintText: AppString.enterYourPassword,
                              isPasswordField: true,
                              prefixIcon: const Icon(Icons.lock_outlined),
                              controller: passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter password";
                                }
                                return null;
                              }),
                          const Gap(15),
                          RectangleButton(
                              btnName: AppString.signup,
                              btnCallBack: () {
                                _signup();
                              },
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
                  Navigator.pop(context);
                },
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: AppString.alreadyHavenAnAccount,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: AppString.login,
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

  void _signup() {
    setState(() {
      _isSigningIn = true;
    });
    BlocProvider.of<CredentialCubit>(context)
        .signUpUser(
            user: UserEntity(
          email: emailController.text,
          password: passwordController.text,
          about: aboutController.text,
          userName: fullNameController.text,
          totalFollowers: 0,
          totalFollowing: 0,
          totalPosts: 0,
          profileUrl: "",
          followers: const [],
          following: const [],
          website: "",
          name: "",
        ))
        .then((value) => _clear());
  }

  _clear() {
    setState(() {
      fullNameController.clear();
      emailController.clear();
      aboutController.clear();
      passwordController.clear();
      _isSigningIn = false;
    });
  }
}
