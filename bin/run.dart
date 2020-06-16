import 'package:pip_clients_passwords/pip_clients_passwords.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services_passwords/pip_services_passwords.dart';

Future<void> main(List<String> argument) async {
  try {
    var correlationId = '123';
    var config = ConfigParams.fromTuples([
      'connection.type',
      'http',
      'connection.host',
      'localhost',
      'connection.port',
      8080
    ]);
    var client = PasswordsHttpClientV1();
    client.configure(config);
    final USER_PWD = UserPasswordV1(id: '1', password: 'password123');
    await client.open(correlationId);
    // Create password
    await client.setPassword(null, USER_PWD.id, USER_PWD.password);
    // Change password
    await client.changePassword(null, USER_PWD.id, USER_PWD.password, 'xxx123');

    // Sign in with new password
    var authenticated = await client.authenticate(null, USER_PWD.id, 'xxx123');
    if (authenticated) {
      print('Authentication is ' +
          authenticated.toString() +
          '! Everything works well!');
    } else {
      print('Authentication is ' +
          authenticated.toString() +
          '! Something was wrong!');
    }
    await client.close(correlationId);
  } catch (ex) {
    print(ex);
  }
}
