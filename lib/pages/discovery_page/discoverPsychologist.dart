import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/navbar.dart';
import 'package:selamat_application/widget/widget_discovery/containerPsikolog.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

import '../../widget/widget_discovery/container_profile_psikolog.dart';

class DiscoverPsychologist extends StatefulWidget {
  const DiscoverPsychologist({super.key});

  @override
  State<DiscoverPsychologist> createState() => _DiscoverPsychologistState();
}

class _DiscoverPsychologistState extends State<DiscoverPsychologist> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          leadingWidth: double.maxFinite,
          leading: Container(
            color: AppColors.bgDarkMode,
            child: Row(
              children: [
                const Padding(padding: EdgeInsets.all(5)),
                const FaIcon(
                  Icons.arrow_back,
                  color: AppColors.white,
                  size: 25,
                ),
                const Padding(padding: EdgeInsets.all(5)),
                SizedBox(
                  width: 300,
                  child: Text(
                    "Psychologist",
                    style: TextStyles.bold_30,
                  ),
                ),
                const FaIcon(
                  Icons.history,
                  color: AppColors.white,
                  size: 30,
                )
              ],
            ),
          ),
        ),

        //BODY
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Featured Psychologist",
                  style: TextStyles.bold_24,
                ),
                const Padding(padding: EdgeInsets.all(8)),

                //CONTAINER PERTAMA
                const ContainerPsikolog(
                  image:
                      "assets/images/discovery_page/psikolog/ChenZheyuan.jpg",
                  name: "Chen Zheyuan",
                  price: "500.000",
                  rating: 5.0,
                  speciality: "Psikolog Klinis",
                  years: 23,
                  kiriAtas: 12,
                  kananAtas: 12,
                  kiriBawah: 0,
                  kananBawah: 0,
                ),
                const Divider(
                  color: AppColors.activeCalendar,
                  height: 0,
                  thickness: 2,
                ),
                const ContainerPsikolog(
                  image:
                      "assets/images/discovery_page/psikolog/ChenZheyuan.jpg",
                  name: "Chen Zheyuan",
                  price: "500.000",
                  rating: 5.0,
                  speciality: "Psikolog Klinis",
                  years: 23,
                  kiriAtas: 0,
                  kananAtas: 0,
                  kiriBawah: 12,
                  kananBawah: 12,
                ),
                const SizedBox(
                  height: 20,
                ),

                //OUR PSYCHOLOGIST
                Text(
                  "Our Psychologist",
                  style: TextStyles.bold_24,
                ),
                const Padding(padding: EdgeInsets.all(8)),
                const ContainerPsikolog(
                  image:
                      "assets/images/discovery_page/psikolog/ChenZheyuan.jpg",
                  name: "Chen Zheyuan",
                  price: "500.000",
                  rating: 5.0,
                  speciality: "Psikolog Klinis",
                  years: 23,
                  kiriAtas: 12,
                  kananAtas: 12,
                  kiriBawah: 0,
                  kananBawah: 0,
                ),

                const Divider(
                  color: AppColors.activeCalendar,
                  height: 0,
                  thickness: 2,
                ),
                const ContainerPsikolog(
                  image:
                      "assets/images/discovery_page/psikolog/ChenZheyuan.jpg",
                  name: "Chen Zheyuan",
                  price: "500.000",
                  rating: 5.0,
                  speciality: "Psikolog Klinis",
                  years: 23,
                  kiriAtas: 0,
                  kananAtas: 0,
                  kiriBawah: 0,
                  kananBawah: 0,
                ),

                const Divider(
                  color: AppColors.activeCalendar,
                  height: 0,
                  thickness: 2,
                ),
                const ContainerPsikolog(
                  image:
                      "assets/images/discovery_page/psikolog/ChenZheyuan.jpg",
                  name: "Chen Zheyuan",
                  price: "500.000",
                  rating: 5.0,
                  speciality: "Psikolog Klinis",
                  years: 23,
                  kiriAtas: 0,
                  kananAtas: 0,
                  kiriBawah: 0,
                  kananBawah: 0,
                ),

                const Divider(
                  color: AppColors.activeCalendar,
                  height: 0,
                  thickness: 2,
                ),

                const ContainerPsikolog(
                  image:
                      "assets/images/discovery_page/psikolog/ChenZheyuan.jpg",
                  name: "Chen Zheyuan",
                  price: "500.000",
                  rating: 5.0,
                  speciality: "Psikolog Klinis",
                  years: 23,
                  kiriAtas: 0,
                  kananAtas: 0,
                  kiriBawah: 0,
                  kananBawah: 0,
                ),

                const Divider(
                  color: AppColors.activeCalendar,
                  height: 0,
                  thickness: 2,
                ),

                const ContainerPsikolog(
                  image:
                      "assets/images/discovery_page/psikolog/ChenZheyuan.jpg",
                  name: "Chen Zheyuan",
                  price: "500.000",
                  rating: 5.0,
                  speciality: "Psikolog Klinis",
                  years: 23,
                  kiriAtas: 0,
                  kananAtas: 0,
                  kiriBawah: 0,
                  kananBawah: 0,
                ),

                const Divider(
                  color: AppColors.activeCalendar,
                  height: 0,
                  thickness: 2,
                ),
                const ContainerPsikolog(
                  image:
                      "assets/images/discovery_page/psikolog/ChenZheyuan.jpg",
                  name: "Chen Zheyuan",
                  price: "500.000",
                  rating: 5.0,
                  speciality: "Psikolog Klinis",
                  years: 23,
                  kiriAtas: 0,
                  kananAtas: 0,
                  kiriBawah: 12,
                  kananBawah: 12,
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: NavBar(),
      ),
    );
  }
}
