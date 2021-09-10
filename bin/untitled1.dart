import 'dart:io';

void main(List<String> arguments) {
  //Starting the program

  print('enter student\'s name');
  String? student = stdin.readLineSync()!;

  print('enter number of subjects');
  int numOfSubjects = int.parse(stdin.readLineSync()!);

  //Variables

  double grade = 0;
  List grades = [];
  String subject;
  List subjects = [];
  int trials = 0;
  int failedSubject = 0;
  double total = 0;
  int i = 0;
  int j = 0;

  //----Checking methods----

  void Clemency() {
    if ((40 <= grades[j]) && (grades[j] < 50) && (trials < 3)) {
      grades[j] += 10;
      print('\t  - Added clemency degrees to ${subjects[j]}');
    }
  }

  void failed() {
    if (grades[j] < 50) {
      print('\t  - $student failed ${subjects[j]}');
    }
  }

  void succeeded() {
    if (grades[j] >= 50) {
      print('\t  - $student passed ${subjects[j]}');
    }
  }

  String grading(double k) {
    if ((k >= 85) && (k <= 100)) {
      return 'A | Excellent';
    } else if ((k >= 75) && (k < 85)) {
      return 'B | Very good';
    } else if ((k >= 65) && (k < 75)) {
      return 'C | good';
    } else if ((k >= 50) && (k < 65)) {
      return 'D | Pass';
    } else if ((k >= 30) && (k < 50)) {
      return 'F | Weak';
    } else {
      return 'F | Very weak';
    }
  }

  //----implementing----

  //Getting data
  for (i = 0; i < numOfSubjects; i++) {
    print('enter subject\'s name');
    subject = stdin.readLineSync()!;
    subjects.add(subject);
    print('enter $subject\'s grade');
    grade = double.parse(stdin.readLineSync()!);

    if (grade < 100) {
      if (grade < 40) {
        failedSubject++;
      }
      if (grade < 50) {
        trials++;
      }
      grades.add(grade);
      total += grade;
    } else {
      i--;
      print('Please enter a valid grade');
    }
  }

  //final results & analytics

  print('\n$student\'s marks are :- \n');
  print('---------------------------');
  for (j = 0; j < numOfSubjects; j++) {
    print('${subjects[j]} : ${grades[j]}/100 | ${grading(grades[j])}');
    print('\t notes:');
    Clemency();
    failed();
    succeeded();
    print('---------------------------');
  }
  print('\n$student has low grades in $trials subject(s)');

  if (trials >= 3) {
    print(
        '\n$student failed the year due to low grades in $trials subjects and (s)he has to retake the year');
  } else {
    print(
        '\n$student passed the year with a percentage of ${((total / (100 * grades.length)) * 100).toStringAsFixed(2)}\% and (s)he has to retake $failedSubject course(s)'
        '\ntotal grade is : $total / ${100 * grades.length} , Grade description : ${grading(((total / (100 * grades.length)) * 100))}');
  }
}
