import '../../core/app_export.dart';
import 'models/splash_model.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:flutter/material.dart';
import 'bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SplashBloc>(
        create: (context) =>
            SplashBloc(SplashState(splashModelObj: SplashModel()))
              ..add(SplashInitialEvent()),
        child: SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 72.adaptSize,
                            width: 72.adaptSize,
                            padding: EdgeInsets.all(16.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadiusStyle.roundedBorder8,
                                image: DecorationImage(
                                    image: fs.Svg(ImageConstant.imgLogo),
                                    fit: BoxFit.cover)),
                            child: CustomImageView(
                                imagePath: ImageConstant.imgSave,
                                height: 39.adaptSize,
                                width: 39.adaptSize,
                                alignment: Alignment.center)),
                        SizedBox(height: 19.v),
                        RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Smart",
                                  style:
                                      CustomTextStyles.headlineLargeff111827),
                              TextSpan(
                                  text: "Pay",
                                  style: theme.textTheme.headlineLarge)
                            ]),
                            textAlign: TextAlign.left),
                        SizedBox(height: 5.v)
                      ]))));
    });
  }
}
