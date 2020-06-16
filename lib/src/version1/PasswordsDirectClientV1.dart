import 'dart:async';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services3_rpc/pip_services3_rpc.dart';
import 'package:pip_services_passwords/pip_services_passwords.dart';
import './IPasswordsClientV1.dart';

class PasswordsDirectClientV1 extends DirectClient<dynamic>
    implements IPasswordsClientV1 {
  PasswordsDirectClientV1() : super() {
    dependencyResolver.put('controller',
        Descriptor('pip-services-passwords', 'controller', '*', '*', '1.0'));
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
    var timing = instrument(correlationId, 'passwords.get_password_info');
    var info = await controller.getPasswordInfo(correlationId, userId);
    timing.endTiming();
    return info;
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
    var timing = instrument(correlationId, 'passwords.set_password');
    var result = await controller.setPassword(correlationId, userId, password);
    timing.endTiming();
    return result;
  }

  /// Sets a temporary password.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [userId]            an id of password to be set.
  /// Return         Future that receives string temp password.
  @override
  Future<String> setTempPassword(String correlationId, String userId) async {
    var timing = instrument(correlationId, 'passwords.set_temp_password');
    var password = await controller.setTempPassword(correlationId, userId);
    timing.endTiming();
    return password;
  }

  /// Deletes a password.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [userId]            an id of password to be deleted.
  /// Return         Future that receives null for success.
  @override
  Future deletePassword(String correlationId, String userId) async {
    var timing = instrument(correlationId, 'passwords.delete_password');
    var result = await controller.deletePassword(correlationId, userId);
    timing.endTiming();
    return result;
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
    var timing = instrument(correlationId, 'passwords.authenticate');
    var authenticated =
        await controller.authenticate(correlationId, userId, password);
    timing.endTiming();
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
    var timing = instrument(correlationId, 'passwords.change_password');
    var result = await controller.changePassword(
        correlationId, userId, oldPassword, newPassword);
    timing.endTiming();
    return result;
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
    var timing = instrument(correlationId, 'passwords.validate_code');
    var valid = await controller.validateCode(correlationId, userId, code);
    timing.endTiming();
    return valid;
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
    var timing = instrument(correlationId, 'passwords.reset_password');
    var result =
        await controller.resetPassword(correlationId, userId, code, password);
    timing.endTiming();
    return result;
  }

  /// Recovers a password.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [userId]            an id of password.
  /// Return         Future that receives null for success.
  @override
  Future recoverPassword(String correlationId, String userId) async {
    var timing = instrument(correlationId, 'passwords.recover_password');
    var result = await controller.recoverPassword(correlationId, userId);
    timing.endTiming();
    return result;
  }
}
