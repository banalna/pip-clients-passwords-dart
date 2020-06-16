import 'package:pip_services3_components/pip_services3_components.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';

import '../version1/PasswordsNullClientV1.dart';
import '../version1/PasswordsDirectClientV1.dart';
import '../version1/PasswordsHttpClientV1.dart';

class PasswordsClientFactory extends Factory {
  static final NullClientDescriptor =
      Descriptor('pip-services-passwords', 'client', 'null', '*', '1.0');
  static final DirectClientDescriptor =
      Descriptor('pip-services-passwords', 'client', 'direct', '*', '1.0');
  static final HttpClientDescriptor =
      Descriptor('pip-services-passwords', 'client', 'http', '*', '1.0');

  PasswordsClientFactory() : super() {
    registerAsType(
        PasswordsClientFactory.NullClientDescriptor, PasswordsNullClientV1);
    registerAsType(
        PasswordsClientFactory.DirectClientDescriptor, PasswordsDirectClientV1);
    registerAsType(
        PasswordsClientFactory.HttpClientDescriptor, PasswordsHttpClientV1);
  }
}
