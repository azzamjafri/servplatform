import 'package:servplatform/core/enums/view_state.dart';
import 'package:servplatform/core/exceptions/repository_exception.dart';
import 'package:servplatform/core/models/login/login.dart';
import 'package:servplatform/core/repositories/logins_repository/logins_repository.dart';
import 'package:servplatform/core/view_models/base_view_model.dart';
import 'package:servplatform/locator.dart';


//user
class LoginViewModel extends BaseViewModel {
  final _loginsRepository = locator<LoginsRepository>();

  List<Login> _logins = [];
  List<Login> get logins => _logins;

  Future<void> init() async {
    setState(ViewState.Busy);
    try {
      final fetchedLogins = await _loginsRepository.fetchLogins();
      _logins = fetchedLogins.take(5).toList();
    } on RepositoryException {
      setState(ViewState.Error);
    }
    setState(ViewState.Idle);
  }
}
