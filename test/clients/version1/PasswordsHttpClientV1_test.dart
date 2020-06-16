import 'dart:async';

import 'package:test/test.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_clients_passwords/pip_clients_passwords.dart';
import './PasswordsClientFixtureV1.dart';

var httpConfig = ConfigParams.fromTuples([
  'connection.protocol',
  'http',
  'connection.host',
  'localhost',
  'connection.port',
  8080
]);

void main() {
  group('PasswordsHttpClientV1', () {
    PasswordsHttpClientV1 client;
    PasswordsClientFixtureV1 fixture;

    setUp(() async {
      client = PasswordsHttpClientV1();
      client.configure(httpConfig);
      var references = References.fromTuples([
        Descriptor(
            'pip-services-passwords', 'client', 'http', 'default', '1.0'),
        client
      ]);
      client.setReferences(references);
      fixture = PasswordsClientFixtureV1(client);
      await client.open(null);
    });

    tearDown(() async {
      await client.close(null);
      await Future.delayed(Duration(milliseconds: 2000));
    });

    test('Test Recover Password', () async {
      await fixture.testRecoverPassword();
    });

    test('Test Change Password', () async {
      await fixture.testChangePassword();
    });

    test('Test Signin with Wrong Password', () async {
      await fixture.testSigninWithWrongPassword();
    });
  });
}
