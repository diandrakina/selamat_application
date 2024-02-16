import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/navbar.dart';
import 'package:selamat_application/widget/searchBar.dart';
import 'package:selamat_application/widget/widget_discovery/container_habits.dart';
import 'package:selamat_application/widget/widget_discovery/container_profile_psikolog.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({super.key});

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  PageController _carouselController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 60,
          leadingWidth: double.maxFinite,
          leading: Container(
            padding: EdgeInsets.only(left: 20, right: 15),
            color: AppColors.bgDarkMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Discovery',
                  style: TextStyles.bold_24,
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                CustomSearchBar(),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Featured Today",
                  style: TextStyles.bold_30,
                ),
                SizedBox(
                  height: 20,
                ),

                //KONTEN YG DISCROLL KE SAMPING
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      CarouselSlider(
                        items: [_buildPsikologProfile(context), _news(context)],
                        options:
                            CarouselOptions(viewportFraction: 1, height: 300),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < 2; i++)
                            _circularContainer(
                              margin: EdgeInsets.only(right: 10),
                            ),
                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Phsychologist",
                      style: TextStyles.bold_30,
                    ),
                    Padding(padding: EdgeInsets.all(25)),
                    Text(
                      "View More >",
                      style: TextStyles.regular_18,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                //PSIKOLOG
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  height: 110,
                  // color: Colors.amber,
                  width: double.maxFinite,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          child: ProfilePsikolog(
                              imagePsikolog:
                                  'assets/images/discovery_page/psikolog/ChenZheyuan.jpg',
                              namePsikolog: 'Chen Zheyuan'),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Container(
                          child: ProfilePsikolog(
                              imagePsikolog:
                                  'assets/images/discovery_page/psikolog/MarkLee.jpg',
                              namePsikolog: 'Mark Lee'),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Container(
                          child: ProfilePsikolog(
                              imagePsikolog:
                                  'assets/images/discovery_page/psikolog/ZhouYiran.jpg',
                              namePsikolog: 'Zhou Yiran'),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Container(
                          child: ProfilePsikolog(
                              imagePsikolog:
                                  'assets/images/discovery_page/psikolog/SongEunseok.jpg',
                              namePsikolog: 'Song Eunseok'),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Container(
                          child: ProfilePsikolog(
                              imagePsikolog:
                                  'assets/images/discovery_page/psikolog/Joel.jpeg',
                              namePsikolog: 'Joeliardo Leviothniel'),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Container(
                          child: ProfilePsikolog(
                              imagePsikolog:
                                  'assets/images/discovery_page/psikolog/ChenZheyuan.jpg',
                              namePsikolog: 'Chen Zheyuan'),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Container(
                          child: ProfilePsikolog(
                              imagePsikolog:
                                  'assets/images/discovery_page/psikolog/MarkLee.jpg',
                              namePsikolog: 'Mark Lee'),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Container(
                          child: ProfilePsikolog(
                              imagePsikolog:
                                  'assets/images/discovery_page/psikolog/ZhouYiran.jpg',
                              namePsikolog: 'Zhou Yiran'),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Container(
                          child: ProfilePsikolog(
                              imagePsikolog:
                                  'assets/images/discovery_page/psikolog/SongEunseok.jpg',
                              namePsikolog: 'Song Eunseok'),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Container(
                          child: ProfilePsikolog(
                              imagePsikolog:
                                  'assets/images/discovery_page/psikolog/Joel.jpeg',
                              namePsikolog: 'Joeliardo Leviothniel'),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Habits",
                      style: TextStyles.bold_30,
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    Text(
                      "View More >",
                      style: TextStyles.regular_18,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),

                //BUAT HABITS
                CarouselSlider(
                  items: [
                    Container(
                      width: 350,
                      child: ContainerHabits(
                          titleHabits: "Gym",
                          descHabits:
                              "Gym is the best idea for you who want to build a healthy life. You can go to the gym center or do in your bedroom.",
                          imageHabits: 'assets/images/discovery_page/gym.png'),
                    ),
                    Container(
                      width: 350,
                      child: ContainerHabits(
                          titleHabits: "Running",
                          descHabits:
                              "Let's run! Running is one of many cardios exercise. Run can improve your agility.",
                          imageHabits:
                              'assets/images/discovery_page/running.png'),
                    ),
                    Container(
                      width: 350,
                      child: ContainerHabits(
                          titleHabits: "Study Flutter",
                          descHabits:
                              "Study Flutter everyday can make us get the best mark in Software Engineering class. We can do it by watching youtube videos",
                          imageHabits:
                              'assets/images/discovery_page/study.png'),
                    ),
                  ],
                  options: CarouselOptions(
                      height: 270,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 1 / 1,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 2000),
                      viewportFraction: 0.8),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: NavBar(),
      ),
    );
  }

  Widget _buildPsikologProfile(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      height: 300,
      decoration: BoxDecoration(
        color: AppColors.activeCalendar,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 8)),
          Row(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets/images/discovery_page/psikolog/Joel.jpeg'),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "Joeliardo Gerald Leviothniel, S.Psi., M.Psi.",
                  style: TextStyles.bold_24,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Text(
              "Joeliardo Gerald is our built-in doctor he used to study in harvard medical school and harvard medical school, he is also have 16 years of experience.",
              style: TextStyles.GR_14_light,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            // color: Colors.amber,
            padding: EdgeInsets.only(bottom: 30),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CustomElevatedButton(
                    text: 'Psychologist',
                    height: 40,
                    width: 150,
                    buttonStyle: CustomButtonStyles.buttonBlue2,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 2,
                  child: CustomElevatedButton(
                    text: 'See Details',
                    height: 40,
                    width: 120,
                    buttonStyle: CustomButtonStyles.buttonBlue2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _news(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/discovery_page/catur.png"),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 30)),
          Row(
            children: [
              Expanded(
                child: Text(
                  "The Art of Thinking",
                  style: TextStyles.bold_24,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Text(
              "The Art of Thinking is the journey that will help you to think a lot and make a better decision, this is including upgrade your IQ and your Emotional Intelligence",
              style: TextStyles.GR_14_light,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Habits",
                style: TextStyles.medium_16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _circularContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Color bgColor;
  final Widget? child;
  const _circularContainer({
    super.key,
    this.height = 10,
    this.width = 40,
    this.radius = 24,
    this.padding = 0,
    this.margin,
    this.bgColor = AppColors.white,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 40,
      margin: margin,
      decoration: BoxDecoration(
          color: AppColors.activeCalendar,
          borderRadius: BorderRadius.circular(24)),
    );
  }
}
