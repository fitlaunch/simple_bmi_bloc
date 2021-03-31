import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bmi/bmi_bloc.dart';
import '../blocs/bmi/bmi_event.dart';
import '../blocs/bmr/bmr_bloc.dart';
import '../blocs/bmr/bmr_event.dart';

class MyStats extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyStatsEvent();
  }
}

class _MyStatsEvent extends State<MyStats> {

  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _ageController = TextEditingController();
  SingingCharacter _genderSelect = SingingCharacter.female;
  String _activityLevel = 'x1.2 - Sedentary';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Stats'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 10),
              Text(
                'what\'s your bmi?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              heightField(_heightController),
              SizedBox(height: 5),
              weightField(_weightController),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: MaterialButton(
                  child: Text('Save & Calc BMI'),
                  onPressed: () {
                    BlocProvider.of<BmiBloc>(context).add(
                      BmiEvent(
                        _weightController.text, 
                        _heightController.text
                      )
                    );
                    BlocProvider.of<BmrBloc>(context).add(
                      BmrEvent(
                        _weightController.text, 
                        _heightController.text, 
                        _ageController.text, 
                        _activityLevel, 
                        _genderSelect == SingingCharacter.male ? true : false
                      )
                    );
                    Navigator.pushNamed(context, '/bmi_display');
                  },
                  color: Colors.pink.shade200,
                ),
              ),
              SizedBox(height: 20),
              Divider(),
              Text(
                'what\'s your bmr?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              GenderSelect((value) {
                setState(() {
                  _genderSelect = value;
                });
              }),
              ageField(_ageController),
              SizedBox(height: 10),
              Text(
                'What is today\'s activity level',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ActivityDropDown((newActivity) {
                setState(() {
                  _activityLevel = newActivity;
                });
              }),
              SizedBox(height: 15),
              submitAgeButton(context),
              SizedBox(height: 30),
              TextButton(
                  onPressed: () {
                    BlocProvider.of<BmiBloc>(context).add(
                      BmiEvent(
                        _weightController.text, 
                        _heightController.text
                      )
                    );
                    BlocProvider.of<BmrBloc>(context).add(
                      BmrEvent(
                        _weightController.text, 
                        _heightController.text, 
                        _ageController.text, 
                        _activityLevel, 
                        _genderSelect == SingingCharacter.male ? true : false
                      )
                    );
                    Navigator.pushNamed(context, '/bmi_display');
                  },
                  child: Text('View All Results')),
            ],
          ),
        ),
      ),
    );
  }
}

Widget weightField(TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: Colors.black12,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            suffixText: 'lbs',
            border: InputBorder.none,
            hintText: 'Weight in pounds'),
        //onChanged: () {}
      ),
    ),
  );
}

Widget heightField(TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: Colors.black12,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            suffixText: 'inches',
            border: InputBorder.none,
            hintText: 'Height in inches'),
        //onChanged: () {}
      ),
    ),
  );
}

Widget ageField(TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: Colors.black12,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            suffixText: 'Age',
            border: InputBorder.none,
            hintText: 'Age in whole years'),
        //onChanged: () {}
      ),
    ),
  );
}

//age input as well
Widget submitAgeButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: MaterialButton(
      child: Text('Save Age'),
      onPressed: () {},
      color: Colors.teal.shade200,
    ),
  );
}

//what activity level (needs submit or submit on selection)
class ActivityDropDown extends StatefulWidget {
  final Function(String) onChangeActivity;

  ActivityDropDown(this.onChangeActivity);

  @override
  _ActivityDropDownState createState() => _ActivityDropDownState();
}

class _ActivityDropDownState extends State<ActivityDropDown> {
  String dropdownValue = 'x1.55 - Moderately Active';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
        widget.onChangeActivity(newValue);
      },
      items: <String>[
        'x1.2 - Sedentary',
        'x1.375 - Lightly Active',
        'x1.55 - Moderately Active',
        'x1.725 - Very Active',
        'x1.9 - Extremely Active'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

//what is your gender today - (gender and age (converted dob) will likely persist for
//for other tests like height & weight?  Should they go from bloc to local/cloud storage
//in addition to display location(s)?
enum SingingCharacter { female, male }

class GenderSelect extends StatefulWidget {
  final Function(SingingCharacter) onChangeGender;

  const GenderSelect(this.onChangeGender);

  @override
  _GenderSelectState createState() => _GenderSelectState();
}

class _GenderSelectState extends State<GenderSelect> {
  SingingCharacter _character = SingingCharacter.female;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Female'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.female,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
              });
              widget.onChangeGender(value);
            },
          ),
        ),
        ListTile(
          title: const Text('Male'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.male,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
              });
              widget.onChangeGender(value);
            },
          ),
        ),
      ],
    );
  }
}
