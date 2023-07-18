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

  bool validateEmail(String input) {
    final validCharacters = RegExp(r'^[0-9a-zA-z@._-]+$');
    if (validCharacters.hasMatch(input) == true &&
        input.contains("@") &&
        input.contains(".")) {
      return true;
    } else {
      return false;
    }
  }

  bool validateName(String input) {
    final validCharacters = RegExp(r'^[a-zA-z]+$');
    if (validCharacters.hasMatch(input) == true) {
      return true;
    } else {
      return false;
    }
  }

  bool validateSalutation(String input) {
    final validCharacters = RegExp(r'^[a-zA-z]+$');
    if (validCharacters.hasMatch(input) == true &&
        input.length >= 2 &&
        input.length <= 3) {
      return true;
    } else {
      return false;
    }
  }

  bool validateGoogleDriveLink(String input) {
    if (input.startsWith("https://drive.google.com/file/") == true) {
      return true;
    } else {
      return false;
    }
  }
}
