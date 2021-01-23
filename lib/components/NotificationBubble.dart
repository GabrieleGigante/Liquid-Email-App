import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_email/res.dart';

class NotificationBubble extends StatelessWidget {
  Color color;
  int number;
  NotificationBubble(this.color, this.number);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(5), color: color),
      width: 16,
      height: 16,
      child: Center(
          child: Text(
        number.toString(),
        style: GoogleFonts.firaMono(
            color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
        softWrap: true,
      )),
    );
  }
}
