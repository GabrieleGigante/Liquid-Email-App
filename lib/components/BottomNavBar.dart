import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:liquid_email/components/Email.dart';
import 'package:liquid_email/components/NotificationBubble.dart';
import 'package:liquid_email/objects/EmailObj.dart';
import 'package:liquid_email/pages/EmailPage.dart';
import 'package:liquid_email/res.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  //List<String> items = ['Inbox', 'Promotions', 'Social', 'Other'];
  int selected;

  List<IconData> selIcons = [
    Icons.inbox,
    Icons.local_offer,
    Icons.people_alt,
    Icons.more_horiz,
  ];
  List<IconData> unselIcons = [
    Icons.inbox_outlined,
    Icons.local_offer_outlined,
    Icons.people_alt_outlined,
    Icons.more_horiz_outlined,
  ];

  Map<String, Widget> items = {
    'Inbox': Icon(
      Icons.inbox_outlined,
      size: 28,
      color: textColor,
    ),
    'Promotions': Icon(
      Icons.local_offer_outlined,
      size: 28,
      color: textColor,
    ),
    'Social': Icon(
      Icons.people_alt_outlined,
      size: 28,
      color: textColor,
    ),
    'Others': Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(
          Icons.more_horiz_outlined,
          size: 28,
          color: textColor,
        ),
        Positioned(
          top: -10,
          right: -10,
          child: NotificationBubble(Color.fromARGB(255, 255, 0, 0), 5),
        ),
      ],
    ),
  };
  List<EmailObj> data;
  List<int> counter;

  @override
  void initState() {
    data = [];
    selected = 0;
    getData();
    super.initState();
  }

  void getData() async {
    DefaultAssetBundle.of(context)
        .loadString("assets/json/Emails.json")
        .then((value) {
      var tempData = jsonDecode(value.toString());
      List<EmailObj> emails = [];
      List<int> emailCounter = List<int>.filled(4, 0);
      for (var e in tempData) {
        var tempEmail = EmailObj.fromJson(jsonEncode(e));
        emailCounter[0] += 1;
        if (tempEmail.category.toLowerCase() == 'promotions') {
          emailCounter[1] += 1;
        }
        if (tempEmail.category.toLowerCase() == 'social') {
          emailCounter[2] += 1;
        }
        emails.add(tempEmail);
      }
      print(emails.toString());
      setState(() {
        counter = emailCounter;
        data = emails;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EmailPage(items.keys.elementAt(selected), data),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(height: 1, thickness: 2),
          SizedBox(
            height: 80,
            child: Theme(
              data: ThemeData(primaryColor: bgcolor),
              child: BottomNavigationBar(
                showUnselectedLabels: false,
                showSelectedLabels: false,
                elevation: 0,
                backgroundColor: bgcolor,
                unselectedItemColor: bgcolor,
                type: BottomNavigationBarType.fixed,
                onTap: (val) {
                  setState(() {
                    selected = val;
                  });
                },
                items: [
                  for (var i = 0; i < items.length; i++)
                    BottomNavigationBarItem(
                        icon: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Icon(
                              selected == i ? selIcons[i] : unselIcons[i],
                              size: 28,
                              color: textColor,
                            ),
                            Positioned(
                              top: -10,
                              right: -10,
                              child: Builder(builder: (context) {
                                Color bubbleColor = Colors.black87;
                                if (i == 0) bubbleColor = inboxColor;
                                if (i == 1) bubbleColor = promotionsColors;
                                if (i == 2) bubbleColor = socialColor;
                                return NotificationBubble(
                                    bubbleColor, counter[i]);
                              }),
                            ),
                          ],
                        ),
                        label: items.keys.elementAt(i))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
