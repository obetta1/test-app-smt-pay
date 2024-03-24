import 'package:flutter/material.dart';
import 'package:smart_pay_app/core/utils/size_utils.dart';

import '../../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeBluegray300 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray300,
      );
  static get bodyLargeBluegrayHint300 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray900,
      );
  static get bodyLargePrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get hintTextPrimary => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray300,
      );
  static get bodyLargeff6b7280 => theme.textTheme.bodyLarge!.copyWith(
        color: Color(0XFF6B7280),
      );
  // Headline text style
  static get headlineLargePrimary => theme.textTheme.headlineLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get headlineLargeff111827 => theme.textTheme.headlineLarge!.copyWith(
        color: Color(0XFF111827),
      );
  static get headlineSmallBold => theme.textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get headlineSmallff0a6375 => theme.textTheme.headlineSmall!.copyWith(
        color: Color(0XFF0A6375),
      );
  static get headlineSmallff0a6375Bold =>
      theme.textTheme.headlineSmall!.copyWith(
        color: Color(0XFF0A6375),
        fontWeight: FontWeight.w700,
      );
  static get headlineSmallff111827 => theme.textTheme.headlineSmall!.copyWith(
        color: Color(0XFF111827),
      );
  static get headlineSmallff111827Bold =>
      theme.textTheme.headlineSmall!.copyWith(
        color: Color(0XFF111827),
        fontWeight: FontWeight.w700,
      );
  // Label text style
  static get labelMediumPrimary => theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get labelSmall8 => theme.textTheme.labelSmall!.copyWith(
        fontSize: 8.fSize,
      );
  static get labelSmallTeal400 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.teal400,
        fontSize: 8.fSize,
      );
  // S text style
  static get sFProDisplayWhiteA700 => TextStyle(
        color: appTheme.whiteA700,
        fontSize: 4.fSize,
        fontWeight: FontWeight.w600,
      ).sFProDisplay;
  // Title text style
  static get titleMediumCyan900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.cyan900,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumGray600 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray600,
      );
  static get titleMediumGray60001 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray60001,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleMediumPrimarySemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumTeal400 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.teal400,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumff0a6375 => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF0A6375),
        fontWeight: FontWeight.w600,
      );
  static get titleMediumff111827 => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF111827),
        fontWeight: FontWeight.w500,
      );
}

extension on TextStyle {
  TextStyle get sFProDisplay {
    return copyWith(
      fontFamily: 'SF Pro Display',
    );
  }
}
