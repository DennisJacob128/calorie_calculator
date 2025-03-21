/// Returns rounded string without comma if possible
extension roundedStringDouble on double {
  String roundedString() {
    return (this == this.round() ? this.round() : this).toString();
  }
}

/// Capitalizes string
extension StringCasingExtension on String {
  String get capitalize =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';
}
