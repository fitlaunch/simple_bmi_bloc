# simple_bmi_bloc

Definitely not a practice in UI... working to understand bloc better

I'm looking to see bloc build with textinput fields a bmi and display it on a second page.
Additionally, I set up a bmr calculation which will use the same height and weight user
input as the bmi, and additionally use gender and a activity level value in it's equation.

I set the bmr basic bloc structure with equitable and bmi without.  I wouldn't mind seeing
implementation of each but whichever is 'best' is just fine to be used on both.

What's the best practice in this set up?

Functional Equations that need to be implemented...
BMI -
  #this is the calculation for bmi in emperical units.  metric conversion later.
  double calculateBmi({double weight, double height}) {
    return (weight / (height * height)) * 703;
  }

  #these are the detailed categories that will display along with the bmi number
  String calculateBmiCategory({double bmi}) {
    if (bmi == 0) {
      return 'Not Calculated';
    } else if (bmi < 18.5) {
      return 'UNDERWEIGHT';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'NORMAL';
    } else if (bmi >= 25 && bmi < 30) {
      return 'OVERWEIGHT';
    } else if (bmi >= 30 && bmi < 35) {
      return 'OBESE';
    } else {
      return 'EXTEREMELY OBESE';
    }
  }

Equations for the bmr
age & activity factor selection still need to be tied into button or other for submit.
#function to calculate bmr.  these do the conversion from imperial to metric measures.
Male = {66+[13.7*(weight/2.2)]+[5*(height*2.54)]-(6.8*Age)} * Activity Factor
Female = {655+[9.6*(weight/2.2)]+[1.8*(height*2.54)]-(4.7*Age)} * Activity Factor
    Activity Factor
         Sedentary = 1.2
         Lightly Active = 1.375
         Moderately Active = 1.55
         Very Active = 1.725
         Extremely Active = 1.9