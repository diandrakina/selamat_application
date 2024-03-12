import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/pages/discovery_page/discoverPsychologist.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
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
                        builder: ((context) => const DiscoverPsychologist()),
                      ),
                    );
                  },
                ),
                const Padding(padding: EdgeInsets.all(5)),
                Text(
                  "Transaction History",
                  style: TextStyles.bold_30,
                ),
              ],
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
                    "06 February 2024",
                    style: TextStyles.medium_18,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildContainerPsikolog(
                      "Joeliardo Gerald, S.Psi., M.Psi.",
                      'assets/images/discovery_page/psikolog/Joel.jpeg',
                      "Work life balance consultant",
                      true,
                      6),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "16 February 2024",
                    style: TextStyles.medium_18,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildContainerPsikolog(
                      "Joeliardo Gerald, S.Psi., M.Psi.",
                      'assets/images/discovery_page/psikolog/Joel.jpeg',
                      "Work life balance consultant",
                      false,
                      6),
                ],
              ),
            ),
          )),
    );
  }

  Widget _buildContainerPsikolog(
      String name, String photo, String desc, bool status, double time) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 170,
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.darkModeCard),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(photo),
                radius: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyles.bold_18,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      desc,
                      style: TextStyles.medium_16,
                    ),
                    Text(
                      "$time hour(s) session",
                      style: TextStyles.medium_16,
                    ),
                  ],
                ),
              ),
              status
                  ? Text(
                      'Completed',
                      style: TextStyles.completed,
                    )
                  : Text(
                      "On Progress",
                      style: TextStyles.onProgress,
                    ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Padding(padding: EdgeInsets.only(left: 70)),
              CustomElevatedButton(
                text: "Receipt",
                buttonStyle: CustomButtonStyles.buttonNotSure,
                buttonTextStyle: TextStyles.bold_16,
                height: 30,
                width: 120,
              ),
              const SizedBox(
                width: 10,
              ),
              CustomElevatedButton(
                text: "Chat",
                buttonStyle: CustomButtonStyles.buttonBlue,
                buttonTextStyle: TextStyles.bold_16,
                height: 30,
                width: 120,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
