import 'package:flutter/material.dart';
import 'package:scroll/indexedstack/first_page.dart';
import 'package:scroll/indexedstack/second_page.dart';

class IndexedStackScrool extends StatefulWidget {
  IndexedStackScrool({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _IndexedStackScroolState createState() => _IndexedStackScroolState();
}

class _IndexedStackScroolState extends State<IndexedStackScrool> {

  int _selectedPage = 0;
  List<Widget> pageList = List<Widget>();

  @override
  void initState() {
    pageList.add(FirstPage());
    pageList.add(SecondPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: IndexedStack(
        index: _selectedPage,
        children: pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_android),
            title: Text('First Page'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_android),
            title: Text('Second Page'),
          ),
        ],
        currentIndex: _selectedPage,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}