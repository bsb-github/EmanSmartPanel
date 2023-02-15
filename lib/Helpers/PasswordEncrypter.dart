import 'package:encrypt/encrypt.dart';

class PasswordEncrypter {
  final iv = IV.fromLength(16);
  final encrypter = Encrypter(AES(Key.fromLength(32)));

  String encrpyt(String password) {
    return encrypter.encrypt(password, iv: iv).base64;
  }

  String decrypted(String encrpytedPassword) {
    return encrypter.decrypt(Encrypted.fromBase64(encrpytedPassword), iv: iv);
  }
}
