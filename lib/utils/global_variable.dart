import 'package:flutter/material.dart';
import 'package:selamat_application/pages/activity_page/activityPage.dart';
import 'package:selamat_application/pages/discovery_page/discoveryPage.dart';
import 'package:selamat_application/pages/home_page/homePage.dart';
import 'package:selamat_application/pages/schedule_page/afternoon_list.dart';
import 'package:selamat_application/pages/schedule_page/all_to_do_list.dart';
import 'package:selamat_application/pages/schedule_page/evening_list.dart';
import 'package:selamat_application/pages/schedule_page/morning_list.dart';
import 'package:selamat_application/pages/statistic_page/StatisticPage.dart';
import 'package:selamat_application/pages/schedule_page/schedulePage.dart';
import 'package:selamat_application/pages_psychologist/home_psychologist/homePagePsychologist.dart';
import 'package:selamat_application/pages_psychologist/profile_psychologist_page/profilePsychologistPage.dart';
import 'package:selamat_application/pages_psychologist/schedule_psychologist/schedulePsychologistPage.dart';

const homeScreenItems = [
  HomePage(),
  DiscoveryPage(),
  SchedulePage(),
  ActivityPage(),
  StatisticPage(),
];

const psychologistScreenItems = [
  HomePagePsychologist(),
  SchedulePsychologistPage(),
  Text("Chat"),
  ProfilePsychologistPage(),
];

const scheduleScreenItems = [
  AllToDoList(),
  MorningList(),
  AfternoonList(),
  EveningList(),
];

int global_todaysWorkTime = 0;