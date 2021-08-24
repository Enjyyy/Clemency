import 'dart:io';

void main(List<String> arguments) {
  print('enter student\'s name');

  //Variables

  String? student = stdin.readLineSync()!;
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
      print('- Added clemency degrees to ${subjects[j]} -');
    }
  }

  void failed() {
    if (grades[j] < 50) {
      print('XX $student failed ${subjects[j]} XX');
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
    print('enter subject\'s name (or enter k if you\'re done)');
    subject = stdin.readLineSync()!;
    subjects.add(subject);
    print('enter $subject\'s grade');
    grade = double.parse(stdin.readLineSync()!);

    if (grade < 100) {
      if ((grade < 40) || (trials >= 3)) {
        failedSubject++;
      }
      if (grade < 50) {
        trials++;
      }
      grades.add(grade);
      total += grade;
    } else if (subject == 'k' || (subject == 'K')) {
      break;
    } else {
      i--;
      print('Please enter a valid grade');
    }
  }

  //final results & analytics

  print('\n$student\'s grades are : $grades');
  print('\n$student has low grades in $trials subject(s)\n');

  for (j = 0; j < 10; j++) {
    Clemency();
    failed();
    succeeded();
  }

  if (trials >= 3) {
    print(
        '\n$student failed the year due to low grades in $trials subjects and he has to retake $trials courses');
  } else {
    print(
        '\n$student passed the year with a percentage of ${(total / (100 * grades.length)) * 100} \% and he has to retake $failedSubject course(s)\ntotal grade is : $total / ${100 * grades.length} ');
  }
}
