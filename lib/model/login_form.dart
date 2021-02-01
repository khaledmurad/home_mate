import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'input_widget.dart';


class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Email",
                style: GoogleFonts.inter(
                  fontSize: 14.0,
                  color: Color.fromRGBO(138, 150, 191, 1),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              InputWidget(obscureText: false),
              SizedBox(height: 10.0),
              Text(
                "Password",
                style: GoogleFonts.inter(
                  fontSize: 14.0,
                  color: Color.fromRGBO(138, 150, 191, 1),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              InputWidget(obscureText: true),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ));
  }
}
