extension StringValidators on String {
  bool get containsUppercase => contains(RegExp(r'[A-Z]'));

  bool get containsLowercase => contains(RegExp(r'[a-z]'));

  bool get containsSpecialCharacter => contains(RegExp(r'[_!@#$%^&*]'));
  bool get notAllowed => contains(RegExp(r'[.><,~`( ) ]'));

  bool get containsNumericCharacter => contains(RegExp(r'[0-9]'));
}
