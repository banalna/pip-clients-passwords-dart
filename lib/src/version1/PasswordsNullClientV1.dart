import 'dart:async';
import 'package:pip_services_passwords/pip_services_passwords.dart';
import './IPasswordsClientV1.dart';

class PasswordsNullClientV1 implements IPasswordsClientV1 {
  /// Gets a password infomation.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [userId]            an id of password to be retrieved.
  /// Return         Future that receives a password info.
  /// Throws error.
  @override
  Future<UserPasswordInfoV1> getPasswordInfo(
      String correlationId, String userId) async {
    return UserPasswordInfoV1(
        id: userId, change_time: null, locked: false, lock_time: null);
  }

  /// Sets a password.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [userId]            an id of password to be set.
  /// - [password]            a password to be set.
  /// Return         Future that receives null for success.
  @override
  Future setPassword(String correlationId, String userId, String password) {
    return null;
  }

  /// Sets a temporary password.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [userId]            an id of password to be set.
  /// Return         Future that receives string temp password.
  @override
  Future<String> setTempPassword(String correlationId, String userId) async {
    return '123';
  }

  /// Deletes a password.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [userId]            an id of password to be deleted.
  /// Return         Future that receives null for success.
  @override
  Future deletePassword(String correlationId, String userId) {
    return null;
  }

  /// Authenticates a password.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [userId]            an id of password.
  /// - [password]            a password to be authenticated.
  /// Return         Future that receives bool value of the authentication result.
  @override
  Future<bool> authenticate(
      String correlationId, String userId, String password) async {
    return true;
  }

  /// Changes a password.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [userId]            an id of password.
  /// - [oldPassword]            an old password.
  /// - [newPassword]            a new password.
  /// Return         Future that receives null for success.
  @override
  Future changePassword(String correlationId, String userId, String oldPassword,
      String newPassword) {
    return null;
  }

  /// Validates a code.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [userId]            an id of password.
  /// - [code]            a code to be validated.
  /// Return         Future that receives bool value of the validation result.
  @override
  Future<bool> validateCode(
      String correlationId, String userId, String code) async {
    return true;
  }

  /// Resets a password.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [userId]            an id of password.
  /// - [code]            a code.
  /// - [password]            a password.
  /// Return         Future that receives null for success.
  @override
  Future resetPassword(
      String correlationId, String userId, String code, String password) {
    return null;
  }

  /// Recovers a password.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [userId]            an id of password.
  /// Return         Future that receives null for success.
  @override
  Future recoverPassword(String correlationId, String userId) {
    return null;
  }
}
