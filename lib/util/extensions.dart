/// Returns rounded string without comma if possible
extension roundedStringDouble on double {
  String roundedString() {
    return (this == this.round() ? this.round() : this).toString();
  }
}
