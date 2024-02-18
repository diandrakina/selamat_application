import 'package:selamat_application/widget/widget_login_register/customButton.dart';
import 'package:flutter/material.dart';
import 'package:selamat_application/utils/sizeUtils.dart';
import 'package:selamat_application/styles/styles.dart';

class CustomElevatedButton extends Button {
  CustomElevatedButton({
    Key? key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    EdgeInsets? margin,
    VoidCallback? onPressed,
    ButtonStyle? buttonStyle,
    Alignment? alignment,
    TextStyle? buttonTextStyle,
    Color? color,
    TextStyle? textStyle,
    bool? isDisabled,
    double? height,
    double? width,
    required String text,
  }) : super(
          text: text,
          onPressed: onPressed,
          buttonStyle: buttonStyle,
          isDisabled: isDisabled,
          buttonTextStyle: buttonTextStyle,
          color: color,
          height: height,
          width: width,
          alignment: alignment,
          margin: margin,
        );

  final BoxDecoration? decoration;

  final Widget? leftIcon;

  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildElevatedButtonWidget,
          )
        : buildElevatedButtonWidget;
  }

  Widget get buildElevatedButtonWidget => Container(
        height: this.height ?? 50.v,
        width: this.width ?? double.maxFinite,
        margin: margin,
        // color: color,
        decoration: decoration,
        child: ElevatedButton(
          style: buttonStyle ?? buttonStyle,
          onPressed: isDisabled ?? false ? null : onPressed ?? () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container(width: 30, child:
              leftIcon ?? const SizedBox.shrink(),
              // ),
              Text(
                text,
                style: buttonTextStyle ?? buttonTextStyle,
                textAlign: TextAlign.center,
              ),
              // Container(
              // width: 30,
              // color: Colors.yellow,
              rightIcon ?? const SizedBox.shrink(),
              // ),
            ],
          ),
        ),
      );
}
