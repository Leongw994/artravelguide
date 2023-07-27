import 'package:artravel/utils/color_utils.dart';
import 'package:artravel/widgets/app_large_text.dart';
import 'package:artravel/widgets/app_text.dart';
import 'package:artravel/widgets/number_rating.dart';
import 'package:artravel/widgets/responsive_button.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int starsAvail = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 20,
                top: 70,
                child: Row(children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu),
                  ),
                ]),
              ),
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/jerusalem.jpg"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                top: 330,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 550,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(
                                  text: "Jerusalem Inn",
                                  colour: Colors.black54),
                              AppLargeText(
                                  text: "  £12",
                                  colour: hexStringToColor('00BCD4'))
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined,
                              color: hexStringToColor('00BCD4')),
                          SizedBox(width: 10),
                          AppText(
                            text: "Nottingham, U.K.",
                            colour: hexStringToColor('00BCD4'),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(Icons.star,
                                  color: index < starsAvail
                                      ? hexStringToColor('EF6C00')
                                      : hexStringToColor('FB8C00'));
                            }),
                          ),
                          SizedBox(width: 10),
                          AppText(
                            text: "(4.5)",
                            colour: hexStringToColor('00E5FF'),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      AppLargeText(
                          text: "Visitors",
                          colour: Colors.black.withOpacity(0.8),
                          size: 20),
                      SizedBox(height: 5),
                      AppText(
                          text: "Number of people coming with you",
                          colour: Colors.grey),
                      SizedBox(height: 7),
                      Wrap(
                        children: List.generate(5, (index) {
                          return Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: numberWidget(
                                  size: 50,
                                  color: Colors.black,
                                  backgroundColor: hexStringToColor('A7FFEB'),
                                  borderColor: hexStringToColor('00BFA5'),
                                  //icon: Icons.favorite_border,
                                  //isIcon: true,
                                  text: (index + 1).toString()));
                        }),
                      ),
                      SizedBox(height: 20),
                      AppLargeText(
                          text: "Description",
                          colour: Colors.black.withOpacity(0.8)),
                      SizedBox(height: 5),
                      AppText(
                          text:
                              "Ancient pub built into stone caves with a charming wonky interior & resident ghosts, plus food. It is said that King Richard the Lionheart and his men are more than likely to have gathered at this dwelling before journeying to Jerusalem in 1189 AD, thus giving the pub its unusual name",
                          colour: Colors.grey),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    numberWidget(
                        size: 60,
                        color: Colors.black,
                        backgroundColor: Colors.white,
                        borderColor: Colors.black,
                        isIcon: true,
                        icon: Icons.favorite_border),
                    SizedBox(width: 20),
                    ResponsiveButton(
                      isReponse: true,
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
