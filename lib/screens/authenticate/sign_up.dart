import 'package:flutter/material.dart';
import 'package:stagetime/services/auth.dart';

Color myColor = Color(0xff01395E);

class Sign_Up extends StatefulWidget {
  @override
  _Sign_UpState createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
    final AuthService _auth =AuthService();
    final _formKey=GlobalKey<FormState>();

  @override
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _obscurePassword;
  bool _autovalidate;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _mobileNoController;
  TextEditingController _usernameController;
   String email='';
  String password='';
  String userName='';
  String mobileNo='';
  String error='';



  @override
  void initState() {
    super.initState();
    _obscurePassword = true;
    _autovalidate = false;
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _mobileNoController = TextEditingController();
    _usernameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor,
      body: Center(child: _buildSignUpForm()),
    );
  }

  Widget _buildSignUpForm() {
    return Form(
      key: _formKey,
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
                  textAlign: TextAlign.center,
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
                      setState(()=> userName=val);
                  },
                  textAlign: TextAlign.center,
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
                    hintText: 'User Name',
                    hintStyle: TextStyle(color: Colors.white),
                    isDense: true,
                    fillColor: Color(0xff275F84),
                  ),
                  controller: _usernameController,
                  keyboardType: TextInputType.name,
                  autocorrect: false,
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
                  textAlign: TextAlign.center,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (val){
                      setState(()=> mobileNo=val);
                  },
                  textAlign: TextAlign.center,
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
                    hintText: '10 digit mobile number',
                    hintStyle: TextStyle(color: Colors.white),
                    isDense: true,
                    fillColor: Color(0xff275F84),
                  ),
                  controller: _mobileNoController,
                  keyboardType: TextInputType.number,
                  autocorrect: false,
                  validator: _validateMobileNo,
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
                  onPressed: ()async{
                    if(_formKey.currentState.validate()){
                      dynamic result= await _auth.signUpStageTime(email,password);
                      if(result ==null){
                        setState(()=>error='');
                      }
                      print(email);
                      print(email);
                      print(email);
                      print(email);
                    }

                  }),
                  SizedBox(height:10),
                  Text(
                    error,
                    style:TextStyle(color:Colors.red,fontSize:14.0),
                  )


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

  String _validateMobileNo(String value) {
    if (value == null || value == '') {
      return 'Mobile Number is required';
    }
    Pattern pattern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp regex = new RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Enter valid mobile no';
    }
    return null;
  }

  void _validateFormAndLogin() {
    // Get form state from the global key
    var formState = _key.currentState;

    // check if form is valid
    if (formState.validate()) {
      print('Form is valid');
    } else {
      // show validation errors
      // setState forces our [State] to rebuild
      setState(() {
        _autovalidate = true;
      });
    }
  }
}
