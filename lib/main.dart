import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Tasks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/add_task': (context) => AddTaskPage(),
      },
    );
  }
}
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signInWithEmailAndPassword() async {
    try {
      final UserCredential userCredential =
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (userCredential.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Login Successful"),
        ));
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Incorrect Credentials"),
      ));
      print("Error: $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Achievements', // Add this line
              style: TextStyle(
                fontSize: 30.0, // Increase font size
                fontWeight: FontWeight.bold, // Bold text
                color: Colors.blue, // Change text color
                letterSpacing: 2, // Add spacing between letters
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _signInWithEmailAndPassword();
              },
              child: Text('Login',style: TextStyle(letterSpacing: 1.2),),
            ),
          ],
        ),
      ),
    );
  }
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Achievements'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout), // Change the icon to logout
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/'); // Navigate back to the login page
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('tasks').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data!.docs[index]['name']),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_task');
        },
        tooltip: 'Add Achievement',
        child: Icon(Icons.add),
      ),
    );
  }
}
class AddTaskPage extends StatelessWidget {
  final TextEditingController _taskController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Achievements'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _taskController,
              decoration: InputDecoration(labelText: 'Achievement Name'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                try {if(_taskController.text==""){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Enter any text"),
                  ));
                }else{
                  FirebaseFirestore.instance.collection('tasks').add({
                    'name': _taskController.text,
                  }).then((_) {
                    Navigator.pop(context);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Achievement added successfully"),
                  ));
                }} catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Failed to add Achievement"),
                  ));
                  print("Error adding Achievement: $e");
                }
              },
              child: Text('Add Achievement',style: TextStyle(letterSpacing: 1.2),),
            ),
          ],
        ),
      ),
    );
  }
}
