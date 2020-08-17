import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/core/constants/image/image_constants.dart';
import 'package:treeco/core/init/lang/language_manager.dart';
import 'package:treeco/core/extension/string_extension.dart';
import 'package:treeco/core/init/lang/locale_keys.g.dart';
import 'package:treeco/view/constants/size_config.dart';
import 'package:treeco/view/onboarding/welcome/welcome_model.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  var welcomePageList = WelcomeModel.welcomeData;
  int pageViewCount;
  int currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageViewCount = WelcomeModel.welcomeData.length;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: PageView.builder(
                onPageChanged: (value){
                  setState(() {
                    currentPage =value;
                  });
                },
                  itemCount: pageViewCount,
                  itemBuilder: (context, index) => WelcomeContent(
                        title: welcomePageList[index]["title"],
                        text: welcomePageList[index]["text"],
                        hashtag: welcomePageList[index]["hashtag"],
                        imagePath: welcomePageList[index]["imagePath"],
                      )),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      pageViewCount,
                      (index) => buildDot(index: index),
                    ),
                  ),
                  Spacer(flex: 1,),
                  SizedBox(
                    width: double.infinity,
                    height: SizeConfig.getProportionateScreenHeight(50),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        color: Color(ApplicationConstants.LIGHT_GREEN),
                        onPressed: (){},
                        child: Text('letStart'.locale, style: TextStyle(
                            color: Colors.white,
                            fontFamily: ApplicationConstants.FONT_FAMILY
                        ),),
                      ),
                    ),
                  ),
                  SizedBox(height:  10,),
                  SizedBox(
                    width: double.infinity,
                    height: SizeConfig.getProportionateScreenHeight(50),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: OutlineButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        color: Colors.white,
                        splashColor:Color(ApplicationConstants.DARK_GREEN) ,
                        onPressed: (){},
                        child: Text('signUp'.locale, style: TextStyle(
                            color: Colors.black,
                            fontFamily: ApplicationConstants.FONT_FAMILY
                        ),),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Spacer(),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: ApplicationConstants.ANIMATION_DURATION,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Color(ApplicationConstants.TEXT_GREEN) : Color(0xFFD8D8D8) ,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class WelcomeContent extends StatelessWidget {
  const WelcomeContent({
    Key key,
    this.title,
    this.text,
    this.hashtag,
    this.imagePath,
  }) : super(key: key);

  final String title, text, hashtag, imagePath;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: SizeConfig.getProportionateScreenWidth(24),
                          color: Color(ApplicationConstants.TEXT_GREEN),
                          fontFamily: ApplicationConstants.FONT_FAMILY,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: SizeConfig.getProportionateScreenWidth(14),
                          color: Color(ApplicationConstants.TEXT_GREY),
                          fontFamily: ApplicationConstants.FONT_FAMILY,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      hashtag,
                      style: TextStyle(
                          fontSize: SizeConfig.getProportionateScreenWidth(14),
                          color: Color(ApplicationConstants.TEXT_GREEN),
                          fontFamily: ApplicationConstants.FONT_FAMILY,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 25,
                    ),

                    Container(
                      child: Lottie.asset(
                        imagePath,
                        width: SizeConfig.screenWidth,
                      ),
                    )
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
