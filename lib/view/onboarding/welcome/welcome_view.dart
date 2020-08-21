import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:treeco/core/base/state/base_state.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/core/constants/navigation/navigation_constants.dart';
import 'package:treeco/core/extension/string_extension.dart';
import 'package:treeco/core/init/navigation/navigation_service.dart';
import 'package:treeco/view/constants/size_config.dart';
import 'package:treeco/view/onboarding/welcome/welcome_model.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends BaseState<WelcomeScreen> {
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
      child: Scaffold(
        body: Column(
          children: <Widget>[
            pageView(),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pageViewCount,
                    (index) => buildDot(index: index),
              ),
            ),
            buttons(),
          ],
        ),
      ),
    );
  }

  Expanded pageView() {
    return Expanded(
          flex: 3,
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemCount: pageViewCount,
            itemBuilder: (context, index) => WelcomeContent(
              title: welcomePageList[index]["title"],
              text: welcomePageList[index]["text"],
              hashtag: welcomePageList[index]["hashtag"],
              imagePath: welcomePageList[index]["imagePath"],
            ),
          ),
        );
  }

  Expanded buttons() {
    return Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: SizeConfig.getProportionateScreenHeight(50),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Color(ApplicationConstants.LIGHT_GREEN),
                    onPressed: () {},
                    child: Text(
                      'letStart'.locale,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: ApplicationConstants.FONT_FAMILY),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
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
                    onPressed: (){
                      NavigationService.instance.navigateToPage(path: NavigationConstants.SIGN_IN);
                    },
                    child: Text('signIn'.locale, style: TextStyle(
                        color: Colors.black,
                        fontFamily: ApplicationConstants.FONT_FAMILY
                    ),),
                  ),
                ),
              ),
            ],
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
        color: currentPage == index
            ? Color(ApplicationConstants.TEXT_GREEN)
            : Color(0xFFD8D8D8),
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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: SizeConfig.getProportionateScreenWidth(24),
                    color: Color(ApplicationConstants.TEXT_GREEN),
                    fontFamily: ApplicationConstants.FONT_FAMILY,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: SizeConfig.getProportionateScreenWidth(14),
                color: Color(ApplicationConstants.TEXT_GREY),
                fontFamily: ApplicationConstants.FONT_FAMILY,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              hashtag,
              style: TextStyle(
                  fontSize: SizeConfig.getProportionateScreenWidth(14),
                  color: Color(ApplicationConstants.TEXT_GREEN),
                  fontFamily: ApplicationConstants.FONT_FAMILY,
                  fontWeight: FontWeight.w600),
            ),
            Lottie.asset(
              imagePath,
              width: SizeConfig.screenWidth,
              height: SizeConfig.getProportionateScreenHeight(350),
            ),
          ],
        ),
      ),
    );
  }
}
