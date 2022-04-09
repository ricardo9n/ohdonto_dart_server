import '../models/user_model.dart';
import '../models/signup_model.dart';
import 'generic_service.dart';

import '../utils/list_extension.dart';

class SignUpService implements GenericService<SignUpModel> {
  final List<SignUpModel> _fakeUsersDB = [];

  @override
  bool delete(int id) {
    _fakeUsersDB.removeWhere((e) => e.id == id);
    return true;
  }

  @override
  List<SignUpModel> findAll() {
    return _fakeUsersDB;
  }

  @override
  SignUpModel findOne(int id) {
    return _fakeUsersDB.firstWhere((e) => e.id == id);
  }

  @override
  bool save(SignUpModel value) {
    SignUpModel? model = _fakeUsersDB.firstWhereOrNull((e) => e.id == value.id);
    if (model == null) {
      _fakeUsersDB.add(value);
    } else {
      var index = _fakeUsersDB.indexOf(model);
      _fakeUsersDB[index] = value;
    }

    return true;
  }
  
  @override
  SignUpModel save2(SignUpModel value) {
    SignUpModel? model = _fakeUsersDB.firstWhereOrNull((e) => e.email == value.email);
    if (model == null) {
      _fakeUsersDB.add(newModel);
    } else {
      var index = _fakeUsersDB.indexOf(model);
      _fakeUsersDB[index] = newModel;
    }

    return newModel;
  }
}
