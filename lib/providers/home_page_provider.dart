import 'package:flutter/cupertino.dart';
class HomePageProvider with ChangeNotifier{

  bool? isEligible;
  String? eligibilityMessage = '';

  void checkEligibility(int age){
    if (age >= 18 )
      {
        isEligible = true;
        eligibilityMessage = 'You are eligible to Vote';
        notifyListeners();
      }
    else if (age< 18 && age>=0){
      isEligible = false;
      eligibilityMessage = 'You are not eligible to Vote';
      notifyListeners();

    }
    else{
      isEligible = false;
      eligibilityMessage = 'Not valid Age';
      notifyListeners();
    }
  }
}