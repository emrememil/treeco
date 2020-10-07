import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/core/extension/string_extension.dart';
import 'package:treeco/view/constants/size_config.dart';
import 'package:treeco/view/news/model/news_model.dart';
import 'package:treeco/view/news/view_model/news_view_model.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  NewsModel newsModel;
  NewsViewModel newsViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<NewsViewModel>(
      viewModel: NewsViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        newsViewModel = model;
      },
      onPageBuilder: (context, value) => body,
    );
  }

  get body => Scaffold(
        backgroundColor: Color(ApplicationConstants.BACKGROUND_COLOR),
        appBar: appBar,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            followUsOn,
            socialMediaIcons,
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: newsViewModel.newsList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.getProportionateScreenWidth(16),
                          horizontal:
                              SizeConfig.getProportionateScreenWidth(32)),
                      child: Column(
                        children: <Widget>[
                          dateAndNews(index),
                          Container(
                            width: SizeConfig.screenWidth -
                                SizeConfig.getProportionateScreenWidth(32),
                            height: SizeConfig.screenHeight / 2.5,
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: <Widget>[
                                newsImage(index),
                                newsContent(index)
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      );

  Padding newsContent(int index) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.getProportionateScreenWidth(16)),
      child: Text(
        newsViewModel.newsList[index].description,
        style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(14),
            color: Colors.black,
            fontFamily: ApplicationConstants.FONT_FAMILY2),
      ),
    );
  }

  Container newsImage(int index) {
    return Container(
      height: SizeConfig.screenHeight / 3.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        image: DecorationImage(
            image: AssetImage(newsViewModel.newsList[index].imagePath),
            fit: BoxFit.cover),
      ),
    );
  }

  Row dateAndNews(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.getProportionateScreenWidth(8),
          ),
          child: Text(
            formatDate(newsViewModel.newsList[index].dateTime,
                [dd, '/', mm, '/', yyyy]),
            style: TextStyle(
                fontSize: SizeConfig.getProportionateScreenWidth(14),
                color: Colors.white,
                fontFamily: ApplicationConstants.FONT_FAMILY2),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              bottom: SizeConfig.getProportionateScreenWidth(8),
              right: SizeConfig.getProportionateScreenWidth(4)),
          child: Container(
            height: SizeConfig.getProportionateScreenHeight(22),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.getProportionateScreenWidth(8)),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'news'.locale,
                  style: TextStyle(
                      fontSize: SizeConfig.getProportionateScreenWidth(12),
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: ApplicationConstants.FONT_FAMILY),
                ),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.orange),
          ),
        )
      ],
    );
  }

  Padding get socialMediaIcons {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.getProportionateScreenHeight(4),
          left: SizeConfig.getProportionateScreenWidth(8)),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Image.asset(ApplicationConstants.INSTAGRAM_ICON),
            iconSize: SizeConfig.getProportionateScreenWidth(32),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset(ApplicationConstants.FACEBOOK_ICON),
            iconSize: SizeConfig.getProportionateScreenWidth(32),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset(ApplicationConstants.TWITTER_ICON),
            iconSize: SizeConfig.getProportionateScreenWidth(32),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Padding get followUsOn {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.getProportionateScreenHeight(24),
          left: SizeConfig.getProportionateScreenWidth(16)),
      child: Text(
        'followUsOn'.locale,
        style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(14),
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: ApplicationConstants.FONT_FAMILY2),
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      backgroundColor: Color(ApplicationConstants.BACKGROUND_COLOR),
      elevation: 4,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        'news'.locale,
        style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(14),
            color: Colors.white,
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }
}
