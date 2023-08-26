import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    var fem = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Function 12'),
      ),
      body: SingleChildScrollView(
        child: Container(
          // leadsscreen82i (19:73)
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffe3edf7),
            boxShadow: [
              BoxShadow(
                color: Color(0x3f000000),
                offset: Offset(0 * fem, 4 * fem),
                blurRadius: 2 * fem,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // autogroupkrm1Azz (7JXizw1oqQUdbuZy3fKRm1)
                width: double.infinity,
                height: 121.5 * fem,
                child: Stack(
                  children: [
                    Positioned(
                      // appbarleadenquiryuhg (19:60)
                      left: 0 * fem,
                      top: 0 * fem,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(
                            17 * fem, 17 * fem, 20 * fem, 17 * fem),
                        width: 360 * fem,
                        height: 60 * fem,
                        decoration: BoxDecoration(
                          color: Color(0xffe3edf7),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3f000000),
                              offset: Offset(0 * fem, 3 * fem),
                              blurRadius: 2 * fem,
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // more6nA (19:65)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 2.5 * fem, 32 * fem, 0 * fem),
                              width: 25 * fem,
                              height: 18.5 * fem,
                              child: Image.network(
                                'https://picsum.photos/250?image=9',
                                width: 25 * fem,
                                height: 18.5 * fem,
                              ),
                            ),
                            Container(
                              // leadsjq8 (19:62)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 1 * fem, 89 * fem, 0 * fem),
                              child: Text(
                                'Leads',
                                style: GoogleFonts.lato(
                                  fontSize: 20 * 1,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2175 * 1 / fem,
                                  color: Color(0xff1438f7),
                                ),
                              ),
                            ),
                            Container(
                              // more11x (19:69)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 3 * fem, 19 * fem, 0 * fem),
                              width: 25 * fem,
                              height: 19 * fem,
                              child: Image.network(
                                'https://picsum.photos/250?image=9',
                                width: 25 * fem,
                                height: 19 * fem,
                              ),
                            ),
                            Container(
                              // vectorvPp (19:64)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 21 * fem, 1 * fem),
                              width: 25 * fem,
                              height: 25 * fem,
                              child: Image.network(
                                'https://picsum.photos/250?image=9',
                                width: 25 * fem,
                                height: 25 * fem,
                              ),
                            ),
                            Container(
                              // vectord3L (19:63)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 1 * fem),
                              width: 25 * fem,
                              height: 25 * fem,
                              child: Image.network(
                                'https://picsum.photos/250?image=9',
                                width: 25 * fem,
                                height: 25 * fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      // rectangle12vHL (19:99)
                      left: 0 * fem,
                      top: 59 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 360 * fem,
                          height: 60 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffd9d9d9),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // rectangle26EYv (40:77)
                      left: 0 * fem,
                      top: 59 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 360 * fem,
                          height: 60 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffd9d9d9),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // leadswalkinsknA (19:100)
                      left: 0 * fem,
                      top: 84 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 342 * fem,
                          height: 25 * fem,
                          child: RichText(
                            textAlign: TextAlign.right,
                            text: TextSpan(
                              style: GoogleFonts.lato(
                                fontSize: 20 * 1,
                                fontWeight: FontWeight.w700,
                                height: 1.2175 * 1 / fem,
                                color: Color(0xff000000),
                              ),
                              children: [
                                TextSpan(
                                  text: 'LEADS                        ',
                                  style: GoogleFonts.lato(
                                    fontSize: 20 * 1,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2175 * 1 / fem,
                                    color: Color(0xff1438f7),
                                  ),
                                ),
                                TextSpan(
                                  text: 'WALK-INS',
                                  style: GoogleFonts.lato(
                                    fontSize: 20 * 1,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2175 * 1 / fem,
                                    color: Color(0xff718eab),
                                  ),
                                ),
                                TextSpan(
                                  text: '  ',
                                  style: GoogleFonts.lato(
                                    fontSize: 20 * 1,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2175 * 1 / fem,
                                    color: Color(0xff1438f7),
                                  ),
                                ),
                                TextSpan(
                                  text: '   ',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // line15Jz2 (19:101)
                      left: 6.0093688965 * fem,
                      top: 118.5000915527 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 160 * fem,
                          height: 3 * fem,
                          child: Image.network(
                            'https://picsum.photos/250?image=9',
                            width: 160 * fem,
                            height: 3 * fem,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // autogroupnaby2QE (7JXkPJsYgEAPAJmJujNaBy)
                padding:
                    EdgeInsets.fromLTRB(0 * fem, 0.5 * fem, 0 * fem, 143 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      // autogroup61drjJe (7JXjMvQqM3Wf7wnBgn61DR)
                      margin: EdgeInsets.fromLTRB(
                          5 * fem, 0 * fem, 8 * fem, 60 * fem),
                      width: double.infinity,
                      height: 65 * fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // line513aE (19:104)
                            left: 0 * fem,
                            top: 0 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 175 * fem,
                                height: 5 * fem,
                                child: Image.network(
                                  'https://picsum.photos/250?image=9',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // rectangle13LZL (19:106)
                            left: 2 * fem,
                            top: 3 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 345 * fem,
                                height: 62 * fem,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffe3edf7),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // rectangle25GSz (19:113)
                            left: 241 * fem,
                            top: 14 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 96 * fem,
                                height: 39 * fem,
                                child: Image.network(
                                  'https://picsum.photos/250?image=9',
                                  width: 96 * fem,
                                  height: 39 * fem,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // rectangle23AoG (19:107)
                            left: 12 * fem,
                            top: 15 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 96 * fem,
                                height: 38 * fem,
                                child: Image.network(
                                  'https://picsum.photos/250?image=9',
                                  width: 96 * fem,
                                  height: 38 * fem,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // rectangle24JPg (19:109)
                            left: 124 * fem,
                            top: 15 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 96 * fem,
                                height: 38 * fem,
                                child: Image.network(
                                  'https://picsum.photos/250?image=9',
                                  width: 96 * fem,
                                  height: 38 * fem,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // closedEYE (19:111)
                            left: 142 * fem,
                            top: 22 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 57 * fem,
                                height: 20 * fem,
                                child: Text(
                                  'Closed',
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.lato(
                                    fontSize: 16 * 1,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2175 * 1 / fem,
                                    color: Color(0xff1438f7),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // tourbookedX1Y (19:114)
                            left: 258 * fem,
                            top: 14 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 65 * fem,
                                height: 39 * fem,
                                child: Text(
                                  'Tour Booked',
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.lato(
                                    fontSize: 16 * 1,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2175 * 1 / fem,
                                    color: Color(0xff1438f7),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // allEAr (19:108)
                            left: 42 * fem,
                            top: 22 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 32 * fem,
                                height: 20 * fem,
                                child: Text(
                                  'ALL',
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.lato(
                                    fontSize: 16 * 1,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2175 * 1 / fem,
                                    color: Color(0xff1438f7),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroupaenbwb4 (7JXjcFLJ9yL5AxNJUNAenB)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 8 * fem, 24 * fem),
                      width: 380 * fem,
                      height: 158 * fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // rectangle10Fre (19:75)
                            left: 7 * fem,
                            top: 0 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 345 * fem,
                                height: 158 * fem,
                                child: Image.network(
                                  'https://picsum.photos/250?image=9',
                                  width: 345 * fem,
                                  height: 158 * fem,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // smMen (19:76)
                            left: 29 * fem,
                            top: 19 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 24 * fem,
                                height: 19 * fem,
                                child: Text(
                                  'SM',
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.lato(
                                    //Inter
                                    fontSize: 15 * 1,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2125 * 1 / fem,
                                    color: Color(0xfffcf204),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // sumeetmukherjeeSw8 (19:77)
                            left: 95 * fem,
                            top: 22 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 116 * fem,
                                height: 16 * fem,
                                child: Text(
                                  'Sumeet Mukherjee',
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.lato(
                                    //Inter
                                    fontSize: 13 * 1,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125 * 1 / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // rectangle11kB8 (19:78)
                            left: 219 * fem,
                            top: 19 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 53 * fem,
                                height: 20 * fem,
                                child: Image.network(
                                  'https://picsum.photos/250?image=9',
                                  width: 53 * fem,
                                  height: 20 * fem,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // enrolledUN2 (19:79)
                            left: 226 * fem,
                            top: 21 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 39 * fem,
                                height: 13 * fem,
                                child: Text(
                                  'Enrolled',
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.lato(
                                    //Inter
                                    fontSize: 10 * 1,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125 * 1 / fem,
                                    color: Color(0xfff5f5f5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // parentaryanmukherjeePUz (19:80)
                            left: 31 * fem,
                            top: 48 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 129 * fem,
                                height: 14 * fem,
                                child: Text(
                                  'Parent :Aryan Mukherjee',
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.lato(
                                    //Inter
                                    fontSize: 11 * 1,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125 * 1 / fem,
                                    color: Color(0xff1438f7),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // statustocallbackfollowupFn6 (19:81)
                            left: 30 * fem,
                            top: 64 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 156 * fem,
                                height: 14 * fem,
                                child: Text(
                                  'Status:To Call Back/Follow Up',
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.lato(
                                    //Inter
                                    fontSize: 11 * 1,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125 * 1 / fem,
                                    color: Color(0xff1438f7),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // socialmediacampaignfacebook9ca (19:82)
                            left: 31 * fem,
                            top: 80 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 176 * fem,
                                height: 14 * fem,
                                child: Text(
                                  'Social Media Campaign:Facebook',
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.lato(
                                    //Inter
                                    fontSize: 11 * 1,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125 * 1 / fem,
                                    color: Color(0xff1438f7),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // lddate05mar20221Pt (19:83)
                            left: 0 * fem,
                            top: 97 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 174 * fem,
                                height: 14 * fem,
                                child: Text(
                                  'LD Date: 05 Mar 2022                   ',
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.lato(
                                    //Inter
                                    fontSize: 11 * 1,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125 * 1 / fem,
                                    color: Color(0xff1438f7),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // lastfollowupdate05mar2022r9c (19:84)
                            left: 0 * fem,
                            top: 131 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 236 * fem,
                                height: 14 * fem,
                                child: Text(
                                  'Last Follow Up Date: 05 Mar 2022                   ',
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.lato(
                                    //Inter
                                    fontSize: 11 * 1,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125 * 1 / fem,
                                    color: Color(0xff1438f7),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // lastactivity20mar20217LS (19:85)
                            left: 27 * fem,
                            top: 114 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 136 * fem,
                                height: 14 * fem,
                                child: Text(
                                  'Last Activity:20 Mar 2021 ',
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.lato(
                                    //Inter
                                    fontSize: 11 * 1,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125 * 1 / fem,
                                    color: Color(0xff1438f7),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // star2azi (19:86)
                            left: 61 * fem,
                            top: 17 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 24 * fem,
                                height: 25 * fem,
                                child: Image.network(
                                  'https://picsum.photos/250?image=9',
                                  width: 24 * fem,
                                  height: 25 * fem,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroupkpnpWdU (7JXk3EcfHdtsAoxBRbkPNP)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 8 * fem, 0 * fem),
                      width: 380 * fem,
                      height: 158 * fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // rectangle10bup (19:87)
                            left: 7 * fem,
                            top: 0 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 345 * fem,
                                height: 158 * fem,
                                child: Image.network(
                                  'https://picsum.photos/250?image=9',
                                  width: 345 * fem,
                                  height: 158 * fem,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // smjFL (19:88)
                            left: 27 * fem,
                            top: 21 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 24 * fem,
                                height: 19 * fem,
                                child: Text(
                                  'SM',
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.lato(
                                    //Inter
                                    fontSize: 15 * 1,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2125 * 1 / fem,
                                    color: Color(0xfffcf204),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // sumeetmukherjeeExn (19:89)
                            left: 95 * fem,
                            top: 22 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 116 * fem,
                                height: 16 * fem,
                                child: Text(
                                  'Sumeet Mukherjee',
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.lato(
                                    //Inter
                                    fontSize: 13 * 1,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125 * 1 / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // rectangle11KzE (19:90)
                            left: 221 * fem,
                            top: 22 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 53 * fem,
                                height: 20 * fem,
                                child: Image.network(
                                  'https://picsum.photos/250?image=9',
                                  width: 53 * fem,
                                  height: 20 * fem,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // enrolledfHQ (19:91)
                            left: 228 * fem,
                            top: 24 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 39 * fem,
                                height: 13 * fem,
                                child: Text(
                                  'Enrolled',
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.lato(
                                    //Inter
                                    fontSize: 10 * 1,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125 * 1 / fem,
                                    color: Color(0xfff5f5f5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // parentaryanmukherjeeNSi (19:92)
                            left: 31 * fem,
                            top: 48 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 129 * fem,
                                height: 14 * fem,
                                child: Text(
                                  'Parent :Aryan Mukherjee',
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.lato(
                                    //Inter
                                    fontSize: 11 * 1,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125 * 1 / fem,
                                    color: Color(0xff1438f7),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // statustocallbackfollowupGY6 (19:93)
                            left: 30 * fem,
                            top: 64 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 156 * fem,
                                height: 14 * fem,
                                child: Text(
                                  'Status:To Call Back/Follow Up',
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.lato(
                                    //Inter
                                    fontSize: 11 * 1,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125 * 1 / fem,
                                    color: Color(0xff1438f7),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // socialmediacampaignfacebookANa (19:94)
                            left: 31 * fem,
                            top: 78 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 176 * fem,
                                height: 14 * fem,
                                child: Text(
                                  'Social Media Campaign:Facebook',
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.lato(
                                    //Inter
                                    fontSize: 11 * 1,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125 * 1 / fem,
                                    color: Color(0xff1438f7),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // lddate05mar2022T6n (19:95)
                            left: 0 * fem,
                            top: 97 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 174 * fem,
                                height: 14 * fem,
                                child: Text(
                                  'LD Date: 05 Mar 2022                   ',
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.lato(
                                    //Inter
                                    fontSize: 11 * 1,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125 * 1 / fem,
                                    color: Color(0xff1438f7),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // lastfollowupdate05mar2022Mhx (19:96)
                            left: 0 * fem,
                            top: 131 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 236 * fem,
                                height: 14 * fem,
                                child: Text(
                                  'Last Follow Up Date: 05 Mar 2022                   ',
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.lato(
                                    //Inter
                                    fontSize: 11 * 1,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125 * 1 / fem,
                                    color: Color(0xff1438f7),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // lastactivity20mar2021fCr (19:97)
                            left: 27 * fem,
                            top: 114 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 136 * fem,
                                height: 14 * fem,
                                child: Text(
                                  'Last Activity:20 Mar 2021 ',
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.lato(
                                    //Inter
                                    fontSize: 11 * 1,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125 * 1 / fem,
                                    color: Color(0xff1438f7),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // star2a4v (19:98)
                            left: 61 * fem,
                            top: 17 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 24 * fem,
                                height: 25 * fem,
                                child: Image.network(
                                  'https://picsum.photos/250?image=9',
                                  width: 24 * fem,
                                  height: 25 * fem,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // bottomnavigationdJ6 (43:260)
                padding: EdgeInsets.fromLTRB(
                    15.74 * fem, 16.97 * fem, 9.81 * fem, 1.15 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffe3edf7),
                  borderRadius: BorderRadius.circular(14 * fem),
                  border: Border.all(color: Color(0xff000000)),
                  //border:  Border (
                  // ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(0 * fem, 4 * fem),
                      blurRadius: 2 * fem,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      // autogrouplpabcfp (7JXmwWnF1CSgjRW9i1LpAB)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 41.98 * fem, 0.9 * fem),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // vectorkX8 (I43:260;38:57)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 8.08 * fem),
                            width: 29.39 * fem,
                            height: 19.74 * fem,
                            child: Image.network(
                              'https://picsum.photos/250?image=9',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            // homefPC (I43:260;38:59)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 1.69 * fem, 0 * fem),
                            child: Text(
                              'Home\n',
                              style: GoogleFonts.lato(
                                //Inter
                                fontSize: 12 * 1,
                                fontWeight: FontWeight.w400,
                                height: 1.2125 * 1 / fem,
                                color: Color(0xff1438f7),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroupkxkvAKx (7JXn61Y5x1CKFXvRsWKXKV)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 41.61 * fem, 0.9 * fem),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // followupsiconcrm6UW (I43:260;38:55)
                            margin: EdgeInsets.fromLTRB(
                                4.87 * fem, 0 * fem, 0 * fem, 5.22 * fem),
                            width: 18.89 * fem,
                            height: 27.58 * fem,
                            child: Image.network(
                              'https://picsum.photos/250?image=9',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            // followupC1k (I43:260;38:60)
                            'Follow Up',
                            style: GoogleFonts.lato(
                              //Inter
                              fontSize: 12 * 1,
                              fontWeight: FontWeight.w400,
                              height: 1.2125 * 1 / fem,
                              color: Color(0xff1438f7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroup7pzvKMG (7JXnFfvesEZW5RaGxd7pZV)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 30.44 * fem, 0 * fem),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // leadsiconcrmSRt (I43:260;38:56)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 0.82 * fem),
                            width: 30.44 * fem,
                            height: 32.88 * fem,
                            child: Image.network(
                              'https://picsum.photos/250?image=9',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            // leadsmUA (I43:260;38:61)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 1.73 * fem, 0 * fem),
                            child: Text(
                              'Leads',
                              style: GoogleFonts.lato(
                                //Inter
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 1.2125 / fem,

                                color: Color(0xff1438f7),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroupsy87hMp (7JXniKpug5RwwY4gNjsY87)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 0.9 * fem),
                      height: 50.98 * fem,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // vector1S4W (I43:260;38:58)
                            margin: EdgeInsets.fromLTRB(
                                5.61 * fem, 0 * fem, 0 * fem, 8.4 * fem),
                            width: 24.14 * fem,
                            height: 27.58 * fem,
                            child: Image.network(
                              'https://picsum.photos/250?image=9',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            // quickresponsex2r (I43:260;38:62)
                            'Quick Response',
                            style: GoogleFonts.lato(
                              //Inter
                              fontSize: 12 * fem,
                              fontWeight: FontWeight.w400,
                              height: 1.2125 * fem / fem,
                              color: Color(0xff1438f7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
