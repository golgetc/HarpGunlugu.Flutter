import 'text_style.dart';
import 'ui_helpers.dart';
import 'sidemenu.dart';
import 'swiping_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

List<String> swipingCardImages = [
  'assest/music/album4.jpg',
  'assest/music/album3.jpg',
  'assest/music/album2.jpg',
  'assest/music/album1.jpg',
];

List<String> swipingCardTitles = [
  '1921',
  '1920',
  '1919',
  '1918',
];

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;
var gradientStartColor;
var gradientEndColor;
PageController controller =
    PageController(initialPage: swipingCardImages.length - 1);
var i = swipingCardImages.length - 1;

class MyGradientsPage extends StatefulWidget {
  @override
  _MyGradientsPageState createState() => _MyGradientsPageState();
}

class _MyGradientsPageState extends State<MyGradientsPage> {
  var currentPage = swipingCardImages.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller =
        PageController(initialPage: swipingCardImages.length - 1);
    controller.addListener(
      () {
        setState(
          () {
            currentPage = controller.page;
          },
        );
      },
    );

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          )
        ],
        backgroundColor: Color.fromRGBO(0, 83, 159, 1),
        title: Center(
            child: Text(
          "Harp Günlüğü",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        )),
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: MyDrawer(),
      body: Container(
        /*decoration: BoxDecoration(
          gradient: LinearGradient(
              //gradient colors change according to set theme
              colors: isThemeCurrentlyDark(context)
                  ? [GradientColors.darkStart, GradientColors.darkEnd]
                  : [GradientColors.lightStart, GradientColors.lightEnd],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp),
        ), */
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 30.0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GradientText(
                      'Destanın 100. Yılında',
                      textAlign: TextAlign.right,
                      gradient: isThemeCurrentlyDark(context)
                          ? Gradients.coldLinear
                          : Gradients
                              .haze, //gradient colors change according to set theme
                      style: isThemeCurrentlyDark(context)
                          ? TitleStylesDefault.white
                          : TitleStylesDefault.black,
                    ),
                  ],
                ),
              ),
              Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: 5.0,
                    ),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Gün Gün Antep Savunması \nHarp Günlüğü",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 17)),
                        ]),
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  SwipingCards(currentPage),
                  Positioned.fill(
                    child: PageView.builder(
                      itemCount: swipingCardImages.length,
                      controller: controller,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return Container();
                      },
                    ),
                  )
                ],
              ),
              Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 50.0,
                    ),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(""),
                        ]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
