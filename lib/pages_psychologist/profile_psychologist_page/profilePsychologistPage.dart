import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';

class ProfilePsychologistPage extends StatefulWidget {
  const ProfilePsychologistPage({super.key});

  @override
  State<ProfilePsychologistPage> createState() =>
      _ProfilePsychologistPageState();
}

class _ProfilePsychologistPageState extends State<ProfilePsychologistPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: double.maxFinite,
          toolbarHeight: 60,
          backgroundColor: AppColors.bgDarkMode,
        ),

        //BODY
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),

              //PROFILE
              Container(
                padding: const EdgeInsets.all(20),
                height: 400,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppColors.darkModeCard,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 50,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 180,
                              child: Text(
                                "Song Eunseok, M.Psi",
                                style: TextStyles.bold_24,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            Text(
                              "Code : A114AG17",
                              style: TextStyles.medium_18,
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //Email
                    Text(
                      "Email",
                      style: TextStyles.bold_18,
                    ),
                    Text("songeunseok001@selamat.ac.id",
                        style: TextStyles.medium_18),
                    const SizedBox(
                      height: 10,
                    ),
                    //Phone
                    Text(
                      "Phone",
                      style: TextStyles.bold_18,
                    ),
                    Text("+6289761527592", style: TextStyles.medium_18),
                    const SizedBox(
                      height: 10,
                    ),
                    //DOB
                    Text(
                      "Date of Birth",
                      style: TextStyles.bold_18,
                    ),
                    Text("March 19, 2001", style: TextStyles.medium_18),
                    const SizedBox(
                      height: 10,
                    ),
                    //Experience
                    Text(
                      "Experience",
                      style: TextStyles.bold_18,
                    ),
                    Text("2 year(s)", style: TextStyles.medium_18),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              Container(
                padding: const EdgeInsets.all(20),
                height: 200,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppColors.darkModeCard,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      "Patient Review",
                      style: TextStyles.bold_18,
                    ),
                    Row(
                      children: [
                        //RATING
                        Column(
                          children: [
                            Text(
                              "4.9",
                              style: TextStyles.rating,
                            ),
                            const Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.solidStar,
                                  size: 15,
                                  color: Colors.yellow,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                FaIcon(
                                  FontAwesomeIcons.solidStar,
                                  size: 15,
                                  color: Colors.yellow,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                FaIcon(
                                  FontAwesomeIcons.solidStar,
                                  size: 15,
                                  color: Colors.yellow,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                FaIcon(
                                  FontAwesomeIcons.solidStar,
                                  size: 15,
                                  color: Colors.yellow,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                FaIcon(
                                  FontAwesomeIcons.solidStar,
                                  size: 15,
                                  color: Colors.yellow,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
