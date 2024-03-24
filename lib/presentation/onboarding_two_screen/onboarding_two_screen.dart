import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'models/onboarding_two_model.dart';
import 'package:flutter/material.dart';
import 'package:smart_pay_app/core/app_export.dart';
import 'bloc/onboarding_two_bloc.dart';

class OnboardingTwoScreen extends StatelessWidget {
  const OnboardingTwoScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<OnboardingTwoBloc>(
        create: (context) => OnboardingTwoBloc(
            OnboardingTwoState(onboardingTwoModelObj: OnboardingTwoModel()))
          ..add(OnboardingTwoInitialEvent()),
        child: OnboardingTwoScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingTwoBloc, OnboardingTwoState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: appTheme.gray5002,
              appBar: _buildAppBar(context),
              body: SizedBox(
                  height: 702.v,
                  width: double.maxFinite,
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgImage,
                        height: 407.v,
                        width: 202.h,
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(top: 62.v)),
                    _buildText(context),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 44.h, top: 169.v, right: 64.h),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildPayment(context),
                                  SizedBox(height: 8.v),
                                  _buildContact(context)
                                ])))
                  ]))));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(height: 65.v, actions: [
      AppbarTitle(
          text: "lbl_skip".tr,
          margin: EdgeInsets.fromLTRB(24.h, 17.v, 24.h, 18.v),
          onTap: () {
            onTapSkip(context);
          })
    ]);
  }

  /// Section Widget
  Widget _buildText(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 44.h, vertical: 41.v),
            decoration: AppDecoration.outlineWhiteA700,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                  width: 248.h,
                  margin: EdgeInsets.only(left: 18.h, right: 19.h),
                  child: Text("msg_the_fastest_transaction".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineSmall!
                          .copyWith(height: 1.30))),
              SizedBox(height: 14.v),
              Container(
                  width: 259.h,
                  margin: EdgeInsets.symmetric(horizontal: 13.h),
                  child: Text("msg_get_easy_to_pay".tr,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style:
                          theme.textTheme.bodyMedium!.copyWith(height: 1.50))),
              SizedBox(height: 19.v),
              SizedBox(
                  height: 6.v,
                  child: AnimatedSmoothIndicator(
                      activeIndex: 0,
                      count: 2,
                      effect: ScrollingDotsEffect(
                          activeDotColor: Color(0X1212121D), dotHeight: 6.v))),
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                    onTap: () {
                      NavigatorService.pushNamed(AppRoutes.onboardingOneScreen);
                    },
                    child: Text("lbl_back".tr,
                        style: theme.textTheme.bodyMedium!.copyWith(
                            height: 1.50,
                            color: appTheme.teal400,
                            fontWeight: FontWeight.bold))),
              ),
              SizedBox(height: 14.v),
              CustomElevatedButton(
                  text: "lbl_get_started".tr,
                  onPressed: () {
                    onTapGetStarted(context);
                  }),
            ])));
  }

  /// Section Widget
  Widget _buildPayment(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 109.h),
        padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 11.v),
        decoration: AppDecoration.outlineOnPrimary
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder11),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 2.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 1.v),
                            child: Text("lbl_payment".tr,
                                style: theme.textTheme.labelMedium)),
                        CustomImageView(
                            imagePath: ImageConstant.imgPlus,
                            height: 12.adaptSize,
                            width: 12.adaptSize)
                      ])),
              SizedBox(height: 14.v),
              Padding(
                  padding: EdgeInsets.only(left: 2.h),
                  child: Row(children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgUser,
                        height: 16.v,
                        width: 26.h),
                    Padding(
                        padding: EdgeInsets.only(left: 12.h),
                        child: Text("lbl_1990".tr,
                            style: theme.textTheme.titleSmall))
                  ]))
            ]));
  }

  /// Section Widget
  Widget _buildContact(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Container(
            margin: EdgeInsets.only(left: 173.h),
            padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 18.v),
            decoration: AppDecoration.outlineGray6000f
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder11),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              CustomImageView(
                  imagePath: ImageConstant.imgUnsplashHrfz1yoqwE,
                  height: 34.adaptSize,
                  width: 34.adaptSize,
                  radius: BorderRadius.circular(17.h)),
              SizedBox(height: 13.v),
              SizedBox(
                  width: 65.h,
                  child: Text("msg_andrade_alexander".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style:
                          CustomTextStyles.labelSmall8.copyWith(height: 1.50)))
            ])));
  }

  /// Navigates to the signUpEmpityScreen when the action is triggered.
  onTapSkip(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signInScreen,
    );
  }

  /// Navigates to the signUpEmpityScreen when the action is triggered.
  onTapGetStarted(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signInScreen,
    );
  }
}
