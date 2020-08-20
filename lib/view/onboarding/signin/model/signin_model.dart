import 'package:treeco/core/base/model/base_model.dart';

class SignInModel extends BaseModel{
  String name;
  String password;

  SignInModel(this.name, this.password);

  @override
  fromJson(Map<String, Object> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, Object> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}