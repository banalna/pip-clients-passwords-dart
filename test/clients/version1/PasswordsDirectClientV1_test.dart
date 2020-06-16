import 'dart:async';
import 'package:test/test.dart';
import 'package:pip_services3_components/pip_services3_components.dart';
import 'package:pip_services_passwords/pip_services_passwords.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_clients_passwords/pip_clients_passwords.dart';
import './PasswordsClientFixtureV1.dart';

void main() {
  group('PasswordsDirectClientV1', () {
    PasswordsDirectClientV1 client;
    PasswordsClientFixtureV1 fixture;
    PasswordsMemoryPersistence persistence;
    PasswordsController controller;

    setUp(() async {
      var logger = ConsoleLogger();
      persistence = PasswordsMemoryPersistence();
      controller = PasswordsController();
      var references = References.fromTuples([
        Descriptor('pip-services', 'logger', 'console', 'default', '1.0'),
        logger,
        Descriptor('pip-services-passwords', 'persistence', 'memory', 'default',
            '1.0'),
        persistence,
        Descriptor('pip-services-passwords', 'controller', 'default', 'default',
            '1.0'),
        controller
      ]);
      controller.setReferences(references);

      client = PasswordsDirectClientV1();
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
