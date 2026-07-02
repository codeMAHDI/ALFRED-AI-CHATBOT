// ignore_for_file: unused_local_variable

import 'package:intl/intl.dart';

class DateConverter {
  static String estimatedDate(DateTime dateTime) {
    return DateFormat('dd MMM yyyy').format(dateTime);
  }
  ///======== time format string ========
  static String timeFormatString(String dateTime) {
    DateTime parsedDate = DateTime.parse(dateTime);
    return DateFormat.jm().format(parsedDate);
  }

  static String dateFormetString(String dateTimeStr) {
    DateTime dateTime = DateTime.parse(dateTimeStr);

    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  static String formattedDate() {
    DateTime now = DateTime.now();
    String formatteDatas = DateFormat('dd, MMMM').format(now);
    return formatteDatas;
  }

  static String timeFormetString(String dateTimeStr) {
    DateTime dateTime = DateTime.parse(dateTimeStr);

    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  ///=============== Calculate Time of Day ===============

  static String getTimePeriod() {
    int currentHour = DateTime.now().hour;

    int morningBoundary = 6;
    int noonBoundary = 12;
    int eveningBoundary = 18;

    if (currentHour >= morningBoundary && currentHour < noonBoundary) {
      return "Good Morning";
    } else if (currentHour >= noonBoundary && currentHour < eveningBoundary) {
      return "Good Noon";
    } else {
      return "Good Evening";
    }
  }


  static String getAge({required String dOB}) {
    List<String> dobParts = dOB.split("-");
    int day = int.parse(dobParts[0]);
    int month = int.parse(dobParts[1]);
    int year = int.parse(dobParts[2]);

    DateTime birthDate = DateTime(year, month, day);
    DateTime currentDate = DateTime.now();

    int age = currentDate.year - birthDate.year;

    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }

    return age.toString();
  }

  ///======================= Calculate CreatedAt time and show it =========================

  static String formatTimeAgo(String dateTimeString) {

    if(dateTimeString.isEmpty)return'';
    DateTime dateTime = DateTime.parse(dateTimeString);

    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 1) {
      return '${dateTime.day} ${_getMonthName(dateTime.month)} ${dateTime.year}';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  static String _getMonthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }

  static List<String> calculateAgeAndLifeSpan(String dob, int targetAge) {
    DateTime birthDate = DateTime.parse(dob);
    DateTime currentDate = DateTime.now();

    Duration difference = currentDate.difference(birthDate);
    int totalDaysLived = difference.inDays;

    int years = currentDate.year - birthDate.year;
    int months = currentDate.month - birthDate.month;
    int days = currentDate.day - birthDate.day;

    if (days < 0) {
      months--;
      days += DateTime(currentDate.year, currentDate.month, 0)
          .day;
    }
    if (months < 0) {
      years--;
      months += 12;
    }

    int weeks = days ~/ 7;
    int remainingDays = days % 7;

    int targetAgeDays = targetAge * 365;
    double lifeSpentPercent = (totalDaysLived / targetAgeDays) * 100;

    List<String> result = [
      "$years years",
      "$months months",
      "$weeks weeks",
      "$remainingDays days",
      "${lifeSpentPercent.toStringAsFixed(2)}%"
    ];

    return result;
  }




}