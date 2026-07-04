List<String?>? formateName(String? fullName) {
  if (fullName == null) return null;
  List<String?> formatedName = [];
  fullName.split(" ").forEach((item) {
    formatedName.add(item[0].toUpperCase() + item.substring(1));
  });

  return formatedName;
}
