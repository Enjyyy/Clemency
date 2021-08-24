import 'dart:io';

void main(List<String> arguments) {
  print('enter student\'s name');

  //Variables

  String? student = stdin.readLineSync();
  double grade = 0;
  List grades = [];
  String subject;
  List subjects = [];
  int trails = 0;
  double total = 0;
  int i = 0;
  int j = 0;

  //----Checking methods----

  void Clemency() {
    if ((40 <= grades[j]) && (grades[j] < 50) && (trails < 3)) {
      grades[j] += 10;
      print('--Added clemency degrees to ${subjects[j]}');
    }
  }

  void failed() {
    if (grades[j] < 50) {
      print('$student failed ${subjects[j]}');
    }
  }

  void succeeded() {
    if (grades[j] >= 50) {
      print('$student passed ${subjects[j]}');
    }
  }

  //----implementing----

  //Getting data
  for (i = 0; i < 10; i++) {
    print('enter subject\'s name');
    subject = stdin.readLineSync()!;
    subjects.add(subject);
    print('enter $subject\'s grade');
    grade = double.parse(stdin.readLineSync()!);
    if (grade < 50) {
      trails++;
    }
    if (grade > 100) {
      i--;
      print('Please enter a valid grade');
    } else {
      grades.add(grade);
      total += grade;
    }
  }

  //final results & analytics

  print('\n$student\'s grades are : $grades');
  print('\n$student has low grades in $trails subject(s)\n');

  for (j = 0; j < 10; j++) {
    Clemency();
    succeeded();
    failed();
  }

  if (trails >= 3) {
    print('\n$student failed the year');
  } else {
    print(
        '\n$student passed the year with a percentage of ${(total / (100 * grades.length)) * 100} \% \n total grade is : $total / ${100 * grades.length}');
  }
}
