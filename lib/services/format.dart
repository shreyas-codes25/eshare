String formatSize(int size) {
  if (size < 1024) return "$size B";
  if (size < 1024 * 1024) return "${(size / 1024).toStringAsFixed(1)} KB";
  return "${(size / (1024 * 1024)).toStringAsFixed(1)} MB";
}

String formatDate(String dateString) {
  DateTime date = DateTime.parse(dateString);
  return "${date.day}-${date.month}-${date.year}";
}
