import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:liquid_email/components/Email.dart';
import 'package:liquid_email/objects/EmailObj.dart';
import 'package:liquid_email/res.dart';

class EmailPage extends StatefulWidget {
  String title;
  List<EmailObj> data;
  EmailPage(this.title, this.data);

  @override
  _EmailPageState createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  ScrollController sCtrl = new ScrollController();
  Color titleColor = textColor;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.title == "Promotions") {
      titleColor = promotionsColors;
    }
    if (widget.title == "Inbox") {
      titleColor = inboxColor;
    }
    if (widget.title == "Social") {
      titleColor = socialColor;
    }
    return Theme(
      data: ThemeData(accentColor: Colors.red),
      child: Scaffold(
        backgroundColor: bgcolor,
        body: widget.data.length > 0
            ? Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.title,
                                style: pf.headline1.apply(color: titleColor)),
                            IconButton(
                              padding: const EdgeInsets.all(0),
                              icon: Icon(
                                Icons.search_sharp,
                                size: 24,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 8,
                      child: ListView.builder(
                        reverse: true,
                        controller: sCtrl,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(0),
                        itemCount: widget.data.length,
                        itemBuilder: (BuildContext context, int i) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Builder(builder: (context) {
                              if (widget.title.toLowerCase() == 'inbox') {
                                return Email(
                                    color: titleColor, data: widget.data[i]);
                              } else if (widget.title.toLowerCase() ==
                                  widget.data[i].category.toLowerCase()) {
                                return Email(
                                    color: titleColor, data: widget.data[i]);
                              } else {
                                return Container();
                              }
                            }),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: SizedBox(
                height: 75,
                width: 75,
                child: CircularProgressIndicator(),
              )),
      ),
    );
  }
}
