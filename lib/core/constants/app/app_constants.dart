class ApplicationConstants {
  static const LANG_ASSET_PATH = 'assets/lang';
  static const FONT_FAMILY = 'Poppins';
  static const FONT_FAMILY2 = 'Montserrat';
  static const DARK_GREEN = 0xff163629;
  static const TEXT_GREEN = 0xff4D953D;
  static const TEXT_GREY = 0xff6A6A6A;
  static const LIGHT_GREEN = 0xff50A387;
  static const ANIMATION_DURATION = Duration(milliseconds: 200);

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
}
