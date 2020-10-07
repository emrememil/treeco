import 'package:easy_localization/easy_localization.dart';

class ApplicationConstants {
  static const LANG_ASSET_PATH = 'assets/lang';
  static const FONT_FAMILY = 'Poppins';
  static const FONT_FAMILY2 = 'Montserrat';
  static const FACEBOOK_ICON = 'assets/icons/facebook_icon.png';
  static const GOOGLE_ICON = 'assets/icons/google_plus.png';
  static const TWITTER_ICON = 'assets/icons/twitter_icon.png';
  static const INSTAGRAM_ICON = 'assets/icons/instagram_icon.png';
  static const DARK_GREEN = 0xff163629;
  static const TEXT_GREEN = 0xff4D953D;
  static const TEXT_GREY = 0xff6A6A6A;
  static const LIGHT_GREEN = 0xff50A387;
  static const BACKGROUND_COLOR = 0xff50A387;
  static const BACKGROUND_COLOR2 = 0xff50A371;
  static const BACKGROUND_IMAGE_PROFILE = 'assets/backgrounds/profile_background.png';
  static const ANIMATION_DURATION = Duration(milliseconds: 200);
  static final DATE_FORMAT = DateFormat('dd-MM-yyyy');


  static const EMAIL_REGIEX = r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}\$";

  static bool emailCheck(String email){
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(email))
      return false;
    else
      return true;
  }

  static bool nameCheck(String name){
    RegExp regex=RegExp("^[a-zA-Z]+\$");
    if (!regex.hasMatch(name))
      return false;
    else
      return true;
  }

  static bool dateCheck(String date){
    RegExp regex=RegExp("^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})\$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))\$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})\$");
    if (!regex.hasMatch(ApplicationConstants.DATE_FORMAT.format(DateTime.parse((date)))))
      return false;
    else
      return true;
  }
}
