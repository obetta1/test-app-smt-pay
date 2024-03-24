import 'package:country_picker/country_picker.dart';
import 'package:smart_pay_app/core/utils/validation_functions.dart';

import 'package:flutter/material.dart';
import 'package:smart_pay_app/core/app_export.dart';

import '../../domain/repository/repository.dart';
import '../../domain/usecase/verify_identity_usecase.dart';
import 'bloc/verify_id_bloc.dart';
import 'models/register_request_model.dart';

class IdFillScreen extends StatefulWidget {
  IdFillScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<VerifyIdBloc>(
        create: (context) => VerifyIdBloc(VerifyIdState(),
            VerifyIdentityUseCase(repository: Repository()), context)
          ..add(VerifyIdInitialEvent()),
        child: IdFillScreen());
  }

  @override
  State<IdFillScreen> createState() => _IdFillScreenState();
}

class _IdFillScreenState extends State<IdFillScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  String? hintText = "Select Country";
  String? text = "";
  bool isSelected = false;
  Widget selectedImage = Icon(Icons.supervisor_account_rounded);
  GlobalKey<FormState> _idFormKey = GlobalKey<FormState>();

  var pref = PrefUtils();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 30.v),
                child: Form(
                  key: _idFormKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 184.h,
                            child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "msg_tell_us_a_bit_about2".tr,
                                      style: CustomTextStyles
                                          .headlineSmallff111827Bold),
                                  TextSpan(
                                      text: "lbl_yourself".tr,
                                      style: CustomTextStyles
                                          .headlineSmallff0a6375Bold)
                                ]),
                                textAlign: TextAlign.left)),
                        SizedBox(height: 28.v),
                        _buildName(context),
                        SizedBox(height: 16.v),
                        _buildEmail(context),
                        SizedBox(height: 16.v),
                        _buildCountryCodePicker(context, _countryController),
                        SizedBox(height: 16.v),
                        _buildPassword(context),
                        SizedBox(height: 24.v),
                        _buildContinue(context),
                        SizedBox(height: 5.v)
                      ]),
                ))));
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

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return CustomTextFormField(
      controller: _fullNameController,
      hintText: "lbl_full_name".tr,
      hintStyle: CustomTextStyles.hintTextPrimary,
      validator: (value) {
        if (value == null || value.length < 3) {
          return "please enter your full";
        }
        return null;
      },
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
        controller: _userNameController,
        hintText: "lbl_username".tr,
        hintStyle: CustomTextStyles.hintTextPrimary,
        validator: (value) {
          if (value == null || value.length < 3) {
            return "user name is too short";
          }
          return null;
        });
  }

  Widget _buildCountryCodePicker(
      BuildContext context, final TextEditingController controller,
      {String? initialCountryCode}) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.h),
        color: appTheme.gray5002,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: InkWell(
          onTap: () {
            showCountryPicker(
                context: context,
                showPhoneCode: false,
                countryListTheme: CountryListThemeData(
                  flagSize: 25,
                  backgroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
                  bottomSheetHeight: 500,
                  // Optional. Country list modal height
                  //Optional. Sets the border radius for the bottomsheet.
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  //Optional. Styles the search field.
                  inputDecoration: InputDecoration(
                    labelText: 'Search',
                    hintText: 'Start typing to search',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color(0xFF8C98A8).withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
                onSelect: (country) => setState(() {
                      selectedImage = Text(
                        country.flagEmoji,
                        style: TextStyle(fontSize: 28),
                      );
                      isSelected = true;
                      text = country.name;
                      _countryController.text =
                          ' ${country.e164Key.split('-')[1]}';
                      print(
                          "${country.nameLocalized}===${country.e164Key.split('-')[1]}===${country.toJson()}");
                    }));
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  selectedImage,
                  const SizedBox(
                    width: 10,
                  ),
                  isSelected
                      ? Text(text!,
                          style: theme.textTheme.bodyLarge!.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold))
                      : Text(
                          hintText!,
                          style: TextStyle(
                            color: appTheme.blueGray300,
                          ),
                        ),
                ],
              ),
              const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.arrow_drop_down))
            ],
          ),
        ),
      ),
    );
  }

  bool isShowPassword = false;

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return CustomTextFormField(
        controller: _passwordController,
        textInputAction: TextInputAction.done,
        suffix: InkWell(
            onTap: () {
              setState(() {
                isShowPassword = !isShowPassword;
              });
            },
            child: Container(
                margin: EdgeInsets.fromLTRB(30.h, 16.v, 16.h, 16.v),
                child: CustomImageView(
                    imagePath: ImageConstant.imgEyeoff,
                    height: 24.adaptSize,
                    width: 24.adaptSize))),
        suffixConstraints: BoxConstraints(maxHeight: 56.v),
        obscureText: isShowPassword,
        validator: (value) {
          if (!isValidPassword(value, isRequired: true)) {
            return "password must have upper and lower case, digit, special character [@#%^&+=]";
          }
          return null;
        });
  }

  /// Section Widget
  Widget _buildContinue(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_continue".tr,
        onPressed: () {
          if (_idFormKey.currentState!.validate()) {
            var userInfo = RegisterRequestModel(
                fullName: _fullNameController.text,
                username: _userNameController.text,
                email: pref.getEmail(),
                country: _countryController.text,
                password: _passwordController.text,
                deviceName: "mobile");
            context.read<VerifyIdBloc>().add(RegisterUserEvent(userInfo));
          }
        });
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
