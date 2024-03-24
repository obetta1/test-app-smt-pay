import 'package:flutter/material.dart';
import 'package:smart_pay_app/core/app_export.dart';

class ConfirmationScreen extends StatelessWidget {
  ConfirmationScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return ConfirmationScreen();
  }

  var pref = PrefUtils();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 134.v,
                    width: 121.h,
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            height: 121.adaptSize,
                            width: 121.adaptSize,
                            child: Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgThumbsUp1,
                                  height: 121.adaptSize,
                                  width: 121.adaptSize,
                                  alignment: Alignment.center,
                                ),
                                CustomImageView(
                                  imagePath: ImageConstant.imgStar1,
                                  height: 17.adaptSize,
                                  width: 17.adaptSize,
                                  alignment: Alignment.topLeft,
                                  margin: EdgeInsets.only(
                                    left: 10.h,
                                    top: 6.v,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgStar2,
                          height: 33.adaptSize,
                          width: 33.adaptSize,
                          alignment: Alignment.topRight,
                        ),
                      ],
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgStar3,
                    height: 17.adaptSize,
                    width: 17.adaptSize,
                    margin: EdgeInsets.only(
                      left: 1.h,
                      top: 44.v,
                      bottom: 72.v,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35.v),
              Text(
                "Congratulations ${pref.getUsername()}",
                style: CustomTextStyles.headlineSmallBold,
              ),
              SizedBox(height: 13.v),
              Container(
                width: 239.h,
                margin: EdgeInsets.only(
                  left: 41.h,
                  right: 45.h,
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "lbl_y".tr,
                        style: CustomTextStyles.bodyLargeff6b7280,
                      ),
                      TextSpan(
                        text: "msg_ou_ve_completed".tr,
                        style: CustomTextStyles.bodyLargeff6b7280.copyWith(
                          height: 1.50,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 29.v),
              CustomElevatedButton(
                text: "lbl_get_started".tr,
                onPressed: () {
                  NavigatorService.pushNamed(AppRoutes.signInScreen);
                },
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }
}
