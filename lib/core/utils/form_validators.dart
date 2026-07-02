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

  static String? validateInternationalPhone(String? value) {
    final regxPhone = RegExp(r'^\+?[0-9\s\-\(\)]{9,15}$');

    if (value == null || value.isEmpty) {
      return "Phone number is required";
    } else if (!regxPhone.hasMatch(value)) {
      return "Please enter a valid phone number";
    }

    return null;
  }

  static String? validateCity(String? value) {
    final cityRegExp = RegExp(r'^[a-zA-Z\s]+$');

    if (value == null || value.trim().isEmpty) {
      return 'City is required';
    }
    if (!cityRegExp.hasMatch(value.trim())) {
      return 'City name should only contain letters';
    }
    return null;
  }

  static String? validateState(String? value) {
    final stateRegExp = RegExp(r'^[a-zA-Z\s]{2,20}$');

    if (value == null || value.trim().isEmpty) {
      return 'State is required';
    }
    if (!stateRegExp.hasMatch(value.trim())) {
      return 'Enter a valid state name or abbreviation';
    }
    return null;
  }
}
