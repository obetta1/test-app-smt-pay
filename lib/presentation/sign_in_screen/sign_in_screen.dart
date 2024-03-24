import 'package:smart_pay_app/core/utils/validation_functions.dart';

import '../../domain/repository/repository.dart';
import '../../domain/usecase/login_usecase.dart';
import 'models/sign_in_filled_model.dart';
import 'package:flutter/material.dart';
import 'package:smart_pay_app/core/app_export.dart';
import 'bloc/sign_in_bloc.dart';

// ignore_for_file: must_be_immutable
class SignInFilledScreen extends StatelessWidget {
  SignInFilledScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _sformKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(
            InitLoginState(signInFilledModelObj: SignInFilledModel()),
            LoginUseCase(repository: Repository()),
            context)
          ..add(InitLoginEvent()),
        child: SignInFilledScreen());
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _sformKey,
                        child: Container(
                            height: SizeUtils.height - 120.h,
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.h, vertical: 31.v),
                            child: Column(children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("lbl_hi_there".tr,
                                      style: theme.textTheme.headlineSmall)),
                              SizedBox(height: 14.v),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("msg_welcome_back_sign".tr,
                                      style: theme.textTheme.bodyLarge)),
                              SizedBox(height: 32.v),
                              CustomTextFormField(
                                controller: emailController,
                                hintText: "lbl_email".tr,
                                textInputType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidEmail(value,
                                          isRequired: true))) {
                                    return "err_msg_please_enter_valid_email"
                                        .tr;
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16.v),
                              BlocBuilder<LoginBloc, LoginState>(
                                  builder: (context, state) {
                                return CustomTextFormField(
                                    hintText: "lbl_password".tr,
                                    controller: passwordController,
                                    textInputAction: TextInputAction.done,
                                    suffix: InkWell(
                                        onTap: () {
                                          context.read<LoginBloc>().add(
                                              ChangePasswordVisibilityEvent(
                                                  value: true));
                                        },
                                        child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                30.h, 16.v, 16.h, 16.v),
                                            child: CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgEyeoff,
                                                height: 24.adaptSize,
                                                width: 24.adaptSize))),
                                    suffixConstraints:
                                        BoxConstraints(maxHeight: 56.v),
                                    validator: (value) {
                                      if (value == null ||
                                          (!isValidPassword(value,
                                              isRequired: true))) {
                                        return "incorrect Password";
                                      }
                                      return null;
                                    });
                                //obscureText: state.isShowPassword);
                              }),
                              SizedBox(height: 27.v),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: GestureDetector(
                                      onTap: () {},
                                      child: Text("msg_forgot_password".tr,
                                          style: CustomTextStyles
                                              .titleMediumCyan900))),
                              SizedBox(height: 24.v),
                              BlocBuilder<LoginBloc, LoginState>(
                                builder: (context, state) {
                                  return CustomElevatedButton(
                                    text: "lbl_sign_in".tr,
                                    onPressed: () {
                                      if (_sformKey.currentState!.validate()) {
                                        context.read<LoginBloc>().add(
                                            UserLogInEvent(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text));
                                      }
                                    },
                                  );
                                },
                              ),
                              SizedBox(height: 33.v),
                              _buildOr(context),
                              SizedBox(height: 26.v),
                              _buildButtonSocial(context),
                              Spacer(),
                              SizedBox(height: 11.v),
                              GestureDetector(
                                  onTap: () {
                                    onTapTxtDonthaveanaccount(context);
                                  },
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                "msg_don_t_have_an_account2".tr,
                                            style: CustomTextStyles
                                                .bodyLargeff6b7280),
                                        TextSpan(
                                            text: "lbl_sign_up".tr,
                                            style: CustomTextStyles
                                                .titleMediumff0a6375)
                                      ]),
                                      textAlign: TextAlign.left))
                            ])))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 90,
        leadingWidth: double.maxFinite,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 24.h, right: 311.h),
            onTap: () {
              onTapArrowLeft(context);
            }));
  }

  /// Section Widget
  Widget _buildOr(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 8.v, bottom: 7.v),
              child: SizedBox(width: 142.h, child: Divider())),
          Text("lbl_or".tr, style: theme.textTheme.bodyMedium),
          Padding(
              padding: EdgeInsets.only(top: 8.v, bottom: 7.v),
              child: SizedBox(width: 142.h, child: Divider()))
        ]);
  }

  /// Section Widget
  Widget _buildButtonSocial(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
          height: 56.v,
          width: 155.h,
          padding: EdgeInsets.symmetric(vertical: 15.v),
          decoration: AppDecoration.outlineOnErrorContainer
              .copyWith(borderRadius: BorderRadiusStyle.circleBorder17),
          child: CustomImageView(
              imagePath: ImageConstant.imgSearch1,
              height: 23.adaptSize,
              width: 23.adaptSize,
              alignment: Alignment.center)),
      Container(
          height: 56.v,
          width: 156.h,
          padding: EdgeInsets.symmetric(vertical: 15.v),
          decoration: AppDecoration.outlineOnErrorContainer
              .copyWith(borderRadius: BorderRadiusStyle.circleBorder17),
          child: CustomImageView(
              imagePath: ImageConstant.imgAppleLogoBlack,
              height: 23.v,
              width: 19.h,
              alignment: Alignment.center))
    ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the signUpEmpityScreen when the action is triggered.
  onTapTxtDonthaveanaccount(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signUpScreen,
    );
  }
}
