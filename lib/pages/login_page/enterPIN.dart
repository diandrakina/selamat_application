import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:selamat_application/styles/styles.dart';

class EnterPIN extends StatefulWidget {
  const EnterPIN({super.key});

  @override
  State<EnterPIN> createState() => _EnterPINState();
}

class _EnterPINState extends State<EnterPIN> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(50)),
          Text(
            "Enter Your Pin",
            style: TextStyles.GR_40_title_regular,
          ),
          Padding(padding: EdgeInsets.all(50)),
          Center(
            child: SizedBox(
              width: 350,
              child: Pinput(
                length: 4,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                defaultPinTheme: PinTheme(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                        bottom: BorderSide(color: AppColors.white, width: 2),
                      ),
                    ),
                    textStyle: TextStyles.bold_30),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
