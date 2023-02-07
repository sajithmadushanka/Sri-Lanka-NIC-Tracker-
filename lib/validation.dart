class Validation {
  final String nic;
  Validation(this.nic);
  String checker() {
    // ignore: unused_local_variable
    dynamic num;
    bool condition = false;
    if (nic.length == 10) {
      for (int i = 0; i < 9; i++) {
        try {
          num = int.parse(nic[i]);
        } catch (e) {
          condition = true;
          return 'can\'t include characters';
        }
      }
      if (!condition) {
        if (nic[9].toUpperCase() == 'V' || nic[9].toUpperCase() == 'X') {
          return 'oldNIC';
        } else {
          return '9th one should be V or X';
        }
      }
    } else if (nic.length == 12) {
      dynamic x = true;
      for (int i = 0; i < 12; i++) {
        try {
          num = int.parse(nic[i]);
        } catch (e) {
          x = false;
          return 'only number should be include';
        }
      }
      if (x) {
        return 'newNIC';
      }
    }
    return 'Invalid format or empty field';
  }
}
