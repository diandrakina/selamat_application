import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/widget_payment/buttonNext.dart';
import 'package:selamat_application/widget/widget_payment/customStepper.dart';

class Payment3 extends StatefulWidget {
  const Payment3({super.key});

  @override
  State<Payment3> createState() => _Payment3State();
}

class _Payment3State extends State<Payment3> {
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
            children: [
              //STEPPER COMPONENT
              StepperComponent(status1: true, status2: true, status3: true),

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
                    Container(
                      height: 320,
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(12),
                          color: AppColors.darkModeCard),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Data Psikolog",
                            style: TextStyles.bold_24,
                          ),
                          const SizedBox(
                            height: 8,
                          ),

                          //Psikolog
                          Text(
                            "Psikolog : ",
                            style: TextStyles.medium_18,
                          ),
                          Text(
                            "Joeliardo Gerald, S.Psi., M.Psi.",
                            style: TextStyles.bold_18,
                          ),
                          const SizedBox(
                            height: 8,
                          ),

                          //Kode Psikolog
                          Text(
                            "Kode Psikolog : ",
                            style: TextStyles.medium_18,
                          ),
                          Text(
                            "B327RTB",
                            style: TextStyles.bold_18,
                          ),
                          const SizedBox(
                            height: 8,
                          ),

                          //Keahlian
                          Text(
                            "Keahlian : ",
                            style: TextStyles.medium_18,
                          ),
                          Text(
                            "Work life balance consultant",
                            style: TextStyles.bold_18,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Harga : ",
                            style: TextStyles.medium_18,
                          ),
                          Text(
                            "Rp 500.000,00/jam",
                            style: TextStyles.bold_18,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //DATA DIRI
                    Container(
                      height: 310,
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(12),
                          color: AppColors.darkModeCard),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Data Diri",
                            style: TextStyles.bold_24,
                          ),
                          const SizedBox(
                            height: 8,
                          ),

                          //Nama
                          Text(
                            "Nama : ",
                            style: TextStyles.medium_18,
                          ),
                          Text(
                            "Richie Hartono",
                            style: TextStyles.bold_18,
                          ),
                          const SizedBox(
                            height: 8,
                          ),

                          //Tanggal Lahir
                          Text(
                            "Tanggal Lahir : ",
                            style: TextStyles.medium_18,
                          ),
                          Text(
                            "6 Mei 2004",
                            style: TextStyles.bold_18,
                          ),
                          const SizedBox(
                            height: 8,
                          ),

                          //Keahlian
                          Text(
                            "Keluhan : ",
                            style: TextStyles.medium_18,
                          ),
                          Text(
                            "Saya lelah bekerja 24/7 tiap harinya, sehingga saya ingin berkonsultasi dengan psikolog Joeliardo.",
                            maxLines: null,
                            style: TextStyles.bold_18,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //DETAIL KONSULTASI
                    Container(
                      height: 260,
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(12),
                          color: AppColors.darkModeCard),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Detail Konsultasi",
                            style: TextStyles.bold_24,
                          ),
                          const SizedBox(
                            height: 8,
                          ),

                          //Tanggal Konsultasi
                          Text(
                            "Tanggal Konsultasi : ",
                            style: TextStyles.medium_18,
                          ),
                          Text(
                            "29 Februari 2024",
                            style: TextStyles.bold_18,
                          ),
                          const SizedBox(
                            height: 8,
                          ),

                          //Durasi
                          Text(
                            "Durasi : ",
                            style: TextStyles.medium_18,
                          ),
                          Text(
                            "6 jam",
                            style: TextStyles.bold_18,
                          ),
                          const SizedBox(
                            height: 8,
                          ),

                          //Harga
                          Text(
                            "Harga : ",
                            style: TextStyles.medium_18,
                          ),
                          Text(
                            "Rp 500.000,00/jam",
                            style: TextStyles.bold_18,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //METODE PEMBAYARAN
                    Container(
                      height: 110,
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(12),
                          color: AppColors.darkModeCard),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Metode Pembayaran",
                            style: TextStyles.bold_24,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Bank Transfer - BCA Virtual Account",
                            style: TextStyles.medium_18,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //PEMBAYARAN
                    Container(
                      height: 210,
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(12),
                          color: AppColors.darkModeCard),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pembayaran",
                            style: TextStyles.bold_24,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 20,
                                width: 210,
                                child: Text(
                                  'Harga Per Jam',
                                  style: TextStyles.GR_16_regular,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                child: Text(
                                  "Rp 500.000",
                                  style: TextStyles.bold_16,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 20,
                                width: 210,
                                child: Text(
                                  'Harga x Durasi',
                                  style: TextStyles.GR_16_regular,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                child: Text(
                                  "6 x 500.000",
                                  style: TextStyles.bold_16,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 20,
                                width: 210,
                                child: Text(
                                  'Pajak',
                                  style: TextStyles.GR_16_regular,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                child: Text(
                                  "Rp 0",
                                  style: TextStyles.bold_16,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 120,
                                child: Text(
                                  'TOTAL',
                                  style: TextStyles.GR_24_title_regular,
                                ),
                              ),
                              SizedBox(
                                child: Text(
                                  "Rp 3.000.000,00",
                                  style: TextStyles.bold_24,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const ButtonNext(title: "Konfirmasi"),
      ),
    );
  }
}
