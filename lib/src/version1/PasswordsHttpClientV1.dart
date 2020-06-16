import 'dart:async';
import 'dart:convert';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services3_rpc/pip_services3_rpc.dart';
import 'package:pip_services_passwords/pip_services_passwords.dart';
import './IPasswordsClientV1.dart';

class PasswordsHttpClientV1 extends CommandableHttpClient
    implements IPasswordsClientV1 {
  PasswordsHttpClientV1([config]) : super('v1/passwords') {
    if (config != null) {
      configure(ConfigParams.fromValue(config));
    }
  }

  /// Gets a password infomation.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [userId]            an id of password to be retrieved.
  /// Return         Future that receives a password info.
  /// Throws error.
  @override
  Future<UserPasswordInfoV1> getPasswordInfo(
      String correlationId, String userId) async {
    var result = await callCommand(
        'get_password_info', correlationId, {'user_id': userId});
    if (result == null) return null;
    var item = UserPasswordInfoV1();
    item.fromJson(json.decode(result));
    return item;
  }

  /// Sets a password.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [userId]            an id of password to be set.
  /// - [password]            a password to be set.
  /// Return         Future that receives null for success.
  @override
  Future setPassword(
      String correlationId, String userId, String password) async {
    return callCommand('set_password', correlationId,
        {'user_id': userId, 'password': password});
  }

  /// Sets a temporary password.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [userId]            an id of password to be set.
  /// Return         Future that receives string temp password.
  @override
  Future<String> setTempPassword(String correlationId, String userId) async {
    var result = await callCommand(
        'set_temp_password', correlationId, {'user_id': userId});
    if (result == null) return null;
    return json.decode(result);
  }

  /// Deletes a password.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [userId]            an id of password to be deleted.
  /// Return         Future that receives null for success.
  @override
  Future deletePassword(String correlationId, String userId) async {
    return callCommand('delete_password', correlationId, {'user_id': userId});
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
    var result = await callCommand('authenticate', correlationId,
        {'user_id': userId, 'password': password});
    if (result == null) return null;
    var authenticated = json.decode(result) ?? false;
    return authenticated;
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
      String newPassword) async {
    return callCommand('change_password', correlationId, {
      'user_id': userId,
      'old_password': oldPassword,
      'new_password': newPassword
    });
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
    var result = await callCommand(
        'validate_code', correlationId, {'user_id': userId, 'code': code});
    if (result == null) return null;
    return json.decode(result);
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
      String correlationId, String userId, String code, String password) async {
    return callCommand('reset_password', correlationId,
        {'user_id': userId, 'code': code, 'password': password});
  }

  /// Recovers a password.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [userId]            an id of password.
  /// Return         Future that receives null for success.
  @override
  Future recoverPassword(String correlationId, String userId) async {
    return callCommand('recover_password', correlationId, {'user_id': userId});
  }
}
