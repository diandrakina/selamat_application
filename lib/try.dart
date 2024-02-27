import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController = PageController();
  int _currentPageIndex = 0;

  void _onTap(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Flutter'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  _onTap(0);
                },
                child: Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 18,
                    color: _currentPageIndex == 0 ? Colors.blue : Colors.black,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _onTap(1);
                },
                child: Text(
                  'Friends',
                  style: TextStyle(
                    fontSize: 18,
                    color: _currentPageIndex == 1 ? Colors.blue : Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              children: [
                Container(
                  color: Colors.green,
                  child: Center(
                    child: Text('Notifications Page'),
                  ),
                ),
                Container(
                  color: Colors.orange,
                  child: Center(
                    child: Text('Friends Page'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
