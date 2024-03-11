import 'package:flutter/material.dart';
import 'package:selamat_application/pages/activity_page/activityPage.dart';
import 'package:selamat_application/pages/discovery_page/discoveryPage.dart';
import 'package:selamat_application/pages/home_page/homePage.dart';
import 'package:selamat_application/pages/schedule_page/all_to_do_list.dart';
import 'package:selamat_application/pages/statistic_page/StatisticPage.dart';
import 'package:selamat_application/pages/schedule_page/schedulePage.dart';

const homeScreenItems = [
  HomePage(),
  DiscoveryPage(),
  SchedulePage(),
  ActivityPage(),
  StatisticPage(),
];

const psychologistScreenItems = [
  Text("HomePage"),
  Text("Discover"),
  Text("Schedule"),
  Text("Chat"),
  Text("Profile"),
];

const scheduleScreenItems = [
  AllToDoList(),
  Text("Morning"),
  Text("Afternoon"),
  Text("Evening"),
];
