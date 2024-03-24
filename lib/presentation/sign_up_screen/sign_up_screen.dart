import 'package:smart_pay_app/core/utils/progress_dialog_utils.dart';
import 'package:smart_pay_app/core/utils/validation_functions.dart';
import '../../domain/repository/repository.dart';
import '../../domain/usecase/get_email_token_usecase.dart';
import 'models/sign_up_filled_model.dart';
import 'package:flutter/material.dart';
import 'package:smart_pay_app/core/app_export.dart';
import 'bloc/sign_up_bloc.dart';

// ignore_for_file: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SignUpBloc>(
        create: (context) => SignUpBloc(
            SignUpInitialState(signUpFilledModelObj: SignUpFilledModel()),
            GetEmailUseCase(Repository()),
            context)
          ..add(SignUpInitialEvent()),
        child: SignUpScreen());
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            height: SizeUtils.height - 120.h,
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.h, vertical: 31.v),
                            child: Column(children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                      width: 200.h,
                                      child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: "lbl_create_a".tr,
                                                style: CustomTextStyles
                                                    .headlineSmallff111827Bold),
                                            TextSpan(
                                                text: "msg_smartpay_account".tr,
                                                style: CustomTextStyles
                                                    .headlineSmallff0a6375Bold
                                                    .copyWith(height: 1.30))
                                          ]),
                                          textAlign: TextAlign.left))),
                              SizedBox(height: 30.v),
                              CustomTextFormField(
                                  controller: emailController,
                                  hintText: "lbl_email".tr,
                                  textInputAction: TextInputAction.done,
                                  textInputType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null ||
                                        (!isValidEmail(value,
                                            isRequired: true))) {
                                      return "err_msg_please_enter_valid_email"
                                          .tr;
                                    }
                                    return null;
                                  }),
                              SizedBox(height: 24.v),
                              CustomElevatedButton(
                                text: "lbl_sign_up".tr,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    PrefUtils().saveEmail(emailController.text);
                                    context.read<SignUpBloc>().add(
                                        GetEmailTokenEvent(
                                            emailController.text));
                                  }
                                },
                              ),
                              SizedBox(height: 33.v),
                              _buildOr(context),
                              SizedBox(height: 26.v),
                              _buildButtonSocial(context),
                              Spacer(flex: 43),
                              BlocBuilder<SignUpBloc, SignUpState>(
                                builder: (context, state) {
                                  if (state is SignUpSuccessState) {
                                    Future.delayed(Duration.zero, () {
                                      NavigatorService.popAndPushNamed(
                                        AppRoutes.otpAuthenticationScreen,
                                        arguments: {
                                          "email": emailController.text
                                        },
                                      );
                                    });
                                    print(
                                        "tokenResponse========${emailController.text}");
                                  }

                                  return SizedBox();
                                },
                              ),
                              Spacer(flex: 56),
                              InkWell(
                                onTap: () {
                                  onTapTxtDonthaveanaccount(context);
                                },
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "lbl_already".tr,
                                          style: CustomTextStyles
                                              .bodyLargeff6b7280),
                                      TextSpan(
                                          text: "msg_have_an_account".tr,
                                          style: CustomTextStyles
                                              .bodyLargeff6b7280),
                                      TextSpan(
                                          text: "lbl_sign_in".tr,
                                          style: CustomTextStyles
                                              .titleMediumff0a6375)
                                    ]),
                                    textAlign: TextAlign.left),
                              ),
                              Spacer(flex: 56),
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

  /// Navigates to the signUpEmpityScreen when the action is triggered.
  onTapTxtDonthaveanaccount(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signInScreen,
    );
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
