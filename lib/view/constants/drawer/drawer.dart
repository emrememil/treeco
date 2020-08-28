import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/view/constants/size_config.dart';
import 'package:treeco/core/extension/string_extension.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth / 2,
      child: Drawer(
        child: Container(
          color: Color(ApplicationConstants.BACKGROUND_COLOR2),
          child: ListView(
            children: <Widget>[
              drawerHeader,
              _createDrawerItem(icon: Icons.timeline, text: 'timeLine'.locale),
              _createDrawerItem(icon: MdiIcons.pineTree, text: 'forest'.locale),
              _createDrawerItem(icon: Icons.people, text: 'friends'.locale),
              _createDrawerItem(icon: Icons.done, text: 'achievements'.locale),
              _createDrawerItem(icon: MdiIcons.treeOutline, text: 'realForest'.locale),
              _createDrawerItem(icon: Icons.store, text: 'store'.locale),
              _createDrawerItem(icon: MdiIcons.newspaperVariantMultiple, text: 'news'.locale),
              _createDrawerItem(icon: MdiIcons.account, text: 'profile'.locale),
              _createDrawerItem(icon: Icons.settings, text: 'settings'.locale),
            ],
          ),
        ),
      ),
    );
  }

  Container get drawerHeader {
    return Container(
      height: SizeConfig.getProportionateScreenHeight(120),
      width: double.infinity,
      child: DrawerHeader(
        decoration: BoxDecoration(
          color: Color(ApplicationConstants.BACKGROUND_COLOR2),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xff91D183), Color(0xff5CA985)]),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              MdiIcons.crown,
              color: Colors.yellow,
              size: SizeConfig.getProportionateScreenWidth(42),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'proVersion'.locale,
                    style: TextStyle(
                        fontFamily: ApplicationConstants.FONT_FAMILY2,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Text(
                      'moreInfo'.locale,
                      style: TextStyle(
                          fontFamily: ApplicationConstants.FONT_FAMILY2,
                          color: Colors.white,
                          fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.0),
            child: Text(
              text,
              style: TextStyle(
                  fontFamily: ApplicationConstants.FONT_FAMILY2,
                  //fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
