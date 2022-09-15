import 'package:flutter/material.dart';
import 'package:flutx/core/tuple.dart';
import 'package:flutx/extensions/string_extension.dart';

typedef FxFieldValidator = String? Function(String? value);

abstract class FxFormValidator {


  String? validate(String? value);
}

mixin FxFormDataMixin {
  Map<String, dynamic> errors = {};
  Map<String, dynamic> remainingError = {};
  GlobalKey<FormState> formKey = GlobalKey();
  bool consumeError = true;

  FxFieldValidator createValidation(String name,
      {bool required = false, List<FxFormValidator> validators = const [], String? label}) {
    return (String? value) {
      label??=name.capitalize;
      String? error = getError(name);
      if (error != null) {
        return error;
      }

      if (required && (value == null || value.isEmpty)) {
        return "$label is required";
      }
      for (FxFormValidator validator in validators) {
        String? validationError = validator.validate(value);
        if (validationError != null) {
          return validationError;
        }
      }
      return null;
    };
  }

  String? getError(String name) {
    if (errors.containsKey(name)) {
      dynamic error = errors[name];

      if (error is List && error.isNotEmpty) {
        String errorText = error[0].toString();
        if (consumeError) {
          remainingError.remove(name);
        }
        return errorText;
      } else {
        String errorText = error.toString();
        if (consumeError) {
          remainingError.remove(name);
        }
        return errorText;
      }
    }
    return null;
  }

  bool validateForm({bool clear = false, bool consumeError = true}) {
    if (clear) {
      errors.clear();
      remainingError.clear();
    }
    this.consumeError = consumeError;
    return formKey.currentState?.validate() ?? false;
  }

  Tuple2<bool, Map<String, dynamic>> validateFormWithErrors(
      Map<String, dynamic> errors, {bool consumeError = true}) {
    this.errors = errors;
    this.remainingError = {...errors};
    return Tuple2(
        validateForm(consumeError: consumeError), this.remainingError);
  }
}
