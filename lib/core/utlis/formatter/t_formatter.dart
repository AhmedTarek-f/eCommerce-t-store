import 'package:intl/intl.dart';
abstract class TFormatter {
  static String formatPhoneNumber(String phoneNumber)
  {
    if(phoneNumber.length ==10)
      {
        return '(${phoneNumber.substring(0,3)}) ${phoneNumber.substring(3,6)} ${phoneNumber.substring(6)}';
      }
    else if(phoneNumber.length ==11)
      {
        return '(${phoneNumber.substring(0,4)}) ${phoneNumber.substring(4,7)} ${phoneNumber.substring(7)}';
      }
    else{
      return phoneNumber;
    }
  }

  static String getFormattedDate(DateTime date, {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }
}