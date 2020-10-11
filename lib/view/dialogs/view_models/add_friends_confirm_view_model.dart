class AddFriendsConfirm{

  static final AddFriendsConfirm _instance = AddFriendsConfirm._init();

  static AddFriendsConfirm get instance => _instance;

  String imagePath;
  String nameAndSurname;
  String username;


  AddFriendsConfirm(this.imagePath, this.nameAndSurname, this.username);

  AddFriendsConfirm._init() {
    AddFriendsConfirm(imagePath,nameAndSurname,username);
  }

}