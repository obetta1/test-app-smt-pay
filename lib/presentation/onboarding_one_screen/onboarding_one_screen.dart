import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/widgets/custom_icon_button.dart';
import 'models/onboarding_one_model.dart';
import 'package:flutter/material.dart';
import 'package:smart_pay_app/core/app_export.dart';
import 'bloc/onboarding_one_bloc.dart';

class OnboardingOneScreen extends StatelessWidget {
  const OnboardingOneScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<OnboardingOneBloc>(
        create: (context) => OnboardingOneBloc(
            OnboardingOneState(onboardingOneModelObj: OnboardingOneModel()))
          ..add(OnboardingOneInitialEvent()),
        child: OnboardingOneScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingOneBloc, OnboardingOneState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: appTheme.gray5002,
              appBar: _buildAppBar(context),
              body: SizedBox(
                  height: 702.v,
                  width: double.maxFinite,
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                    CustomContainer(),
                    _buildText(context),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 46.h, top: 103.v, right: 37.h),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(left: 13.h),
                                      child: CustomIconButton(
                                          height: 52.adaptSize,
                                          width: 52.adaptSize,
                                          padding: EdgeInsets.all(11.h),
                                          decoration: IconButtonStyleHelper
                                              .outlineOnPrimary,
                                          child: CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgFluentShieldVideo24Filled))),
                                  SizedBox(height: 60.v),
                                  SizedBox(
                                      height: 128.v,
                                      width: 292.h,
                                      child: Stack(
                                          alignment: Alignment.topRight,
                                          children: [
                                            Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Container(
                                                    margin: EdgeInsets.only(
                                                        top: 77.v,
                                                        right: 150.h),
                                                    padding:
                                                        EdgeInsets.all(11.h),
                                                    decoration: AppDecoration
                                                        .outlineOnPrimary
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder8),
                                                    child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 2.v),
                                                              child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                        "Direct Deposit",
                                                                        style: CustomTextStyles
                                                                            .labelMediumPrimary),
                                                                    SizedBox(
                                                                        height:
                                                                            4.v),
                                                                    Text(
                                                                        "lbl_sugested_split"
                                                                            .tr,
                                                                        style: theme
                                                                            .textTheme
                                                                            .bodySmall)
                                                                  ])),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          27.h,
                                                                      top: 10.v,
                                                                      bottom:
                                                                          7.v),
                                                              child: Text(
                                                                  "lbl_today"
                                                                      .tr,
                                                                  style: CustomTextStyles
                                                                      .labelSmallTeal400))
                                                        ]))),
                                            _buildTwoHundredThousand(context)
                                          ]))
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
            padding: EdgeInsets.symmetric(horizontal: 44.h, vertical: 46.v),
            decoration: AppDecoration.outlineWhiteA,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                  width: 242.h,
                  margin: EdgeInsets.only(left: 20.h, right: 24.h),
                  child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "lbl_finance_app".tr,
                            style: CustomTextStyles.headlineSmallff111827),
                        TextSpan(
                            text: "msg_the_safest_and".tr,
                            style: CustomTextStyles.headlineSmallff111827
                                .copyWith(height: 1.30)),
                        TextSpan(
                            text: "lbl_trusted".tr,
                            style: CustomTextStyles.headlineSmallff111827)
                      ]),
                      textAlign: TextAlign.center)),
              SizedBox(height: 16.v),
              Container(
                  width: 281.h,
                  margin: EdgeInsets.symmetric(horizontal: 2.h),
                  child: Text("msg_your_finance_work".tr,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style:
                          theme.textTheme.bodyMedium!.copyWith(height: 1.50))),
              SizedBox(height: 14.v),
              SizedBox(
                  height: 6.v,
                  child: AnimatedSmoothIndicator(
                      activeIndex: 0,
                      count: 2,
                      effect: ScrollingDotsEffect(
                          activeDotColor: Color(0X1212121D), dotHeight: 6.v))),
              SizedBox(height: 4.v),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                    onTap: () {
                      NavigatorService.pushNamed(AppRoutes.onboardingTwoScreen);
                    },
                    child: Text("lbl_next".tr,
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
  Widget _buildTwoHundredThousand(BuildContext context) {
    return Align(
        alignment: Alignment.topRight,
        child: Container(
            margin: EdgeInsets.only(left: 132.h),
            padding: EdgeInsets.symmetric(horizontal: 9.h, vertical: 10.v),
            decoration: AppDecoration.outlineGray6000f
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder11),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Text("lbl_this_month".tr,
                          style: theme.textTheme.labelSmall)),
                  SizedBox(height: 6.v),
                  Container(
                      height: 55.v,
                      width: 138.h,
                      margin: EdgeInsets.only(left: 2.h),
                      child:
                          Stack(alignment: Alignment.bottomCenter, children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                                height: 55.v,
                                child: VerticalDivider(
                                    width: 1.h,
                                    thickness: 1.v,
                                    color: appTheme.gray100))),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 21.v),
                                child: SizedBox(
                                    width: 138.h,
                                    child: Divider(color: appTheme.gray100)))),
                        Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                                padding: EdgeInsets.only(top: 11.v),
                                child: SizedBox(
                                    width: 138.h,
                                    child: Divider(color: appTheme.gray100)))),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                height: 47.v,
                                width: 136.h,
                                margin: EdgeInsets.only(bottom: 1.v),
                                child: Stack(
                                    alignment: Alignment.topLeft,
                                    children: [
                                      CustomImageView(
                                          imagePath: ImageConstant.imgVector178,
                                          height: 47.v,
                                          width: 136.h,
                                          alignment: Alignment.center),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 16.h, right: 83.h),
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    CustomElevatedButton(
                                                        height: 14.v,
                                                        text: "lbl_2_000_00".tr,
                                                        buttonStyle:
                                                            CustomButtonStyles
                                                                .fillPrimaryTL3,
                                                        buttonTextStyle:
                                                            CustomTextStyles
                                                                .sFProDisplayWhiteA700),
                                                    SizedBox(height: 5.v),
                                                    Container(
                                                        height: 3.adaptSize,
                                                        width: 3.adaptSize,
                                                        decoration: BoxDecoration(
                                                            color: appTheme
                                                                .whiteA700,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        1.h),
                                                            border: Border.all(
                                                                color: appTheme
                                                                    .teal400,
                                                                width: 1.h,
                                                                strokeAlign:
                                                                    strokeAlignOutside)))
                                                  ])))
                                    ])))
                      ])),
                  Divider(color: appTheme.gray100, indent: 2.h)
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

class CustomContainer extends StatefulWidget {
  const CustomContainer({super.key});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            height: 407.v,
            width: 202.h,
            margin: EdgeInsets.only(top: 65.v),
            decoration: AppDecoration.outlineGrayF,
            child: Stack(alignment: Alignment.center, children: [
              CustomImageView(
                  imagePath: ImageConstant.imgButtons,
                  height: 96.v,
                  width: 202.h,
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(top: 54.v)),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 1.h),
                      padding: EdgeInsets.all(2.h),
                      decoration: AppDecoration.outlineGray.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder30),
                      child: Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 0,
                          margin: EdgeInsets.all(0),
                          color: appTheme.gray900,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusStyle.customBorderTL28),
                          child: Container(
                              height: 402.v,
                              width: 195.h,
                              padding: EdgeInsets.all(8.h),
                              decoration: AppDecoration.fillGray900.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.customBorderTL28),
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                        padding: EdgeInsets.only(right: 63.h),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CustomImageView(
                                                  imagePath:
                                                      ImageConstant.imgSpeaker,
                                                  height: 2.v,
                                                  width: 24.h,
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 2.v)),
                                              CustomImageView(
                                                  imagePath:
                                                      ImageConstant.imgLinkedin,
                                                  height: 7.adaptSize,
                                                  width: 7.adaptSize,
                                                  margin: EdgeInsets.only(
                                                      left: 5.h))
                                            ]))),
                                CustomImageView(
                                    imagePath: ImageConstant.imgScreen,
                                    height: 385.v,
                                    width: 178.h,
                                    alignment: Alignment.center)
                              ])))))
            ])));
  }
}
