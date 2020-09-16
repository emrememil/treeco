import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/core/init/navigation/navigation_service.dart';
import 'package:treeco/view/constants/date_picker_config.dart';
import 'package:treeco/view/constants/size_config.dart';
import 'package:treeco/core/extension/string_extension.dart';
import 'package:treeco/view/personal/birthday_input/model/birthday_input_model.dart';
import 'package:treeco/view/personal/birthday_input/view_model/birthday_input_view_model.dart';

class BirthdayInputScreen extends StatefulWidget {
  @override
  _BirthdayInputScreenState createState() => _BirthdayInputScreenState();
}

class _BirthdayInputScreenState extends State<BirthdayInputScreen> {
  BirthdayInputModel birthdayInputModel;
  BirthdayInputViewModel birthdayInputViewModel;
  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<BirthdayInputViewModel>(
      viewModel: BirthdayInputViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        birthdayInputViewModel = model;
        birthdayInputViewModel.dateTime = DatePickerConfig.initData;
      },
      onPageBuilder: (context, value) => body,
    );
  }

  get body => Scaffold(
        appBar: appBar,
        body: Column(
          children: <Widget>[
            GestureDetector(
              onTap: _showDatePicker,
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(
                      SizeConfig.getProportionateScreenHeight(16)),
                  child: Container(
                    color: Colors.grey.shade200,
                    width: SizeConfig.screenWidth / 1.5,
                    child: Padding(
                      padding: EdgeInsets.all(
                          SizeConfig.getProportionateScreenHeight(16)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Observer(
                          builder: (context) => Text(
                            ApplicationConstants.DATE_FORMAT
                                .format(birthdayInputViewModel.dateTime),
                            style: TextStyle(
                                fontSize:
                                    SizeConfig.getProportionateScreenWidth(13),
                                color: Colors.black,
                                fontFamily: ApplicationConstants.FONT_FAMILY),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  AppBar get appBar {
    return AppBar(
      leading: GestureDetector(
          onTap: () {
            NavigationService.instance.navigatePop();
          },
          child: Icon(Icons.clear)),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
          color: Colors.black,
          size: SizeConfig.getProportionateScreenWidth(25)),
      title: Text(
        'birthday'.locale,
        style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(14),
            color: Colors.black,
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
      actions: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(right: SizeConfig.getProportionateScreenWidth(2)),
          child: IconButton(
            onPressed: () => checkAndConfirm(),
            icon: Icon(
              Icons.check,
              color: Colors.blue,
              size: SizeConfig.getProportionateScreenWidth(25),
            ),
          ),
        )
      ],
    );
  }

  void _showDatePicker() {
    DatePicker.showDatePicker(context,
        onMonthChangeStartWithFirstDate: true,
        pickerTheme: DateTimePickerTheme(
          showTitle: true,
          confirm: Text(
            'approve'.locale,
            style: TextStyle(
                fontSize: SizeConfig.getProportionateScreenWidth(12),
                color: Colors.blue,
                fontFamily: ApplicationConstants.FONT_FAMILY),
          ),
        ),
        minDateTime: DatePickerConfig.minDateTime,
        maxDateTime: DatePickerConfig.maxDateTime,
        initialDateTime: DatePickerConfig.initData,
        dateFormat: DatePickerConfig.dateFormat,
        locale: DatePickerConfig.locale,
        onClose: () => print("----- onClose -----"),
        onCancel: () => print('onCancel'),
//        onChange: (dateTime, List<int> index) {
//          birthdayInputViewModel.dateTime = dateTime;
//          print("Datetime: " +
//              birthdayInputViewModel.dateTime.toUtc().toString());
//          _controller.text = ApplicationConstants.DATE_FORMAT
//              .format(birthdayInputViewModel.dateTime);
//        },
        onConfirm: (dateTime, List<int> index) {
          birthdayInputViewModel.dateTime = dateTime;
          print("Datetime2: " +
              birthdayInputViewModel.dateTime.toUtc().toString());
        });
  }

  checkAndConfirm() {
    debugPrint(
        "girilen tarih: ${ApplicationConstants.DATE_FORMAT.format(birthdayInputViewModel.dateTime)}");
    NavigationService.instance.navigatePop();
  }
}
