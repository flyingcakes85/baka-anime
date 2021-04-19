import 'package:flutter/material.dart';
import 'package:animeapidemo/consts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About",
          style: Consts.appTitleTextStyle,
        ),
        backgroundColor: Consts.APP_BAR_COLOR,
      ),
      backgroundColor: Consts.BACKGROUND_COLOR,
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  color: Colors.black,
                  elevation: 12,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(22)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.22),
                              BlendMode.dstATop),
                          image: NetworkImage(Consts.PROFILE_PIC_URL),
                        ),
                      ),
                      padding: EdgeInsets.all(18),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 27,
                                backgroundImage:
                                    NetworkImage(Consts.PROFILE_PIC_URL),
                              ),
                              SizedBox(width: 18),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Consts.NICK,
                                    style: GoogleFonts.robotoMono(fontSize: 18),
                                  ),
                                  Text(
                                    Consts.NAME,
                                    style: GoogleFonts.sourceSansPro(),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    Consts.ABOUT_TEXT,
                                    style: GoogleFonts.sourceSansPro(),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                onPressed: () async {
                                  if (await canLaunch(
                                      Consts.GITHUB_PROFILE_URL))
                                    await launch(Consts.GITHUB_PROFILE_URL);
                                  else
                                    // can't launch url, there is some error
                                    throw "Could not launch ${Consts.GITHUB_PROFILE_URL}";
                                },
                                child: Row(children: [
                                  Icon(
                                    Icons.code,
                                    color: Consts.shade,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    "GITHUB",
                                    style: TextStyle(color: Consts.shade),
                                  ),
                                ]),
                              ),
                              SizedBox(width: 2),
                              TextButton(
                                onPressed: () {
                                  Get.to(() => LicensePage());
                                },
                                child: Row(children: [
                                  Icon(
                                    Icons.approval,
                                    color: Consts.shade,
                                  ),
                                  Text(
                                    "LICENSE",
                                    style: TextStyle(color: Consts.shade),
                                  ),
                                ]),
                              ),
                            ],
                          )
                        ],
                      )),
                ),
              ),
              SizedBox(height: 18),
              Text(
                Consts.DETAILS_GARBAGE,
                style: Consts.animeDetailsText,
              ),
              SizedBox(height: 18),
              Text(
                "Licensed under GNU GPL v3\nEnjoy freedom!",
                style: Consts.animeDetailsText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
