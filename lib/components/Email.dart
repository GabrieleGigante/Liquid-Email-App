import 'package:flutter/material.dart';
import 'package:liquid_email/objects/EmailObj.dart';
import 'package:liquid_email/res.dart';

class Email extends StatelessWidget {
  String sender;
  String object;
  String body;
  bool read;
  Color color;
  EmailObj data;

  Email(
      {this.data,
      this.sender = "email@example.com",
      this.object = "Hello, this is an email",
      this.body = "Lorem Ipsum sit dolor amet atro caaxosdmfjsdnkfn ksjdnfkjn",
      this.read = true,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .13,
        width: MediaQuery.of(context).size.width - 40,
        child: Material(
          elevation: 0,
          borderRadius: BorderRadius.circular(5),
          color: data.isRead ? bgcolor : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                            child: SizedBox(
                                height: 16,
                                width: 16,
                                child: Image.network(data.icon)),
                          ),
                          Text(
                            data.sender,
                            style: pf.headline6,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 1,
                          ),
                        ],
                      ),
                      Text(
                        data.object,
                        style: pf.bodyText1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 1,
                      ),
                      Text(
                        data.body,
                        style: pf.bodyText1.apply(color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 1,
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    data.time,
                    style: pf.headline2.apply(color: color),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
