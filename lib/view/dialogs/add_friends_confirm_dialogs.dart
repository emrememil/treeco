import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/core/extension/string_extension.dart';
import 'package:treeco/view/constants/size_config.dart';
import 'package:treeco/view/dialogs/view_models/add_friends_confirm_view_model.dart';

class AddFriendsConfirmDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.getProportionateScreenWidth(16)),
      width: SizeConfig.screenWidth -
          SizeConfig.getProportionateScreenWidth(16),
      height: SizeConfig.screenHeight / 3.5,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          textTitle,
          SizedBox(height: SizeConfig.getProportionateScreenHeight(16),),
          userDetail,
          SizedBox(height: SizeConfig.getProportionateScreenHeight(16),),
          Expanded(
            child: buttons,
          )
        ],
      ),
    );
  }

  Center get textTitle {
    return Center(
          child: Text('youAreAboutAddUser'.locale,
              style: TextStyle(
                  fontSize: SizeConfig.getProportionateScreenWidth(13),
                  color: Colors.black,
                  fontFamily: ApplicationConstants.FONT_FAMILY2),),
        );
  }

  Container get userDetail {
    return Container(
          decoration: BoxDecoration(
            color: Color(ApplicationConstants.BACKGROUND_COLOR).withOpacity(0.3),
            borderRadius: BorderRadius.circular(SizeConfig.getProportionateScreenWidth(50))
          ),
          child: ListTile(
            leading: CircleAvatar(
              radius: SizeConfig.getProportionateScreenWidth(20),
              backgroundImage: AssetImage(
                  AddFriendsConfirm.instance.imagePath),
            ),
            title: Text(AddFriendsConfirm.instance.nameAndSurname),
            subtitle: Text(AddFriendsConfirm.instance.username),
          ),
        );
  }

  Row get buttons {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Text('approve'.locale,
                style: TextStyle(
                    fontSize: SizeConfig.getProportionateScreenWidth(13),
                    fontFamily: ApplicationConstants.FONT_FAMILY2),
                ),
                color: Color(ApplicationConstants.BACKGROUND_COLOR2),
                textColor: Colors.white,
                onPressed: (){},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SizeConfig.getProportionateScreenWidth(18),
                  ),
                ),
              ),
              RaisedButton(
                child: Text('cancel'.locale,
                style: TextStyle(
                    fontSize: SizeConfig.getProportionateScreenWidth(13),
                    color: Colors.redAccent,
                    fontFamily: ApplicationConstants.FONT_FAMILY2),),
                color: Colors.white,
                onPressed: (){},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(SizeConfig.getProportionateScreenWidth(18),
                    ),
                  side: BorderSide(color: Colors.redAccent
                ),
              ),)
            ],
          );
  }
}
