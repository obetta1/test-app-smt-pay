import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smart_pay_app/core/app_export.dart';
import 'bloc/create_pin_bloc.dart';

class CreatePinScreen extends StatefulWidget {
  CreatePinScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<CreatePinBloc>(
        create: (context) =>
            CreatePinBloc(CreatePinState())..add(CreatePinInitialEvent()),
        child: CreatePinScreen());
  }

  @override
  State<CreatePinScreen> createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  ButtonStyle? buttonStyle = CustomButtonStyles.fillPrimaryTL16;

  final TextEditingController? tokeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePinBloc, CreatePinState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.h, vertical: 34.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("msg_set_your_pin_code".tr,
                            style: theme.textTheme.headlineSmall),
                        SizedBox(height: 13.v),
                        Container(
                            width: 313.h,
                            margin: EdgeInsets.only(right: 13.h),
                            child: Text("msg_we_use_state_of_the_art".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodyLarge!
                                    .copyWith(height: 1.50))),
                        SizedBox(height: 41.v),
                        CustomPinCodeTextField(
                            context: context,
                            controller: tokeController,
                            shape: PinCodeFieldShape.underline,
                            onChanged: (value) {
                              if (tokeController?.text != null &&
                                  tokeController!.text.length > 3) {
                                setState(() {
                                  buttonStyle =
                                      CustomButtonStyles.fillPrimaryTL3;
                                });
                              } else {
                                setState(() {
                                  buttonStyle =
                                      CustomButtonStyles.fillPrimaryTL16;
                                });
                              }
                              if (tokeController?.text.length == 5) {
                                NavigatorService.pushNamed(
                                    AppRoutes.confirmationScreen);
                              }
                            }),
                        Spacer(flex: 30),
                        CustomElevatedButton(
                          text: "lbl_create_pin".tr,
                          buttonStyle: buttonStyle,
                          onPressed: () {
                            NavigatorService.pushNamed(
                                AppRoutes.confirmationScreen);
                          },
                        ),
                        Spacer(flex: 69)
                      ]))));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: double.maxFinite,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 24.h, right: 311.h),
            onTap: () {
              onTapArrowLeft(context);
            }));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
