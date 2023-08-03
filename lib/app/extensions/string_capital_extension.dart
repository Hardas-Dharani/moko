String capitalizeAll(String text) {
  return text.replaceAllMapped(RegExp(r'\.\s+[a-z]|^[a-z]'), (m) {
    final String match = m[0] ?? '';
    return match.toUpperCase();
  });
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
