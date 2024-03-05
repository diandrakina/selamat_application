import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/pages/discovery_page/psychologistDetailPage.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

class ContainerPsikolog extends StatefulWidget {
  final String image;
  final String name;
  final String speciality;
  final int years;
  final double rating;
  final String price;

  final double kananAtas;
  final double kananBawah;
  final double kiriAtas;
  final double kiriBawah;

  const ContainerPsikolog(
      {super.key,
      required this.image,
      required this.name,
      required this.price,
      required this.rating,
      required this.speciality,
      required this.years,
      required this.kananAtas,
      required this.kananBawah,
      required this.kiriAtas,
      required this.kiriBawah});

  @override
  State<ContainerPsikolog> createState() => _ContainerPsikologState();
}

class _ContainerPsikologState extends State<ContainerPsikolog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.darkModeCard,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(widget.kiriAtas),
          topRight: Radius.circular(widget.kananAtas),
          bottomLeft: Radius.circular(widget.kiriBawah),
          bottomRight: Radius.circular(widget.kananBawah),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 120,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 165,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.name,
                  style: TextStyles.bold_18,
                ),
                Text(
                  widget.speciality,
                  style: TextStyles.light_14,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.activeCalendar),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          const FaIcon(
                            Icons.work,
                            color: Colors.white,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${widget.years} years",
                            style: TextStyles.GR_12_light,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 20,
                      width: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.activeCalendar),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          const FaIcon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${widget.rating}",
                            style: TextStyles.GR_12_light,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Rp ${widget.price}",
                  style: TextStyles.medium_18,
                )
              ],
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              CustomElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const PsychologistDetailPage()),
                    ),
                  );
                },
                width: 80,
                height: 30,
                text: "Chat",
                buttonTextStyle: TextStyles.bold_14,
                buttonStyle: CustomButtonStyles.buttonBlue,
              ),
            ],
          )
        ],
      ),
    );
  }
}
