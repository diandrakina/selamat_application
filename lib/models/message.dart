import 'package:selamat_application/models/user.dart';
import 'package:flutter/material.dart';

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.unread,
  });
}

// YOU - current user
final User currentUser = User(
  uid: 0,
  fullName: 'Greg',
  email: 'greg@example.com',
  dateOfBirth: '1990-01-01',
  profilePicUrl: 'assets/images/login_page/facebook_logo.png',
  startHour: 8,
  startMinute: 0,
  userGoal: 'Exercise daily',
  endHour: 18,
  endMinute: 0,
  userTarget: 'Stay healthy and fit',
  bio: 'Passionate about fitness and wellness.',
  phoneNum: '+1234567890',
);

// USERS
final User greg = User(
  uid: 1,
  fullName: 'Greg',
  email: 'greg@example.com',
  dateOfBirth: '1990-01-01',
  profilePicUrl: 'assets/images/login_page/facebook_logo.png',
  startHour: 8,
  startMinute: 0,
  userGoal: 'Exercise daily',
  endHour: 18,
  endMinute: 0,
  userTarget: 'Stay healthy and fit',
  bio: 'Passionate about fitness and wellness.',
  phoneNum: '+1234567890',
);

final User james = User(
  uid: 2,
  fullName: 'James',
  email: 'james@example.com',
  dateOfBirth: '1985-05-15',
  profilePicUrl: 'assets/images/login_page/facebook_logo.png',
  startHour: 7,
  startMinute: 30,
  userGoal: 'Learn something new everyday',
  endHour: 17,
  endMinute: 30,
  userTarget: 'Improve skills and knowledge',
  bio: 'Tech enthusiast and lifelong learner.',
  phoneNum: '+1987654321',
);

final User john = User(
  uid: 3,
  fullName: 'John',
  email: 'john@example.com',
  dateOfBirth: '1978-11-20',
  profilePicUrl: 'assets/images/login_page/facebook_logo.png',
  startHour: 9,
  startMinute: 0,
  userGoal: 'Read books regularly',
  endHour: 19,
  endMinute: 0,
  userTarget: 'Expand knowledge and perspectives',
  bio: 'Bookworm and avid reader.',
  phoneNum: '+1122334455',
);

final User olivia = User(
  uid: 4,
  fullName: 'Olivia',
  email: 'olivia@example.com',
  dateOfBirth: '1992-07-10',
  profilePicUrl: 'assets/images/login_page/facebook_logo.png',
  startHour: 8,
  startMinute: 30,
  userGoal: 'Meditate daily',
  endHour: 18,
  endMinute: 30,
  userTarget: 'Achieve inner peace and mindfulness',
  bio: 'Yoga practitioner and mindfulness advocate.',
  phoneNum: '+1555555555',
);

final User sam = User(
  uid: 5,
  fullName: 'Sam',
  email: 'sam@example.com',
  dateOfBirth: '1983-04-25',
  profilePicUrl: 'assets/images/login_page/facebook_logo.png',
  startHour: 7,
  startMinute: 0,
  userGoal: 'Write code every day',
  endHour: 17,
  endMinute: 0,
  userTarget: 'Enhance coding skills and build projects',
  bio: 'Software developer and open-source enthusiast.',
  phoneNum: '+1666666666',
);

final User sophia = User(
  uid: 6,
  fullName: 'Sophia',
  email: 'sophia@example.com',
  dateOfBirth: '1995-09-08',
  profilePicUrl: 'assets/images/login_page/facebook_logo.png',
  startHour: 9,
  startMinute: 30,
  userGoal: 'Practice drawing regularly',
  endHour: 19,
  endMinute: 30,
  userTarget: 'apa',
  bio: 'Art lover and aspiring illustrator.',
  phoneNum: '+1777777777',
);

final User steven = User(
  uid: 7,
  fullName: 'Steven',
  email: 'steven@example.com',
  dateOfBirth: '1980-12-12',
  profilePicUrl: 'assets/images/login_page/facebook_logo.png',
  startHour: 8,
  startMinute: 0,
  userGoal: 'Run or jog daily',
  endHour: 18,
  endMinute: 0,
  userTarget: 'Stay active and maintain fitness',
  bio: 'Running enthusiast and marathon runner.',
  phoneNum: '+1888888888',
);

// FAVORITE CONTACTS
List<User> favorites = [sam, steven, olivia, john, greg];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: true,
  ),
  Message(
    sender: olivia,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: true,
  ),
  Message(
    sender: john,
    time: '3:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
  Message(
    sender: sophia,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: true,
  ),
  Message(
    sender: steven,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
  Message(
    sender: sam,
    time: 'Yesterday',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
  Message(
    sender: greg,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:15 PM',
    text: 'All the food',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
    unread: true,
  ),
  Message(
    sender: james,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    unread: true,
  ),
];
