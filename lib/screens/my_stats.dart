import 'package:flutter/material.dart';

class MyStats extends StatelessWidget {
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
              heightField(),
              SizedBox(height: 5),
              weightField(),
              SizedBox(height: 15),
              submitButton(context),
              SizedBox(height: 20),
              Divider(),
              Text(
                'what\'s your bmr?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              GenderSelect(),
              ageField(),
              SizedBox(height: 10),
              Text(
                'What is today\'s activity level',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ActivityDropDown(),
              SizedBox(height: 15),
              submitAgeButton(context),
              SizedBox(height: 30),
              TextButton(
                  onPressed: () {
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

Widget weightField() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: Colors.black12,
      child: TextField(
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

Widget heightField() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: Colors.black12,
      child: TextField(
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

Widget submitButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: MaterialButton(
      child: Text('Save & Calc BMI'),
      onPressed: () {
        Navigator.pushNamed(context, '/bmi_display');
      },
      color: Colors.pink.shade200,
    ),
  );
}

Widget ageField() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: Colors.black12,
      child: TextField(
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
  const ActivityDropDown({Key key}) : super(key: key);

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
  const GenderSelect({Key key}) : super(key: key);

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
            },
          ),
        ),
      ],
    );
  }
}
