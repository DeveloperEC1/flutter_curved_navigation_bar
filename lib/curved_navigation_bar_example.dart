import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CurvedNavigationBarExample extends StatefulWidget {
  CurvedNavigationBarExample({Key key}) : super(key: key);

  @override
  _CurvedNavigationBarExampleState createState() =>
      _CurvedNavigationBarExampleState();
}

class _CurvedNavigationBarExampleState
    extends State<CurvedNavigationBarExample> {
  int pageIndex = 0;

  Widget showPage = Text('Page one');

  Widget pageChooser(int page) {
    switch (page) {
      case 0:
        return Text('Page one');
        break;
      case 1:
        return Text('Page two');
        break;
      case 2:
        return Text('Page three');
        break;
      default:
        return Container(
          child: Text('No page found'),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: pageIndex,
        height: 50,
        items: <Widget>[
          Icon(Icons.ac_unit),
          Icon(Icons.access_alarm),
          Icon(Icons.account_balance),
        ],
        color: Color(0xff2cbbba),
        buttonBackgroundColor: Color(0xff2cbbba),
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (int tappedIndex) {
          Future.delayed(
            Duration(milliseconds: 600),
            () {
              setState(
                () {
                  showPage = pageChooser(tappedIndex);
                },
              );
            },
          );
        },
      ),
      body: Container(
        child: Center(
          child: showPage,
        ),
      ),
    );
  }
}
