import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class FingerPrintAuthentication {
  static final authenticate = LocalAuthentication();

  static Future<bool> supportBiometric() async {
    try {
      return await authenticate.canCheckBiometrics;
    } on PlatformException {
      return false;
    }
  }

  static Future<bool> authenticateFunction() async {
    try {
      return await authenticate.authenticate(
          localizedReason: 'Hello, please authenticate with fingerprint',
          options: const AuthenticationOptions(
            useErrorDialogs: true,
          ));
    } on PlatformException {
      return false;
    }
  }
}
