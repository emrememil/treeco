import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/view/community/add_friends/model/add_friends_model.dart';
import 'package:treeco/view/community/add_friends/view_model/add_friends_view_model.dart';
import 'package:treeco/view/constants/size_config.dart';
import 'package:treeco/core/extension/string_extension.dart';

class AddFriendsScreen extends StatefulWidget {
  @override
  _AddFriendsScreenState createState() => _AddFriendsScreenState();
}

class _AddFriendsScreenState extends State<AddFriendsScreen> {

  AddFriendsViewModel addFriendsViewModel;
  AddFriendsModel addFriendsModel;


  @override
  Widget build(BuildContext context) {
    return BaseView<AddFriendsViewModel>(
      viewModel: AddFriendsViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        addFriendsViewModel = model;
      },
      onPageBuilder: (context, value) => body,
    );
  }

  get body => Scaffold(
    backgroundColor: Colors.white,
    appBar: appBar,
    body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.getProportionateScreenWidth(20)),
        child: SearchBar<AddFriendsModel>(
          searchBarController: addFriendsViewModel.searchBarController,
          onSearch: addFriendsViewModel.getAllUsers,
          onItemFound: (AddFriendsModel addModel, int index){
            return ListTile(
              leading: CircleAvatar(
                radius: SizeConfig.getProportionateScreenWidth(20),
                backgroundImage: AssetImage(
                    addModel.imagePath),
              ),
              title: Text(addModel.nameAndSurname),
              subtitle: Text(addModel.username),
              trailing: Container(
                height: SizeConfig.getProportionateScreenHeight(24),
                decoration: BoxDecoration(
                  color: Color(ApplicationConstants.BACKGROUND_COLOR).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal:SizeConfig.getProportionateScreenWidth(8)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("Ekle",
                        style: TextStyle(
                          fontSize: SizeConfig.getProportionateScreenWidth(12),
                          color: Colors.black,
                          fontFamily: ApplicationConstants.FONT_FAMILY2),),
                      SizedBox(width: 4,),
                      Icon(Icons.add, color: Color(ApplicationConstants.BACKGROUND_COLOR),)
                    ],
                  ),
                ),
              ),
            );
          },

        ),
      ),
    ),
  );

  AppBar get appBar {
    return AppBar(
      backgroundColor: Color(ApplicationConstants.BACKGROUND_COLOR),
      elevation: 4,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        'addFriends'.locale,
        style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(14),
            color: Colors.white,
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }
}
