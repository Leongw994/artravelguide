import 'package:artravel/utils/color_utils.dart';
import 'package:artravel/widgets/app_large_text.dart';
import 'package:artravel/widgets/app_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  //images list for use at the bottom pag
  var images1 = {"centre.jpg", "history.jpeg", "parks.jpeg", "jerusalem.jpg"};

  //list of images to use for main page
  var images = {
    "Shopping.png": "Shopping",
    "cathedral.png": "History",
    "parks.png": "Parks",
    "drinks.png": "Food and Drinks"
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //menu text
      Container(
        padding: const EdgeInsets.only(top: 70, left: 20),
        child: Row(
          children: [
            Icon(Icons.menu, size: 24, color: Colors.black),
            Expanded(child: Container()),
            Container(
              margin: const EdgeInsets.only(right: 20),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 40),
      //discover sign
      Container(
        margin: const EdgeInsets.only(left: 20),
        child: AppLargeText(text: 'Dicover'),
      ),
      SizedBox(height: 20),
      //tabBar code
      Container(
        child: Align(
          alignment: Alignment.centerLeft,
          child: TabBar(
              labelPadding: const EdgeInsets.only(left: 20, right: 0),
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: TabIndicatorStyle(
                  color: hexStringToColor('00E5FF'), radius: 4),
              tabs: [
                Tab(text: 'Places'),
                Tab(text: 'Inspirations'),
                Tab(text: 'Visited Places'),
              ]),
        ),
      ),
      Container(
        padding: const EdgeInsets.only(left: 30),
        height: 300,
        width: double.maxFinite,
        child: TabBarView(
          controller: _tabController,
          children: [
            ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    margin: const EdgeInsets.only(right: 15, top: 10),
                    width: 200,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(
                          image:
                              AssetImage("images/" + images1.elementAt(index)),
                          fit: BoxFit.cover),
                    ));
              },
            ),
            Text("My"),
            Text("Traveller"),
          ],
        ),
      ),
      SizedBox(height: 30),
      Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppLargeText(text: "Explore more", size: 15),
              AppText(text: "See all", colour: Colors.grey)
            ],
          )),
      SizedBox(height: 10),
      Container(
          width: double.maxFinite,
          height: 120,
          margin: const EdgeInsets.only(left: 20),
          child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Column(children: [
                  Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage(
                                "images/" + images.keys.elementAt(index)),
                            fit: BoxFit.cover),
                      )),
                  SizedBox(height: 10),
                  Container(
                      child: AppText(
                    text: images.values.elementAt(index),
                    colour: Colors.grey,
                  )),
                ]);
              }))
    ]));
  }
}

class TabIndicatorStyle extends Decoration {
  final Color color;
  double radius;
  TabIndicatorStyle({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _circlePaint(color: color, radius: radius);
  }
}

class _circlePaint extends BoxPainter {
  final Color color;
  double radius;
  _circlePaint({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2, configuration.size!.height);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
    // TODO: implement paint
  }
}
