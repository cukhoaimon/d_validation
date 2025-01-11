part of 'validations.dart';

/// Extension on [DValidationBuilder] for [String] properties to add a minimum length validation.
///
/// This extension adds a `minLength` method that can be used to ensure that the length of a string
/// meets a specified minimum number of characters.
extension MinLengthValidation on SimpleValidationBuilder<String> {
  /// Adds a validation rule that checks if the length of a [String] is greater than or equal to [num].
  ///
  /// [num] is the minimum required length for the string.
  /// [message] is the error message returned if the validation fails. Defaults to "Must be at least $num characters long".
  /// [code] is an optional error code for translation purposes.
  ///
  /// Returns the [DValidationBuilder] to allow for method chaining.
  ///
  /// Example:
  /// ```dart
  /// ...
  /// ruleFor((user) => user.password, key: 'password')
  ///   .maxLength(8);
  /// ```
  ///
  /// String format args:
  /// - **{PropertyName}**: The name of the property.
  /// - **{MinLength}**: The value to compare against.
  /// - **{TotalLength}**: total characters entered.
  SimpleValidationBuilder<String> minLength(int num, {String? message, String? code}) {
    return use(
      (value, entity) {
        if (value.length >= num) return null;

        final currentCode = code ?? Language.code.minLength;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
            'MinLength': '$num',
            'TotalLength': '${value.length}',
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}

extension MinLengthNullableValidation on SimpleValidationBuilder<String?> {
  /// Adds a validation rule that checks if the length of a [String?] is greater than or equal to [num].
  ///
  /// [num] is the minimum required length for the string.
  /// [message] is the error message returned if the validation fails. Defaults to "Must be at least $num characters long".
  /// [code] is an optional error code for translation purposes.
  ///
  /// Returns the [DValidationBuilder] to allow for method chaining.
  ///
  /// Example:
  /// ```dart
  /// ...
  /// ruleFor((user) => user.password, key: 'password') // user.password is nullable
  ///   .maxLength(8);
  /// ```
  ///
  /// String format args:
  /// - **{PropertyName}**: The name of the property.
  /// - **{MinLength}**: The value to compare against.
  /// - **{TotalLength}**: total characters entered.
  SimpleValidationBuilder<String?> minLength(int num, {String? message, String? code}) {
    return use(
      (value, entity) {
        if (value != null && value.length >= num) return null;

        final currentCode = code ?? Language.code.minLength;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
            'MinLength': '$num',
            'TotalLength': '${value != null ? value.length : 0}',
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}

extension MinLengthOrNullableValidation on SimpleValidationBuilder<String?> {
  /// Adds a validation rule that checks if the length of a [String?] is greater than or equal to [num] or [null].
  ///
  /// [num] is the minimum required length for the string.
  /// [message] is the error message returned if the validation fails. Defaults to "Must be at least $num characters long".
  /// [code] is an optional error code for translation purposes.
  ///
  /// Returns the [DValidationBuilder] to allow for method chaining.
  ///
  /// Example:
  /// ```dart
  /// ...
  /// ruleFor((user) => user.password, key: 'password')
  ///   .minLengthOrNull(8);
  /// ```
  ///
  /// String format args:
  /// - **{PropertyName}**: The name of the property.
  /// - **{MinLength}**: The value to compare against.
  /// - **{TotalLength}**: total characters entered.
  SimpleValidationBuilder<String?> minLengthOrNull(int num, {String? message, String? code}) {
    return use(
      (value, entity) {
        if (value == null || value.length >= num) return null;

        final currentCode = code ?? Language.code.minLength;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
            'MinLength': '$num',
            'TotalLength': '${value.length}',
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}
