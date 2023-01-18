class Validators {
  static String? validateEmail(String value) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Password is required";
    } else if (value.length < 6) {
      return "Password cannot be less than 6 characters";
    } else {
      return null;
    }
  }

  static String? validateUsername(String value) {
    if (value.isEmpty) {
      return "Username is required";
    } else {
      return null;
    }
  }

  static String? validateFirstname(String value) {
    if (value.isEmpty) {
      return "Firstname is required";
    } else {
      return null;
    }
  }

  static String? validateLastname(String value) {
    if (value.isEmpty) {
      return "Lastname is required";
    } else {
      return null;
    }
  }

  static String? validateCompanyBrn(String value) {
    if (value.isEmpty) {
      return "Company-Brn is required";
    } else {
      return null;
    }
  }

  static String? validateMobile(String value) {
    if (value.isEmpty) {
      return "Mobile is required";
    } else if (value.length < 10) {
      return "Invalid mobile number";
    } else {
      return null;
    }
  }

  static String? validateNationalId(String value) {
    if (value.isEmpty) {
      return "NationalId is required";
    } else {
      return null;
    }
  }

  static String? validateComment(String value) {
    if (value.isEmpty) {
      return "Cannot send empty field!";
    } else {
      return null;
    }
  }
}
