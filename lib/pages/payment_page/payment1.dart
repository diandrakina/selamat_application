import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/widget_payment/buttonNext.dart';
import 'package:selamat_application/widget/widget_payment/customStepper.dart';

class Payment1 extends StatefulWidget {
  const Payment1({super.key});

  @override
  State<Payment1> createState() => _Payment1State();
}

class _Payment1State extends State<Payment1> {
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
              const FaIcon(
                Icons.arrow_back,
                color: AppColors.white,
                size: 25,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //STEPPER COMPONENT
              StepperComponent(status1: true, status2: false, status3: false),

              //CONTENT
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //DATA PSIKOLOG
                    Text(
                      "Psychologist",
                      style: TextStyles.bold_24,
                    ),
                    const Divider(
                      color: AppColors.activeCalendar,
                      height: 30,
                    ),

                    //nama
                    Row(
                      children: [
                        Text(
                          "Nama : ",
                          style: TextStyles.light_18,
                        ),
                        Text(
                          "Joeliardo Gerald, S.Psi., M.Psi.",
                          style: TextStyles.bold_18,
                        )
                      ],
                    ),

                    //kode
                    Row(
                      children: [
                        Text(
                          "Kode : ",
                          style: TextStyles.light_18,
                        ),
                        Text(
                          "B327RTB",
                          style: TextStyles.bold_18,
                        )
                      ],
                    ),

                    //Keahlian
                    Row(
                      children: [
                        Text(
                          "Keahlian : ",
                          style: TextStyles.light_18,
                        ),
                        Text(
                          "Work life balance consultant",
                          style: TextStyles.bold_18,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //DATA DETAIL KONSULTASI
                    Text(
                      "Detail Konsultasi",
                      style: TextStyles.bold_24,
                    ),
                    const Divider(
                      color: AppColors.activeCalendar,
                      height: 30,
                    ),

                    //DURASI KONSULTASI
                    Text(
                      "Pilih durasi konsultasi (1 - 12 jam):",
                      style: TextStyles.medium_18,
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    Container(
                      height: 50,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.activeCalendar),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 15),
                              ),
                              Text(
                                "6 jam",
                                style: TextStyles.medium_18,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //KELUHAN
                    Text(
                      "Keluhan :",
                      style: TextStyles.medium_18,
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    Container(
                      height: 120,
                      width: double.maxFinite,
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.activeCalendar),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                              padding: EdgeInsets.only(left: 8, right: 8)),
                          Column(
                            children: [
                              Text(
                                "Saya lelah bekerja 24/7 tiap harinya, sehingga saya ingin berkonsultasi dengan psikolog Joeliardo.",
                                maxLines: null,
                                style: TextStyles.medium_18,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: const ButtonNext(title: "Pilih Metode Pembayaran"),
      ),
    );
  }
}
