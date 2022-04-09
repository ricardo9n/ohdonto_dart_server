import '../models/user_model.dart';
import '../models/signup_model.dart';
import 'generic_service.dart';

import '../utils/list_extension.dart';

class UserService implements GenericService<UserModel> {
  final List<UserModel> _fakeUsersDB = [];

  @override
  bool delete(int id) {
    _fakeUsersDB.removeWhere((e) => e.id == id);
    return true;
  }

  @override
  List<UserModel> findAll() {
    return _fakeUsersDB;
  }

  @override
  UserModel findOne(int id) {
    return _fakeUsersDB.firstWhere((e) => e.id == id);
  }

  @override
  bool save(UserModel value) {
    UserModel? model = _fakeUsersDB.firstWhereOrNull((e) => e.id == value.id);
    if (model == null) {
      _fakeUsersDB.add(value);
    } else {
      var index = _fakeUsersDB.indexOf(model);
      _fakeUsersDB[index] = value;
    }

    return true;
  }
  
  @override
  UserModel save2(UserModel value) {
    UserModel? model = _fakeUsersDB.firstWhereOrNull((e) => e.email == value.email);
    if (model == null) {
      _fakeUsersDB.add(value);
    } else {
      var index = _fakeUsersDB.indexOf(model);
      _fakeUsersDB[index] = model;
    }

    return model!;
  }
}
