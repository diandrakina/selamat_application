import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/pages/payment_page/payment1.dart';
import 'package:selamat_application/pages/payment_page/payment3.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';
import 'package:selamat_application/widget/widget_payment/customStepper.dart';

class Payment2 extends StatefulWidget {
  const Payment2({super.key});

  @override
  State<Payment2> createState() => _Payment2State();
}

class _Payment2State extends State<Payment2> {
  int selectedRadio = 0;

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  int? selectedBank;

  _onButtonTapped(int? index) {
    setState(() {
      if (selectedBank == index) {
        selectedBank = null;
      } else {
        selectedBank = index;
      }
    });
  }

  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //APPBAR
        appBar: AppBar(
          toolbarHeight: 80,
          leadingWidth: double.maxFinite,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: Row(
            children: [
              const Padding(padding: EdgeInsets.all(5)),
              GestureDetector(
                child: const FaIcon(
                  Icons.arrow_back,
                  color: AppColors.white,
                  size: 25,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const Payment1()),
                    ),
                  );
                },
              ),
              const Padding(padding: EdgeInsets.all(5)),
              Text(
                "Payment",
                style: TextStyles.bold_30,
              ),
            ],
          ),
        ),

        //BODY
        body: SingleChildScrollView(
          child: Column(
            children: [
              //STEPPER COMPONENT
              const StepperComponent(
                  status1: true, status2: true, status3: false),

              //CONTENT
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //BANK TRANSFER
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: selectedRadio,
                          activeColor: AppColors.pastelGreenHealth,
                          onChanged: (val) {
                            setSelectedRadio(val as int);
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bank transfer - Virtual account",
                              style: TextStyles.medium_18,
                            ),
                            Text(
                              "Pilih salah satu:",
                              style: TextStyles.thin_14,
                            )
                          ],
                        )
                      ],
                    ),

                    //Container Bank
                    Row(
                      children: [
                        const Padding(padding: EdgeInsets.all(25)),
                        _buildBankContainer(
                            "assets/images/payment_page/bca.png", 0),
                        const SizedBox(
                          width: 15,
                        ),
                        _buildBankContainer(
                            "assets/images/payment_page/blu.png", 1),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //Container Bank
                    Row(
                      children: [
                        const Padding(padding: EdgeInsets.all(25)),
                        _buildBankContainer(
                            "assets/images/payment_page/bri.png", 2),
                        const SizedBox(
                          width: 15,
                        ),
                        _buildBankContainer(
                            "assets/images/payment_page/bni.png", 3),
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    //PULSA
                    Row(
                      children: [
                        Radio(
                          value: 2,
                          groupValue: selectedRadio,
                          activeColor: AppColors.pastelGreenHealth,
                          onChanged: (val) {
                            setSelectedRadio(val as int);
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pulsa",
                              style: TextStyles.medium_18,
                            ),
                            Text(
                              "Isi nomor telepon Anda:",
                              style: TextStyles.thin_14,
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextField(
                        style: TextStyles.medium_16,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2.0),
                            ),
                            fillColor: AppColors.bgDarkMode,
                            filled: true,
                            hintText: "phone number",
                            hintStyle: TextStyles.light_16),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    //Nomor Rekening
                    Row(
                      children: [
                        Radio(
                          value: 3,
                          groupValue: selectedRadio,
                          activeColor: AppColors.pastelGreenHealth,
                          onChanged: (val) {
                            setSelectedRadio(val as int);
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nomor Rekening",
                              style: TextStyles.medium_18,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomElevatedButton(
          margin: const EdgeInsets.all(20),
          height: 50,
          text: "Lanjut ke Pembayaran",
          buttonStyle: CustomButtonStyles.buttonBlue,
          buttonTextStyle: TextStyles.bold_18,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => const Payment3()),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBankContainer(String bank, int index) {
    return GestureDetector(
      onTap: () {
        _onButtonTapped(index);
      },
      child: Container(
        height: 60,
        width: 130,
        decoration: BoxDecoration(
          color:
              selectedBank == index ? AppColors.baseColor : Colors.transparent,
          border: Border.all(
              color: selectedBank == index ? AppColors.baseColor : Colors.white,
              width: 3),
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(bank),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
