import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:selamat_application/models/user.dart';
import 'package:selamat_application/pages/schedule_page/categoriesPage.dart';
import 'package:selamat_application/pages/schedule_page/visibilityPage.dart';
import 'package:selamat_application/providers/user_provider.dart';
import 'package:selamat_application/resources/firestore_methods.dart';
import 'package:selamat_application/resources/storage_methods.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/utils/richie_utils.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

// BUAT BIKIN TO DO LIST (TOMBOL ADD)

class ToDoListWithData extends StatefulWidget {
  final snap;
  ToDoListWithData({super.key, required this.snap});

  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoListWithData> {
  Uint8List? _image;
  String _photoUrl = '';
  String _title = "Add Title";
  DateTime _startDate = DateTime.now();
  bool _notification = false; // repeat
  List<int> _repeatDate = List.filled(7, 0);

  String _visibility = "Public";
  String _category = "None";
  String _description = "";
  bool _isDone = false;

  bool _reminder = false;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  bool _isLoading = false;
  // int? selectedDay;

  @override
  void initState() {
    super.initState();
    if (widget.snap['repatDate'][0] == 0 &&
        widget.snap['repatDate'][1] == 0 &&
        widget.snap['repatDate'][2] == 0 &&
        widget.snap['repatDate'][3] == 0 &&
        widget.snap['repatDate'][4] == 0 &&
        widget.snap['repatDate'][5] == 0 &&
        widget.snap['repatDate'][6] == 0) {
      _notification = false;
    } else {
      _notification = true;
    }
    _photoUrl = widget.snap['iconUrl'];
    print('1 ${_photoUrl}');
    _title = widget.snap['title'];
    // print('2 ${_title}');
    _startDate = widget.snap['startDate'].toDate();
    // print('3 ${_startDate}');
    _repeatDate = List.from(widget.snap['repatDate']);
    // _repeatDate = widget.snap['repatDate'];
    // print('4 ${_repeatDate}');
    _visibility = widget.snap['visibility'];
    // print('5 ${_visibility}');
    _category = widget.snap['category'];
    // print('6 ${_category}');
    _description = widget.snap['description'];
    // print('7 ${_description}');
    _reminder = widget.snap['reminder'];
    // print('8 ${_reminder}');
    _isDone = widget.snap['isDone'];
  }

  void clearImage() {
    setState(() {
      _image = null;
    });
  }

  void updateToDo(String uid) async {
    setState(() {
      _isLoading = true;
    });
    String _photoUrlConfirmed = _photoUrl;

    try {
      if (_image != null) {
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('toDoIcons', _image!, true);
        _photoUrlConfirmed = photoUrl;
      }
      String res = await FirestoreMethods().updateToDoList(
        widget.snap['toDoId'],
        uid,
        _photoUrlConfirmed,
        _isDone,
        _title,
        _startDate,
        _repeatDate,
        _visibility,
        _category,
        _description,
        _reminder,
      );
      if (res == 'success') {
        showSnackBar("Task Updated!", context);
        clearImage();
        setState(() {
          _isLoading = false;
        });
      } else {
        showSnackBar(res, context);
        setState(() {
          _isLoading = true;
        });
      }
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  void pickTime() async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_startDate),
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null) {
      setState(
        () {
          // _time= timeOfDay;

          _startDate = DateTime(
            _startDate.year,
            _startDate.month,
            _startDate.day,
            timeOfDay.hour,
            timeOfDay.minute,
          );
        },
      );
    }
  }

  void pickDate() async {
    final DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );
    if (dateTime != null) {
      setState(() {
        _startDate = dateTime;
      });
    }
  }

  _changeRepeatDateSelected(int index) {
    print(_startDate);
    setState(
      () {
        if (_repeatDate[index] == 1) {
          _repeatDate[index] = 0;
        } else {
          _repeatDate[index] = 1;
        }
      },
    );
  }

  Widget _repeatedDay(String day, int index) {
    return GestureDetector(
      onTap: () {
        _changeRepeatDateSelected(index);
      },
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: _repeatDate[index] == 1
              // color: 1 == 1
              ? AppColors.baseColor
              : AppColors.activeCalendar,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            day,
            style: TextStyles.bold_18,
          ),
        ),
      ),
    );
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void changeTitle() {
    setState(() {
      _title = _titleController.text;
    });
  }

  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;

    try {} catch (e) {
      print(e.toString());
    }

    return SafeArea(
      child: Scaffold(
        //APPBAR
        appBar: AppBar(
          toolbarHeight: 60,
          leadingWidth: double.maxFinite,
          elevation: 0.0,
          backgroundColor: AppColors.bgDarkMode,
          leading: Row(
            children: [
              const Padding(padding: EdgeInsets.all(5)),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const FaIcon(
                  Icons.arrow_back,
                  color: AppColors.white,
                  size: 25,
                ),
              ),
              const SizedBox(
                width: 250,
              ),
              InkWell(
                onTap: () {
                  updateToDo(user.uid);
                  Navigator.of(context).pop();
                },
                child: Container(
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.white,
                          ),
                        )
                      : Text(
                          "Update",
                          style: TextStyles.bold_14,
                        ),
                  height: 30,
                  width: 80,
                  alignment: Alignment.center,
                  // padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    color: AppColors.bluePowderDarker,
                  ),
                ),
              ),
            ],
          ),
        ),

        //BODY
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        _image != null
                            ? CircleAvatar(
                                radius: 64,
                                backgroundImage: MemoryImage(
                                  _image!,
                                ),
                              )
                            : CircleAvatar(
                                radius: 64,
                                backgroundImage: NetworkImage(_photoUrl),
                              ),
                        Positioned(
                          bottom: -10,
                          left: 80,
                          child: IconButton(
                            onPressed: selectImage,
                            icon: const Icon(
                              Icons.add_a_photo,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //ADD TITLE
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.pastelGreenHealth),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        // Text(
                        //   '${_title}',
                        //   style: TextStyles.bold_30,
                        // ),
                        Container(
                          constraints:
                              BoxConstraints(minWidth: 70, maxWidth: 200),
                          child: IntrinsicWidth(
                            child: TextField(
                              onChanged: (val) {
                                setState(() {
                                  _title = val;
                                });
                              },
                              style: TextStyles.bold_30,
                              controller: _titleController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: _title,
                                hintStyle: TextStyles.bold_30,
                                contentPadding: const EdgeInsets.all(8),
                                // border: .
                              ),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                            ),
                          ),
                        ),
                        // const SizedBox(
                        //   width: 20,
                        // ),
                        IconButton(
                          onPressed: changeTitle,
                          icon: const FaIcon(
                            FontAwesomeIcons.pen,
                            color: Colors.white,
                            size: 20,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //CONTENT
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //DATE AND TIMES
                    Text(
                      'Date and Times',
                      style: TextStyles.bold_24,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.inactiveTask,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () => pickDate(),
                            title: Row(
                              children: [
                                const FaIcon(
                                  Icons.calendar_month,
                                  color: AppColors.white,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Start Date',
                                  style: TextStyles.light_18,
                                ),
                              ],
                            ),
                            trailing: Text(
                              // 'Wed, 22 Nov 2023',
                              // DateFormat.yMMMd().format(
                              //     widget.snap['datePublished'].toDate()),
                              "${DateFormat.E().format(_startDate)}, ${DateFormat.d().format(_startDate)} ${DateFormat.MMM().format(_startDate)} ${DateFormat.y().format(_startDate)}",
                              style: TextStyles.light_18,
                            ), // Add your logic for language selection here
                          ),
                          const Divider(
                            height: 5,
                          ),
                          ListTile(
                            onTap: () => pickTime(),
                            title: Row(
                              children: [
                                const FaIcon(
                                  Icons.alarm,
                                  color: AppColors.white,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Time',
                                  style: TextStyles.light_18,
                                ),
                              ],
                            ),
                            trailing: Text(
                              // '${_time.hour}:${_time.minute}',
                              '${_startDate.hour}:${_startDate.minute}',
                              style: TextStyles.light_18,
                              // "a"
                            ),
                          ),
                          const Divider(
                            height: 5,
                          ),
                          Column(
                            children: [
                              SwitchListTile(
                                activeColor: AppColors.baseColor,
                                inactiveTrackColor: AppColors.inactiveTask,
                                inactiveThumbColor: Colors.white,
                                title: Row(
                                  children: [
                                    const Icon(Icons.repeat,
                                        color: AppColors.white),
                                    const SizedBox(width: 10),
                                    Text('Repeat', style: TextStyles.light_18),
                                  ],
                                ),
                                value: _notification,
                                onChanged: (bool value) {
                                  setState(
                                    () {
                                      _notification = value;
                                    },
                                  );
                                },
                              ),

                              //CONDITION TRUE
                              if (_notification)
                                Container(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        _repeatedDay("M", 0),
                                        _repeatedDay("T", 1),
                                        _repeatedDay("W", 2),
                                        _repeatedDay("T", 3),
                                        _repeatedDay("F", 4),
                                        _repeatedDay("S", 5),
                                        _repeatedDay("S", 6),
                                      ],
                                    ))
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //TASK DETAILS
                    Text(
                      'Task Details',
                      style: TextStyles.bold_24,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.inactiveTask,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () async {
                              final visStatus = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VisibilityPage(),
                                ),
                              );
                              setState(() {
                                _visibility = visStatus;
                              });
                            },
                            title: Row(
                              children: [
                                const Icon(
                                  Icons.visibility,
                                  color: AppColors.white,
                                ),
                                const SizedBox(width: 10),
                                Text('Visibility', style: TextStyles.light_18),
                              ],
                            ),
                            trailing: Container(
                              constraints: BoxConstraints(maxWidth: 150),
                              child: Text('${_visibility}',
                                  style: TextStyles.light_18),
                            ), // Add your logic for language selection here
                          ),
                          const Divider(
                            height: 5,
                          ),
                          ListTile(
                            onTap: () async {
                              final categoryStatus = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CategoriesPage(),
                                ),
                              );
                              setState(() {
                                _category = categoryStatus;
                              });
                            },
                            title: Row(
                              children: [
                                const Icon(Icons.category,
                                    color: AppColors.white),
                                const SizedBox(width: 10),
                                Text('Category', style: TextStyles.regular_18),
                              ],
                            ),
                            trailing: Container(
                              constraints: BoxConstraints(maxWidth: 150),
                              child: Text('${_category}',
                                  style: TextStyles.light_18),
                            ), // Add your logic for language selection here
                          ),
                          const Divider(
                            height: 5,
                          ),
                          ListTile(
                            leading: const Icon(Icons.description,
                                color: AppColors.white),
                            title:
                                Text('Description', style: TextStyles.light_18),
                            subtitle: TextField(
                              style: TextStyles.light_14,
                              controller: _descriptionController,
                              decoration: InputDecoration(
                                hintText: _description.isEmpty
                                    ? "Add some description"
                                    : _description,
                                hintStyle: TextStyles.light_14,
                                contentPadding: const EdgeInsets.all(4),
                              ),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              onChanged: (val) {
                                setState(() {
                                  _description = val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //REMINDERS
                    Text(
                      'Reminders',
                      style: TextStyles.bold_24,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.inactiveTask,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          SwitchListTile(
                            activeColor: AppColors.baseColor,
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: AppColors.inactiveTask,
                            title: Row(
                              children: [
                                const Icon(
                                  Icons.notifications_on,
                                  color: AppColors.white,
                                ),
                                const SizedBox(width: 10),
                                Text('Reminder', style: TextStyles.light_18),
                              ],
                            ),
                            value: _reminder,
                            onChanged: (bool value) {
                              setState(() {
                                _reminder = value;
                              });
                            },
                          ),

                          //CONDITION TRUE
                          if (_reminder)
                            Container(
                              padding: EdgeInsets.zero,
                              child: Column(
                                children: [
                                  const Divider(
                                    height: 5,
                                  ),
                                  ListTile(
                                    leading: const FaIcon(
                                        FontAwesomeIcons.bullhorn,
                                        color: AppColors.white),
                                    title: Text('Encouragement',
                                        style: TextStyles.light_18),
                                    subtitle: TextField(
                                      controller: _textFieldController,
                                      decoration: InputDecoration(
                                          hintText: "Add some description",
                                          hintStyle: TextStyles.light_14),
                                      onChanged: (text) {
                                        // Handle changes to the text field
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
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
