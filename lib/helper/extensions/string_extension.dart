// ignore_for_file: unnecessary_this
import '../utils/app_constants.dart';

/// A utility with extensions for strings.
extension StringExt on String {
  /// An extension for validating String is an email.
  bool get isValidEmail => AppConstants.emailRegex.hasMatch(this);

  /// An extension for validating String is a full name.
  bool get isValidFullName => AppConstants.fullNameRegex.hasMatch(this);

  /// An extension for validating String is a contact.
  bool get isValidContact => AppConstants.contactRegex.hasMatch(this);

  /// An extension for validating String is a zipcode.
  bool get isValidZipCode => AppConstants.zipCodeRegex.hasMatch(this);

  /// An extension for validating String is a credit card number.
  bool get isValidCreditCardNumber => AppConstants.creditCardNumberRegex.hasMatch(this);

  /// An extension for validating String is a credit card CVV.
  bool get isValidCreditCardCVV => AppConstants.creditCardCVVRegex.hasMatch(this);

  /// An extension for validating String is a credit card expiry.
  bool get isValidCreditCardExpiry => AppConstants.creditCardExpiryRegex.hasMatch(this);
  
  /// An extension for validating String is a valid OTP digit
  bool get isValidOtpDigit => AppConstants.otpDigitRegex.hasMatch(this);

  /// An extension for converting String to Capitalcase.
  String get capitalize => this[0].toUpperCase() + this.substring(1).toLowerCase();

  /// An extension for replacing underscores in a String with spaces.
  String get removeUnderScore => this.replaceAll('_', ' ');
}
