import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/psychologist_widget/chartRatingPsychologist.dart';

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
        body: SingleChildScrollView(
          child: Container(
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
                            backgroundImage: AssetImage(
                                'assets/images/discovery_page/psikolog/SongEunseok.jpg'),
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
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          //RATING
                          Column(
                            children: [
                              Text(
                                "4.5",
                                style: TextStyles.rating,
                              ),

                              //Bintang Rating
                              RatingBar.builder(
                                initialRating: 4.5,
                                minRating: 1,
                                itemSize: 15,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                itemBuilder: (context, _) => const Icon(
                                  FontAwesomeIcons.solidStar,
                                  color: Colors.yellow,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          //CHART
                          const ChartRatingPsychologist()
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
