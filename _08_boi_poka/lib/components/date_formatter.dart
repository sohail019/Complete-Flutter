import 'package:intl/intl.dart';

String formatDateFromString(String dateString) {
  try {
    if (dateString.isNotEmpty) {
      // Parse ISO 8601 DateTime string
      DateTime date = DateTime.parse(dateString);

      // Format DateTime with ordinal suffix
      return formatDateWithSuffix(date);
    } else {
      return "";
    }
  } catch (e) {
    return "Invalid date format";
  }
}

String formatDateWithSuffix(DateTime date) {
  String day = DateFormat('d').format(date); // Get day number
  String monthYear = DateFormat('MMM yyyy').format(date); // Get month and year

  // Function to add ordinal suffix
  String getDayWithSuffix(int day) {
    if (day >= 11 && day <= 13) return '${day}th';
    switch (day % 10) {
      case 1:
        return '${day}st';
      case 2:
        return '${day}nd';
      case 3:
        return '${day}rd';
      default:
        return '${day}th';
    }
  }

  return '${getDayWithSuffix(int.parse(day))} $monthYear';
}
