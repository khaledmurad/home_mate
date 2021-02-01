import 'package:flutter/material.dart';
import 'package:mate/auth/register.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageTemplete extends StatelessWidget {
  final int activePage;
  final String imagePath;
  final String title;

  HomePageTemplete({this.activePage, this.imagePath, this.title});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    imagePath,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 24 ,right: 24, top: 20),
            constraints: BoxConstraints(minWidth: size.height * 0.4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 26.0,
                    height: 1.5,
                    color: Color.fromRGBO(33, 45, 82, 1),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  // We are making a 3 page page view
                  children: List.generate(
                    3,
                        (index) => Container(
                      width: index == activePage ? 22.0 : 10.0,
                      height: 10.0,
                      margin: EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(index == activePage ? 10.0 : 50.0),
                        color: index == activePage
                            ? Theme.of(context).primaryColor
                            : Color.fromRGBO(71, 148, 255, 0.3),
                      ),
                    ),
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

