class Validate {
  bool validateStudentId(String input) {
    final validCharacters = RegExp(r'^[0-9]+$');
    if (validCharacters.hasMatch(input) == true && input.length >= 8) {
      return true;
    } else {
      return false;
    }
  }

  bool validateMobNum(String input) {
    final validCharacters = RegExp(r'^[0-9]+$');
    if (validCharacters.hasMatch(input) == true && input.length == 11) {
      return true;
    } else {
      return false;
    }
  }
}
