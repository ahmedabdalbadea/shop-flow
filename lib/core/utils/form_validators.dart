abstract class FormValidators {
  static String? requiredFieldValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return "Field is required";
    } else {
      return null;
    }
  }

  static String? validateEmail(String? value) {
    final regex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value == null || !regex.hasMatch(value)) {
      return "Enter a valid email";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.length < 8) {
      return "Password must be at least 8 characters";
    }
    return null;
  }
}
