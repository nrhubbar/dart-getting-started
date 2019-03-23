import 'dart:io';
import 'dart:core';


void main() {
  hiLo(100);

}

/**
 * This number guessing algorithm will guess number from 0 -> max, inclusive.
 */
void hiLo(int max) {
  int min = 0;
  int cieling = max + 1;
  double sum;
  int guess;
  String response;
  int attemptCount = 0;

  do {
    attemptCount++;
    sum = (cieling + min)/2;
    guess = sum.floor();

    print("Is $guess your number? Too (H)igh | Too (L)ow | (C)orrect");
    response = stdin.readLineSync();

    if(response == "H") {
      cieling = guess;
    } else if(response == "L") {
      min = guess;
    } else if (response != "C") {
      print("What was that?");
      attemptCount--;
    }
  } while(response != "C");

  print("Your number is $guess! and it only took me $attemptCount attempts.");
}