# <img src="https://github.com/pip-services/pip-services/raw/master/design/Logo.png" alt="Pip.Services Logo" style="max-width:30%"> <br> Passwords Microservice Client SDK for Dart

This is a Dart client SDK for [pip-services-passwords](https://github.com/pip-services-users/pip-services-passwords-dart) microservice.

## Download

Right now the only way to get the microservice is to check it out directly from github repository
```bash
git clone git@github.com:pip-services-users/pip-clients-passwords-dart.git
```

Pip.Service team is working to implement packaging and make stable releases available for your 
as zip downloadable archieves.

## Contract

Logical contract of the microservice is presented below. For physical implementation (HTTP/REST),
please, refer to documentation of the specific protocol.

```dart
class UserPasswordV1 implements IStringIdentifiable {
  /* Identification */
  String id;
  String password;

  /* Password management */
  DateTime change_time;
  bool locked;
  DateTime lock_time;
  num fail_count;
  DateTime fail_time;
  String rec_code;
  DateTime rec_expire_time;

  /* Custom fields */
  dynamic custom_hdr;
  dynamic custom_dat;
}

class UserPasswordInfoV1 implements IStringIdentifiable {
  String id;
  DateTime change_time;
  bool locked;
  DateTime lock_time;
}

abstract class IPasswordsV1 {
  Future<UserPasswordInfoV1> getPasswordInfo(
      String correlationId, String userId);

  Future validatePassword(String correlationId, String password);

  Future setPassword(String correlationId, String userId, String password);

  Future<String> setTempPassword(String correlationId, String userId);

  Future deletePassword(String correlationId, String userId);

  Future<bool> authenticate(
      String correlationId, String userId, String password);

  Future changePassword(String correlationId, String userId, String oldPassword,
      String newPassword);

  Future<bool> validateCode(String correlationId, String userId, String code);

  Future resetPassword(
      String correlationId, String userId, String code, String password);

  Future recoverPassword(String correlationId, String userId);
}
```

## Use

The easiest way to work with the microservice is to use client SDK. 

Define client configuration parameters that match the configuration of the microservice's external API
```dart
// Client configuration
var httpConfig = ConfigParams.fromTuples(
	"connection.protocol", "http",
	"connection.host", "localhost",
	"connection.port", 8080
);
```

Instantiate the client and open connection to the microservice
```dart
// Create the client instance
var client = PasswordsHttpClientV1(config);

// Configure the client
client.configure(httpConfig);

// Connect to the microservice
try{
  await client.open(null)
}catch() {
  // Error handling...
}       
// Work with the microservice
// ...
```

Now the client is ready to perform operations
```dart
// Create a new password
final USER_PWD = UserPasswordV1(id: '1', password: 'password123');

    // Create the password
    try {
      await client.setPassword('123', USER_PWD.id, USER_PWD.password);
      // Do something with the returned password...
    } catch(err) {
      // Error handling...     
    }
```

```dart
// Authenticated
try {
var authenticated =
          await controller.authenticate(null, USER_PWD.id, 'password123');
    // Do something with authentication...

    } catch(err) { // Error handling}
```

## Acknowledgements

This microservice was created and currently maintained by
- **Sergey Seroukhov**
- **Nuzhnykh Egor**.
