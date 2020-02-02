import 'package:flutter/foundation.dart';
import 'package:servplatform/core/exceptions/auth_exception.dart';
import 'package:servplatform/core/services/auth/auth_service.dart';
import 'package:servplatform/core/services/key_storage/key_storage_service.dart';
import 'package:servplatform/core/utils/logger.dart';

class AuthServiceImpl implements AuthService {
  final KeyStorageService keyStorageService;

  const AuthServiceImpl({@required this.keyStorageService});

  @override
  Future<void> signUpWithEmailPassword(
    String email,
    String password,
    String displayName,
  ) async {
    try {
      await Future.delayed(Duration(milliseconds: 250));
      keyStorageService.hasLoggedIn = true;
    } on Exception {
      Logger.e('AuthService: Error signing up');
      throw AuthException('Error signing up');
    }
  }

  @override
  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await Future.delayed(Duration(milliseconds: 250));
      //FirebaseUser user = await FirebaseAuth.instance
      //.signInWithEmailAndPassword(email: email, password: password);

      //keyStorageService.user_id = user.user_id
      keyStorageService.hasLoggedIn = true;
    } on Exception {
      Logger.e('AuthService: Error signing in');
      throw AuthException('Error signing in');
    }
  }

  @override
  Future<void> signInAnon() async {
    try {
      await Future.delayed(Duration(milliseconds: 250));
      keyStorageService.hasLoggedIn = true;
      //keyStorageService.user_id = user.user_id
      keyStorageService.userId = 'mg_8519';
    } on Exception {
      Logger.e('AuthService: Error signing in');
      throw AuthException('Error signing in');
    }
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(Duration(milliseconds: 250));
    keyStorageService.hasLoggedIn = false;
  }
}
