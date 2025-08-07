import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter day 3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter states'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          ElevatedButton(onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StatelessWidgetExamples(),),
          ),
          child: Text('Stateless Widget Examples'),
          ),
          SizedBox(height: 10,),

          ElevatedButton(onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StatefullWidgetExamples(),)
          ),
          child: Text('Statefull Widget Examples'),
          ),
          SizedBox(height: 10,),

          ElevatedButton(onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InteractiveWidgetExamples(),
            ),
            ),
            child: Text('Interactive Widget Examples'),
            ),
            SizedBox(height: 10,),
        ],
      ),
    );
  }
}

//Stateless Widget Examples
class StatelessWidgetExamples extends StatelessWidget {
  const StatelessWidgetExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless Widget Examples'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Stateless Widget Examples', 
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),

            CustomCard(
              title: 'Welcome to Command HQ',
              subtitle: 'vetnet Social',
              icon: Icons.star,
              color: Colors.blue,
            ),
            SizedBox(height: 10,),


            profileWidget(
              name: 'Sanjai',
              email: 'sanjai.s77777@gmail.com',
              avatarUrl: 'assets\images\21BAD051 photo.jpg',
            ),
            SizedBox(height: 10,),

            InfoBadge(
              label: 'New Feature',
              count: 5,
              badgeColor: Colors.red,
            ),
            SizedBox(height: 20),

            Text('Widget Composition Example:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            ComposeWidget(),
            SizedBox(height: 20,),

            Text('Stateless Form Comomponents:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            StatelessFormExample(),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const CustomCard({Key? key,
  required this.title,
  required this.subtitle,
  required this.icon,
  required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(icon, color: color, size: 30,),
            SizedBox(width: 16,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                Text(subtitle, style: TextStyle(color: Colors.grey[600]),)
              ],
            )
        ]),
      ),
    );
  }
}

class profileWidget extends StatelessWidget {
  final String name;
  final String email;
  final String avatarUrl;

  const profileWidget({Key? key,
  required this.name,
  required this.email,
  required this.avatarUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blue,
            child: Text(name[0], style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(email, style: TextStyle(color: Colors.grey[600])),
            ],
          ),
        ],
      ),);
  }
}

class InfoBadge extends StatelessWidget {
  final String label;
  final int count;
  final Color badgeColor;
  
  const InfoBadge({
    Key? key,
    required this.label,
    required this.count,
    required this.badgeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: TextStyle(color: Colors.white)),
          SizedBox(width: 5),
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Text('$count', style: TextStyle(color: badgeColor, fontSize: 12)),
          ),
        ],
      ),
    );
  }
}

class ComposeWidget extends StatelessWidget {
  const ComposeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        children: [
          CustomCard(title: 'Profile card used again',
           subtitle: 'Widget composition is done',
            icon: Icons.build,
             color: Colors.green),
             SizedBox(height: 10,),
             InfoBadge(label: 'Again new feature',
              count: 1,
              badgeColor: Colors.orange),
        ],
      ),
    );
  }
}

class StatelessFormExample extends StatelessWidget {
  const StatelessFormExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          statelessInputField(label: 'Name', hintText: 'Enter your name'),
          SizedBox(height: 10,),
          statelessInputField(label: 'Email', hintText: 'Enter your email'),
          SizedBox(height: 10,),
          StatelessButton(text: 'Submit', color: Colors.blue),
        ],
      ),
    );
  }
}

class statelessInputField extends StatelessWidget {
  final String label;
  final String hintText;

  const statelessInputField({Key? key,
  required this.label,
  required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5,),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
        )
      ],
    );
  }
}

class StatelessButton extends StatelessWidget {
  final String text;
  final Color color;

  const StatelessButton({Key? key,
  required this.text,
  required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print('Button Pressed: $text');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Text(text),
    );
  }
}


//Statefull  Widget Examples
class StatefullWidgetExamples extends StatelessWidget {
  const StatefullWidgetExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stateful Widget Examples')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Statefull Widget Examples:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 20,),

              CounterWidget(),
              SizedBox(height: 20,),

              ToggleSwitchWidget(),
              SizedBox(height: 20),

              DynamicListWidget(),
              SizedBox(height: 20),

              RealTimeTextWidget(),
              SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  @override
  void initState(){
    super.initState();
    print('CounterWidget initialized');
  }

  @override
  void dispose(){
    print('CounterWidget disposed');
    super.dispose();
  }

  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter(){
    setState(() {
      _counter--;
    });
  }

  void _resetCounter(){
    setState(() {
      _counter=0;
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding:EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Counter Example', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text('Counter: $_counter', style: TextStyle(fontSize: 24),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: Text('-'),
                  ),

                ElevatedButton(
                  onPressed: _resetCounter,
                  child: Text('Reset'),
                  ),

                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: Text('+'),
                  ),

              ],
            )
          ],
        ),
        ),
    );
  }
}

class ToggleSwitchWidget extends StatefulWidget {
  const ToggleSwitchWidget({super.key});

  @override
  State<ToggleSwitchWidget> createState() => _ToggleSwitchWidgetState();
}

class _ToggleSwitchWidgetState extends State<ToggleSwitchWidget> {
  bool _isToggled = false;
  String _toggledText = 'OFF';

  void _toogleSwitch() {
    setState(() {
      _isToggled = !_isToggled;
      _toggledText = _isToggled ? 'ON' : 'OFF';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Toggle Switch Example', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Status: $_toggledText', style: TextStyle(fontSize: 16),),
                SizedBox(width: 20,),
                Switch(
                  value: _isToggled,
                  onChanged: (value){
                    setState(() {
                      _isToggled = value;
                      _toggledText = value ? 'ON' : 'OFF';
                    });
                  }
                  )
              ],
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: _toogleSwitch,
              child: Text('Toggle')),
          ],
        ),
      ),
    );
  }
}



class DynamicListWidget extends StatefulWidget {
  const DynamicListWidget({super.key});

  @override
  State<DynamicListWidget> createState() => _DynamicListWidgetState();
}

class _DynamicListWidgetState extends State<DynamicListWidget> {
  List<String> _items = ['Item 1', 'Item 2', 'Item 3'];
  int _itemCounter = 4;

  void _addItem() {
    setState(() {
      _items.add('Item $_itemCounter');
      _itemCounter++;
    });
  }

  void _removeItem(int index){
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Dynamic List Example', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: _addItem,
              child: Text('Add Item'),
              ),
              SizedBox(height: 10,),
              Container(
                height: 200,
                child: ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_items[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red,),
                        onPressed: () => _removeItem(index),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}



class RealTimeTextWidget extends StatefulWidget {
  const RealTimeTextWidget({super.key});

  @override
  State<RealTimeTextWidget> createState() => _RealTimeTextWidgetState();
}

class _RealTimeTextWidgetState extends State<RealTimeTextWidget> {
  TextEditingController _controller = TextEditingController();
  String _currentText = '';
  int _characterCount = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _currentText = _controller.text;
      _characterCount = _currentText.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Real-time Text Input', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Type something...',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 10),
            Text('Character Count: $_characterCount'),
            SizedBox(height: 5),
            Text('Current Text: $_currentText'),
          ],
        ),
      ),
    );
  }
}

//Interactive Wigdet Examples
class InteractiveWidgetExamples extends StatelessWidget {
  const InteractiveWidgetExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Interactive Widget Examples')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Interactive Widgets Examples:', 
                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),

            ButtonExamples(),
            SizedBox(height: 20,),

            FormExamples(),
            SizedBox(height: 20,),

            CheckboxRadioExamples(),
            SizedBox(height: 20,),

            GestureExamples(),
            SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}

class ButtonExamples extends StatelessWidget {
  const ButtonExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Button Examples:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () => print('Default Elevated Button'),
                  child: Text('Default')
                  ),

                ElevatedButton(
                  onPressed: () => print('Styled Elevated Button'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text('Styled'),
                ),
              ],
            ),
            SizedBox(height: 10,),

            Wrap(
              spacing: 10,
              children: [
                TextButton(
                  onPressed: () => print('Text Button'),
                  child: Text('Text Button')
                  ),
                  TextButton(
                    onPressed: () => print('Styled Text Button'),
                    style: TextButton.styleFrom(
                    foregroundColor: Colors.purple,
                    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  child: Text('Styled Text'),
                  ),
              ],
            ),
            SizedBox(height: 10,),

            Row(
              children: [
                IconButton(
                  onPressed: () => print('Heart Icon'),
                  icon: Icon(Icons.favorite),
                  color: Colors.red,
                  ),
                  IconButton(
                  onPressed: () => print('Star Icon'),
                  icon: Icon(Icons.star),
                  color: Colors.amber,
                  iconSize: 30,
                ),
                IconButton(
                  onPressed: () => print('Settings Icon'),
                  icon: Icon(Icons.settings),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.blue[100],
                    padding: EdgeInsets.all(15),
                  ),
                ),
              ],
            )
          ]
        )
      )
    );
  }
}


class FormExamples extends StatefulWidget {
  const FormExamples({super.key});

  @override
  State<FormExamples> createState() => _FormExamplesState();
}

class _FormExamplesState extends State<FormExamples> {
  final _formkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  String _formResult = '';

  
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  void _submitForm() {
    if (_formkey.currentState!.validate()) {
      setState(() {
        _formResult = 'Name: ${_nameController.text}, Email: ${_emailController.text}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Form Examples:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            
            Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter your name',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Plese enter your name';
                      }
                      if (value.length < 2) {
                        return 'Name must be at least 2 characters';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 15,),

                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Plese enter your Email';
                      }
                      if (!value.contains('@')) {
                        return 'Plese enter a valid email';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 15,),

                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Submit Form'),
                    )
                ],
              ),
            ),

            if (_formResult.isNotEmpty) ...[
              SizedBox(height: 15,),
              Text('Form Result:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text(_formResult),
            ]
            ],
      ),),
    );
  }
}



class CheckboxRadioExamples extends StatefulWidget {
  const CheckboxRadioExamples({super.key});

  @override
  State<CheckboxRadioExamples> createState() => _CheckboxRadioExamplesState();
}

class _CheckboxRadioExamplesState extends State<CheckboxRadioExamples> {
bool _checkbox1 = false;
bool _checkbox2 = true;
bool _checkbox3 = false;

String? _selectedOption = 'option1';

bool _swithchValue = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Checkbox, Radio & Switch Examples:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),

            Text('Checkboxes:', style: TextStyle(fontWeight: FontWeight.bold)),
            CheckboxListTile(
              title: Text('Option 1'),
              value: _checkbox1,
              onChanged: (bool? value) {
                setState(() {
                  _checkbox1 = value ?? false;
                });
              },),
               CheckboxListTile(
              title: Text('Option 2 (Initially checked)'),
              value: _checkbox2,
              onChanged: (bool? value) {
                setState(() {
                  _checkbox2 = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Option 3'),
              value: _checkbox3,
              onChanged: (bool? value) {
                setState(() {
                  _checkbox3 = value ?? false;
                });
              },
            ),
            
            SizedBox(height: 15),

            Text('Radio Buttons:', style: TextStyle(fontWeight: FontWeight.bold),),
            RadioListTile<String>(
              title: Text('Choice A'),
              value: 'option1',
              groupValue: _selectedOption,
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('Choice B'),
              value: 'option2',
              groupValue: _selectedOption,
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('Choice C'),
              value: 'option3',
              groupValue: _selectedOption,
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            
            SizedBox(height: 15),

            SwitchListTile(
              title: Text('Enable notifications'),
              value: _swithchValue,
              onChanged: (bool value) {
                setState(() {
                  _swithchValue = value;
                });
              },
            ),

            SizedBox(height: 15,),

            Text('Current Selections:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Checkboxes: ${[_checkbox1, _checkbox2, _checkbox3]}'),
            Text('Radio: $_selectedOption'),
            Text('Switch: $_swithchValue'),
          ],
        ),
      ),
    );
  }
}



class GestureExamples extends StatefulWidget {
  const GestureExamples({super.key});

  @override
  State<GestureExamples> createState() => _GestureExamplesState();
}

class _GestureExamplesState extends State<GestureExamples> {
  String _gestureResult = 'No gesture detected';
  int _tapCount = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Gesture & Inkwell Examples:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10,),

            GestureDetector(
              onTap: () {
                setState(() {
                  _tapCount++;
                  _gestureResult = 'Tapped! Count: $_tapCount';
                });
              },

              onDoubleTap: () {
                setState(() {
                  _gestureResult = 'Double tapped!';
                });
              },

              onLongPress: () {
                setState(() {
                  _gestureResult = 'Long pressed!';
                });
              },

              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue),
                ),
                child: Column(
                  children: [
                    Icon(Icons.touch_app, size: 40, color: Colors.blue,),
                    SizedBox(height: 10,),
                    Text('Gesture Detector Area'),
                    Text('Tap, Double Tap, or Long Press'),
                  ],
                ),
              ),
            ),

            SizedBox(height: 15,),

            InkWell(
              onTap: () {
                setState(() {
                  _gestureResult = 'InkWell tapped with ripple effect!';
                });
              },
              splashColor: Colors.red.withOpacity(0.3),
              highlightColor: Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              child: Container(
                 padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Icon(Icons.favorite, size: 40, color: Colors.red),
                    SizedBox(height: 10),
                    Text('InkWell Area'),
                    Text('Tap for ripple effect'),
                  ],
                ),
              ),
            ),

            SizedBox(height: 15,),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Result: $_gestureResult',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 10,),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  _gestureResult = 'No gesture detected';
                  _tapCount = 0;
                });
              },
              child: Text('Reset'),
              )
          ],
        ),
      ),
    );
  }
}









