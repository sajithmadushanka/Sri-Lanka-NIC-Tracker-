class CorrectValidation {
  final String nic;
  final String type;

  CorrectValidation(this.nic, this.type);

  String yearPicker() {
    if (type == 'oldNIC') {
      return nic[0] + nic[1];
    } else {
      return nic[0] + nic[1] + nic[2] + nic[3];
    }
  }

  String genderPicker() {
    if (type == 'oldNIC') {
      int tempVal = int.parse(nic[2] + nic[3] + nic[4]);
      if (tempVal < 500) {
        return 'Male';
      } else {
        return 'Female';
      }
    } else {
      int tempVal = int.parse(nic[4] + nic[5] + nic[6]);
      if (tempVal < 500) {
        return 'Male';
      } else {
        return 'Female';
      }
    }
  }

  List<String> monthAndDatePicker() {
    String monthout = '';
    String dataout = '';
    List<int> daysOfmonths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    Map<int, String> months = {
      0: 'January',
      1: 'February',
      2: 'March',
      3: 'April',
      4: 'May',
      5: 'June',
      6: 'July',
      7: 'August',
      8: 'September',
      9: 'October',
      10: 'November',
      11: 'December'
    };

    String tempVal3digit = '';
    int temoVal3Int = 0;
    int birthYear = 0;
    if (type == 'oldNIC') {
      // get year IF OLD Nic number
      birthYear = 1900 + int.parse(nic[0] + nic[1]);
      tempVal3digit = (nic[2] + nic[3] + nic[4]);
    } else {
      birthYear = int.parse(
          nic[0] + nic[1] + nic[2] + nic[3]); //get year if new nic number
      tempVal3digit = (nic[4] + nic[5] + nic[6]);
    }
    int tempVal = int.parse(nic[2] + nic[3] + nic[4]);
    if (tempVal > 500) {
      temoVal3Int = int.parse(tempVal3digit) - 500;
    } else {
      temoVal3Int = int.parse(tempVal3digit);
    }

    if (birthYear % 4 == 0) {
      // check year is leap year or not
      daysOfmonths[1] = 29;
    }

    int i = 0;
    for (i; i < daysOfmonths.length; i++) {
      if (temoVal3Int <= daysOfmonths[i]) {
        if (i > 2) {
          temoVal3Int -= 1;
        }
        monthout = months[i].toString();
        dataout = temoVal3Int.toString();
        break;
      }

      temoVal3Int = temoVal3Int - daysOfmonths[i];
    }

    return [monthout, dataout];
  }
}
