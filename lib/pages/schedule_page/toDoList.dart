// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:selamat_application/styles/styles.dart';
// import 'package:selamat_application/widget/navbar.dart';
// import 'package:selamat_application/widget/searchBar.dart';
// import 'package:selamat_application/widget/widget_discovery/container_habits.dart';
// import 'package:selamat_application/widget/widget_discovery/container_profile_psikolog.dart';
// import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

// class ToDoList extends StatelessWidget {
//   ToDoList({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Schedule Page',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SchedulePage(),
//     );
//   }
// }

// class SchedulePage extends StatelessWidget {
//   // Sample event data
//   final List<Map<String, String>> events = [
//     {"title": "Start Date", "detail": "Wed, 22 Nov 2023"},
//     {"title": "Time", "detail": "19.00"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Schedule'),
//       ),
//       body: ListView.builder(
//         itemCount: events.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//               title: Text(events[index]['title']!),
//               trailing: Text('${events[index]['detail']}'));
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Add new event functionality here
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;
  bool _notification = false;
  bool _location = false;

  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date and Times',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.calendar_month),
                  SizedBox(width: 10),
                  Text('Start Date'),
                ],
              ),
              trailing: Text(
                  'Wed, 22 Nov 2023'), // Add your logic for language selection here
              onTap: () {
                // Add logic for language selection here
              },
            ),
            Divider(),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.alarm),
                  SizedBox(width: 10),
                  Text('Time'),
                ],
              ),
              trailing:
                  Text('19:00'), // Add your logic for language selection here
              onTap: () {
                // Add logic for language selection here
              },
            ),
            Divider(),
            SwitchListTile(
              activeColor: Colors.blue,
              title: Row(
                children: [
                  Icon(Icons.repeat),
                  SizedBox(width: 10),
                  Text('Repeat'),
                ],
              ),
              value: _notification,
              onChanged: (bool value) {
                setState(() {
                  _notification = value;
                });
              },
            ),
            Text(
              'Task Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.visibility),
                  SizedBox(width: 10),
                  Text('Visibility'),
                ],
              ),
              trailing:
                  Text('Public '), // Add your logic for language selection here
              onTap: () {
                // Add logic for language selection here
              },
            ),
            Divider(),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.category),
                  SizedBox(width: 10),
                  Text('Category'),
                ],
              ),
              trailing:
                  Text('None'), // Add your logic for language selection here
              onTap: () {
                // Add logic for language selection here
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.description),
              title: Text('Description'),
              subtitle: TextField(
                controller: _textFieldController,
                decoration: InputDecoration(
                  hintText: "Add some description",
                ),
                onChanged: (text) {
                  // Handle changes to the text field
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
