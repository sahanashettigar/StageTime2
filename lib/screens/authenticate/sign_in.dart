import 'package:flutter/material.dart';
import 'package:stagetime/screens/artist/artist_feed.dart';
import 'package:stagetime/screens/navbar.dart';
import 'package:stagetime/services/auth.dart';
import 'sign_up.dart';
import 'profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

Color myColor = Color(0xff01395E);

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final AuthService _auth =AuthService();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _obscurePassword;
  bool _autovalidate;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  //text field state
  String email='';
  String password='';



  @override
  void initState() {
    super.initState();
    _obscurePassword = true;
    _autovalidate = false;
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor,
      body: Center(child: _buildLoginForm()),
    );
  }

//   new TextField(
//   decoration: new InputDecoration(
//       border: new OutlineInputBorder(
//         borderRadius: const BorderRadius.all(
//           const Radius.circular(10.0),
//         ),
//       ),
//       filled: true,
//       hintStyle: new TextStyle(color: Colors.grey[800]),
//       hintText: "Type in your text",
//       fillColor: Colors.white70),
// )
// Share

  Widget _buildLoginForm() {
    return Form(
      key: _key,
      autovalidate: _autovalidate,
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset('assets/mic.png'),
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (val){
                    setState(()=> email=val);

                  },
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(50.0),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: new EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 20.0),
                    filled: true,
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.white),
                    isDense: true,
                    fillColor: Color(0xff275F84),
                  ),
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  validator: _validateEmail,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (val){
                      setState(()=> password=val);
                  },
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(50.0),
                      ),
                    ),
                    contentPadding: new EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 20.0),
                    filled: true,
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white),
                    isDense: true,
                    fillColor: Color(0xff275F84),
                  ),
                  obscureText: _obscurePassword,
                  controller: _passwordController,
                  validator: (val) => _validateRequired(val, 'Password'),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0)),
                  child: Text('LOGIN'),
                  // onPressed: _validateFormAndLogin
                  onPressed: () async{
                    print(email);
                    print(password);
                  }
                  ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  String _validateRequired(String val, fieldName) {
    if (val == null || val == '') {
      return '$fieldName is required';
    }
    return null;
  }

  String _validateEmail(String value) {
    if (value == null || value == '') {
      return 'Email is required';
    }
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Enter valid email address';
    }
    return null;
  }

  void _validateFormAndLogin() {
    // Get form state from the global key
    var formState = _key.currentState;

    // check if form is valid
    if (formState.validate()) {
      print('Form is valid');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NavBar()),
      );
    } else {
      // show validation errors
      // setState forces our [State] to rebuild
      setState(() {
        _autovalidate = true;
      });
    }
  }
}

// const miclogo='assets/mosaic.svg';

// RaisedButton(
//                 child: Text(
//                   'SIGN IN',
//                   style: TextStyle(fontSize: 20),
//                 ),
//                 textColor: Colors.white,
//                 color: Color(0xff275F84),
//                 shape: new RoundedRectangleBorder(
//                   borderRadius: new BorderRadius.circular(30.0),
//                 ),
//                 onPressed: () async {})));

//  Form(
//               child:Column(children: [
//                 SizedBox(height:20.0),
//                 TextFormField(
//                   onChanged: (val){

//                 }),
//                   SizedBox(height:20.0),
//                   TextFormField(
//                     obscureText: true,
//                   onChanged: (val){

//                 }),

//               ],)
//             )

// class SignUp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Color myColor = Color(0xff01395E);

//     return Scaffold(
//       backgroundColor: myColor,
//       body:MySignupForm(),

//     );
//   }
// }

// class MySignupForm extends StatefulWidget {
//   @override
//   MySignupForm createState() {
//     return MySignupForm();
//   }
// }

// class _mySignupFormState extends State<mySignupForm> {

//   // not a GlobalKey<MyCustomFormState>.
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     // Build a Form widget using the _formKey created above.
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           TextFormField(
//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 // Validate returns true if the form is valid, or false
//                 // otherwise.
//                 if (_formKey.currentState.validate()) {
//                   // If the form is valid, display a Snackbar.
//                   Scaffold.of(context)
//                       .showSnackBar(SnackBar(content: Text('Processing Data')));
//                 }
//               },
//               child: Text('Submit'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
