import 'package:flutter/material.dart';

void main() {
  runApp(SimpleCalculatorApp());
}

class SimpleCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData.dark(),
      home: TabNavigation(),
    );
  }
}

class TabNavigation extends StatefulWidget {
  @override
  _TabNavigationState createState() => _TabNavigationState();
}

class _TabNavigationState extends State<TabNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    SignInScreen(),
    SignUpScreen(),
    Calculation(),
    SettingsScreen(),
    HelpScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text(
          "Simple Calculator",
          style: TextStyle(color: Colors.teal[600], fontWeight: FontWeight.bold),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.teal),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                'User Name',
                style: TextStyle(color: Colors.teal[600]),
              ),
              accountEmail: Text(
                'user@example.com',
                style: TextStyle(color: Colors.teal[600]),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'U',
                  style: TextStyle(fontSize: 40.0, color: Colors.teal[600]),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.grey[800],
              ),
            ),
            ListTile(
              leading: Icon(Icons.login, color: Colors.orange[900]),
              title: Text('Sign In'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.app_registration, color: Colors.blue[900]),
              title: Text('Sign Up'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _currentIndex = 1;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.calculate, color: Colors.green),
              title: Text('Calculator'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _currentIndex = 2;
                });
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _currentIndex = 3;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.help, color: Colors.blue),
              title: Text('Help'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _currentIndex = 4;
                });
              },
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.login, color: Colors.orange),
            label: 'Sign In',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration, color: Colors.blue),
            label: 'Sign Up',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate, color: Colors.green),
            label: 'Calculator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help, color: Colors.blue),
            label: 'Help',
          ),
        ],
      ),
    );
  }
}

class SignInScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In", style: TextStyle(color: Colors.teal[900])),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle sign in logic here
                String username = _usernameController.text;
                String password = _passwordController.text;
                print('Username: $username, Password: $password');
              },
              child: Text('Sign In', style: TextStyle(color: Colors.teal[900])),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up", style: TextStyle(color: Colors.teal[900])),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle sign up logic here
                String username = _usernameController.text;
                String email = _emailController.text;
                String password = _passwordController.text;
                print('Username: $username, Email: $email, Password: $password');
              },
              child: Text('Sign Up', style: TextStyle(color: Colors.teal[900])),
            ),
          ],
        ),
      ),
    );
  }
}

class Calculation extends StatefulWidget {
  @override
  _CalculationState createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  List<dynamic> inputList = [0];
  String output = '0';

  void _handleClear() {
    setState(() {
      inputList = [0];
      output = '0';
    });
  }

  void _handlePress(String input) {
    setState(() {
      if (_isOperator(input)) {
        if (inputList.last is int) {
          inputList.add(input);
          output += input;
        }
      } else if (input == '=') {
        while (inputList.length > 2) {
          int firstNumber = inputList.removeAt(0) as int;
          String operator = inputList.removeAt(0);
          int secondNumber = inputList.removeAt(0) as int;
          int partialResult = 0;

          if (operator == '+') {
            partialResult = firstNumber + secondNumber;
          } else if (operator == '-') {
            partialResult = firstNumber - secondNumber;
          } else if (operator == '*') {
            partialResult = firstNumber * secondNumber;
          } else if (operator == '/') {
            partialResult = firstNumber ~/ secondNumber;
            // Protect against division by zero
            if (secondNumber == 0) {
              partialResult = firstNumber;
            }
          }

          inputList.insert(0, partialResult);
        }

        output = '${inputList[0]}';
      } else {
        int? inputNumber = int.tryParse(input);
        if (inputNumber != null) {
          if (inputList.last is int && !_isOperator(output[output.length - 1])) {
            int lastNumber = (inputList.last as int);
            lastNumber = lastNumber * 10 + inputNumber;
            inputList.last = lastNumber;

            output = output.substring(0, output.length - 1) + lastNumber.toString();
          } else {
            inputList.add(inputNumber);
            output += input;
          }
        }
      }
    });
  }

  bool _isOperator(String input) {
    return input == "+" || input == "-" || input == "*" || input == "/";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator", style: TextStyle(color: Colors.teal[900])),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
              decoration: InputDecoration(border: InputBorder.none),
              controller: TextEditingController()..text = output,
              readOnly: true,
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              children: <Widget>[
                for (var i = 0; i <= 9; i++)
                  TextButton(
                    child: Text("$i", style: TextStyle(fontSize: 20)),

                    onPressed: () => _handlePress("$i"),
                  ),
                TextButton(
                  child: Text("C", style: TextStyle(fontSize: 20, color: Colors.red)),
                  onPressed: _handleClear,
                ),
                TextButton(
                  child: Text("+", style: TextStyle(fontSize: 20, color: Colors.green)),
                  onPressed: () => _handlePress("+"),
                ),
                TextButton(
                  child: Text("-", style: TextStyle(fontSize: 20, color: Colors.green)),
                  onPressed: () => _handlePress("-"),
                ),
                TextButton(
                  child: Text("*", style: TextStyle(fontSize: 20, color: Colors.green)),
                  onPressed: () => _handlePress("*"),
                ),
                TextButton(
                  child: Text("/", style: TextStyle(fontSize: 20, color: Colors.green)),
                  onPressed: () => _handlePress("/"),
                ),
                TextButton(
                  child: Text("=", style: TextStyle(fontSize: 20, color: Colors.green)),
                  onPressed: () => _handlePress("="),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings", style: TextStyle(color: Colors.teal[900])),
      ),
      body: Center(
        child: Text(
          'Settings Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help", style: TextStyle(color: Colors.teal[900])),
      ),
      body: Center(
        child: Text(
          'Help Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
