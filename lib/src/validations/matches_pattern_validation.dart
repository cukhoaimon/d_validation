part of 'validations.dart';

/// Extension on [DValidationBuilder] for [String] properties to add a regex pattern match validation.
///
/// This extension adds a `matchesPattern` method that can be used to ensure that a string
/// matches a specific regex pattern.
extension MatchesPatternValidation on SimpleValidationBuilder<String> {
  /// Adds a validation rule that checks if the [String] matches the [pattern].
  ///
  /// [pattern] is the regex pattern that the string must match.
  /// [message] is the error message returned if the validation fails. Defaults to "Invalid format".
  /// [code] is an optional error code for translation purposes.
  ///
  /// Returns the [DValidationBuilder] to allow for method chaining.
  ///
  /// Example:
  /// ```dart
  /// ...
  /// ruleFor((user) => user.phoneNumber, key: 'phoneNumber')
  ///   .matchesPattern(r'^\d{3}-\d{3}-\d{4}$');
  /// ```
  ///
  /// String format args:
  /// - **{PropertyName}**: The name of the property.
  ///
  SimpleValidationBuilder<String> matchesPattern(String pattern, {String? message, String? code}) {
    return use(
      (value, entity) {
        final isValid = RegExp(pattern).hasMatch(value);

        if (isValid) return null;

        final currentCode = code ?? Language.code.matchesPattern;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}

extension MatchesPatternNullableValidation on SimpleValidationBuilder<String?> {
  /// Adds a validation rule that checks if the [String?] matches the [pattern].
  ///
  /// [pattern] is the regex pattern that the string must match.
  /// [message] is the error message returned if the validation fails. Defaults to "Invalid format".
  /// [code] is an optional error code for translation purposes.
  ///
  /// Returns the [DValidationBuilder] to allow for method chaining.
  ///
  /// Example:
  /// ```dart
  /// ...
  /// ruleFor((user) => user.phoneNumber, key: 'phoneNumber') // user.phoneNumber is nullable
  ///   .matchesPattern(r'^\d{3}-\d{3}-\d{4}$');
  /// ```
  ///
  /// String format args:
  /// - **{PropertyName}**: The name of the property.
  ///
  SimpleValidationBuilder<String?> matchesPattern(String pattern, {String? message, String? code}) {
    return use(
      (value, entity) {
        if (value != null) {
          final isValid = RegExp(pattern).hasMatch(value);

          if (isValid) return null;
        }

        final currentCode = code ?? Language.code.matchesPattern;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}

extension MatchesPatternOrNullableValidation on SimpleValidationBuilder<String?> {
  /// Adds a validation rule that checks if the [String?] matches the [pattern] or [null].
  ///
  /// [pattern] is the regex pattern that the string must match.
  /// [message] is the error message returned if the validation fails. Defaults to "Invalid format".
  /// [code] is an optional error code for translation purposes.
  ///
  /// Returns the [DValidationBuilder] to allow for method chaining.
  ///
  /// Example:
  /// ```dart
  /// ...
  /// ruleFor((user) => user.phoneNumber, key: 'phoneNumber')
  ///   .matchesPatternOrNull(r'^\d{3}-\d{3}-\d{4}$');
  /// ```
  ///
  /// String format args:
  /// - **{PropertyName}**: The name of the property.
  ///
  SimpleValidationBuilder<String?> matchesPatternOrNull(String pattern, {String? message, String? code}) {
    return use(
      (value, entity) {
        if (value == null) return null;

        final isValid = RegExp(pattern).hasMatch(value);

        if (isValid) return null;

        final currentCode = code ?? Language.code.matchesPattern;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}
