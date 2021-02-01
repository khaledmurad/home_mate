import 'package:flutter/material.dart';
import 'package:mate/auth/login.dart';
import 'package:mate/auth/register.dart';
import 'package:mate/model/home_page_templete.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController controller = PageController();
  int currentPage = 0;
  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        currentPage = controller.page.round();
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(
      children: [
        Container(
          height: MediaQuery.of(context).size.height*.75,
          child: PageView(
            controller: controller,
            children: [
              HomePageTemplete(
                activePage: currentPage,
                title: "Let's Find Peace with Comfort",
                imagePath: "assets/images/page1.png",
              ),
              HomePageTemplete(
                activePage: currentPage,
                title: "Let's Find Peace with Comfort",
                imagePath: "assets/images/page2.png",
              ),
              HomePageTemplete(
                activePage: currentPage,
                title: "Let's Find Peace with Comfort",
                imagePath: "assets/images/page1.png",
              ),
            ],
          ),
        ),SizedBox(
          height: 50.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
            },
            child: Container(
              width: double.infinity,
              height: ScreenUtil().setHeight(50.0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(169, 176, 185, 0.42),
                    spreadRadius: 0,
                    blurRadius: 8.0,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Center(
                child: Text(
                  "Get Started"  ,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: GoogleFonts.inter(
                  fontSize: 14.0,
                  color: Color.fromRGBO(64, 74, 106, 1),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                },
                child: Text(
                  "Log In",
                  style: GoogleFonts.inter(
                    fontSize: 14.0,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
      ],
    ));
  }
}
