import 'dart:async';

import '../../core/app_export.dart';
import 'package:flutter/material.dart';
import '../../domain/repository/repository.dart';
import '../../domain/usecase/verify_email_usecase.dart';
import 'bloc/otp_authentication_bloc.dart';

class OtpAuthenticationScreen extends StatefulWidget {
  const OtpAuthenticationScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<OtpAuthenticationBloc>(
        create: (context) => OtpAuthenticationBloc(InitOtpAuthenticationState(),
            VerifyEmailUseCAse(repository: Repository()))
          ..add(OtpAuthenticationInitialEvent()),
        child: const OtpAuthenticationScreen());
  }

  @override
  State<OtpAuthenticationScreen> createState() =>
      _OtpAuthenticationScreenState();
}

class _OtpAuthenticationScreenState extends State<OtpAuthenticationScreen> {
  int _secondsRemaining = 30;
  late Timer _timer;
  ButtonStyle? buttonStyle = CustomButtonStyles.fillPrimaryTL16;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    var pref = PrefUtils();
    final email = pref.getEmail() ?? "*****@mail.com";
    final sEmail = email.toString().split('@').last;
    final token = pref.getToken();
    //TextEditingController otpController = TextEditingController();

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: BlocSelector<OtpAuthenticationBloc, OtpAuthenticationState,
                    TextEditingController?>(
                selector: (state) => state.otpController,
                builder: (context, otpController) {
                  return Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.h, vertical: 34.v),
                      child: Column(children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("lbl_verify_it_s_you".tr,
                                style: theme.textTheme.headlineSmall)),
                        SizedBox(height: 13.v),
                        Container(
                            width: 319.h,
                            margin: EdgeInsets.only(right: 7.h),
                            child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "msg_we_send_a_code_to2".tr,
                                      style:
                                          CustomTextStyles.bodyLargeff6b7280),
                                  TextSpan(
                                      text:
                                          "*******@$sEmail) Enter it here to verify your identity",
                                      style:
                                          CustomTextStyles.titleMediumff111827)
                                ]),
                                textAlign: TextAlign.left)),
                        SizedBox(height: 29.v),
                        CustomPinCodeTextField(
                            context: context,
                            controller: otpController,
                            onChanged: (value) {
                              otpController?.text = value;
                              if (otpController?.text.length == 4 ||
                                  otpController?.text.length == 5) {
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
                              if (otpController?.text.length == 5) {
                                context.read<OtpAuthenticationBloc>().add(
                                    VerifyOtpEvent(
                                        email, otpController?.text ?? ""));
                              }
                            }),

                        SizedBox(height: 34.v),
                        Text("Resend Code $_secondsRemaining secs",
                            style: CustomTextStyles.titleMediumGray600),
                        _secondsRemaining == 0 ? Text("$token") : SizedBox(),
                        SizedBox(height: 68.v),
                        // print(
                        //     "otpController BlocBuilder====${otpController?.value.text}");
                        CustomElevatedButton(
                          text: "lbl_confirm".tr,
                          onPressed: () {
                            context.read<OtpAuthenticationBloc>().add(
                                VerifyOtpEvent(
                                    email, otpController?.text ?? ""));
                          },
                          buttonStyle: buttonStyle,
                          //isDisabled: otpController?.text.isEmpty
                        ),
                        SizedBox(height: 5.v)
                      ]));
                })));
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

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the idFillScreen when the action is triggered.
  onTapConfirm() {
    Future.delayed(Duration.zero, () {
      NavigatorService.pushNamed(
        AppRoutes.idFillScreen,
      );
    });
  }

  ///timer for counting down to 30 seconds to resend otp
  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel(); // Stop the timer when countdown reaches 0
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }
}
