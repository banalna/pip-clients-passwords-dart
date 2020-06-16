import 'package:test/test.dart';
import 'package:pip_services_passwords/pip_services_passwords.dart';
import 'package:pip_clients_passwords/pip_clients_passwords.dart';

final USER_PWD = UserPasswordV1(id: '1', password: 'password123');

class PasswordsClientFixtureV1 {
  IPasswordsClientV1 _client;

  PasswordsClientFixtureV1(IPasswordsClientV1 client) {
    expect(client, isNotNull);
    _client = client;
  }

  void testRecoverPassword() async {
    // Create a new user
    await _client.setPassword(null, USER_PWD.id, USER_PWD.password);

    // Recover password
    await _client.recoverPassword(null, USER_PWD.id);
  }

  void testChangePassword() async {
    // Create a new user
    await _client.setPassword(null, USER_PWD.id, USER_PWD.password);

    // Change password
    await _client.changePassword(
        null, USER_PWD.id, USER_PWD.password, 'xxx123');

    // Sign in with new password
    var authenticated = await _client.authenticate(null, USER_PWD.id, 'xxx123');
    expect(authenticated, isTrue);

    // Delete password
    await _client.deletePassword(null, USER_PWD.id);
  }

  void testSigninWithWrongPassword() async {
    // Sign up
    await _client.setPassword(null, USER_PWD.id, USER_PWD.password);

    // Sign in with wrong password
    var authenticated = await _client.authenticate(null, USER_PWD.id, 'xxx');
    expect(authenticated, isFalse);
  }
}
