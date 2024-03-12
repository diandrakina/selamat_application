import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/pages/payment_page/payment3.dart';
import 'package:selamat_application/styles/styles.dart';

class Payment4 extends StatefulWidget {
  const Payment4({super.key});

  @override
  State<Payment4> createState() => _Payment4State();
}

class _Payment4State extends State<Payment4> {
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
                      builder: ((context) => const Payment3()),
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
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Pembayaran anda sedang diproses',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyles.bold_30,
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
              const SizedBox(
                height: 20,
              ),
              //PEMBAYARAN MELALUI
              Text(
                "Pembayaran Melalui",
                style: TextStyles.bold_24,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 170,
                    child: Text(
                      "Virtual Account : ",
                      style: TextStyles.medium_18,
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      "31903174109941794",
                      style: TextStyles.bold_18,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
