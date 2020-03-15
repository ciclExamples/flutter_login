import 'package:cicla_app_00/services/auth.dart';
import 'package:cicla_app_00/shared/constants.dart';
import 'package:cicla_app_00/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            // appBar: AppBar(
            //   backgroundColor: Color(0xffffebea),
            //   elevation: 0.0,
            //   title: Text('Sign in'),
            //   actions: <Widget>[
            //     FlatButton.icon(
            //         onPressed: () {
            //           widget.toggleView();
            //         },
            //         icon: Icon(Icons.person),
            //         label: Text('Register'))
            //   ],
            // ),
            body: Container(
               decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xffffebea), Color(0xffffffff)]
                )
              ),
              child: Center(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(50, 80, 50, 40),
                    
                      
                      child: Form(
                    
                        
                        key: _formKey,
                        child: Column(
                         
                          children: <Widget>[
                            Image.asset('assets/images/logo-cicla-app.png'),
                            SizedBox(height: 30.0),
                            Text('Bienvenida',
                            style: TextStyle(fontSize: 30.0, color: Color(0xff3100B3))),
                            SizedBox(height: 20.0),
                            TextFormField(
                              decoration:
                                  textImputDecoration.copyWith(hintText: 'Email'),
                              validator: (val) =>
                                  val.isEmpty ? 'Enter an email' : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                            ),
                            SizedBox(height: 20.0),
                            TextFormField(
                              decoration:
                                  textImputDecoration.copyWith(hintText: 'Password'),
                              validator: (val) => val.length < 6
                                  ? 'Enter a password 6+ chars long'
                                  : null,
                              obscureText: true,
                              onChanged: (val) {
                                setState(() => password = val);
                              },
                            ),
                            SizedBox(height: 20.0),
                            RaisedButton(
                              color: Color(0xffffffff),
                              // child: Text('Sign in',
                              //     style: TextStyle(color: Color(0xff3100B3))),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(8.0),
                                side: BorderSide(color: const Color(0xff3100B3))
                              ),
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: const Text(
                                    'Entrar',
                                    style: TextStyle(fontSize: 20, color: Color(0xff3100B3))
                                ),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() => loading = true);
                                  dynamic result = await _auth
                                      .signInWithEmailAndPassword(email, password);
                                  print(result);
                                  if (result == null) {
                                    setState(() {
                                      error = 'Please supply a valid account';
                                      loading = false;
                                    });
                                  }
                                }
                              },
                            ),
                            SizedBox(
                              height: 12.0,
                            ),
                            Text(
                              error,
                              style: TextStyle(color: Colors.red, fontSize: 14.0),
                            ),
                            GestureDetector(
                              child: Text("Crear cuenta", style: TextStyle(decoration: TextDecoration.underline, color: Color(0xff3100B3))),
                              onTap: () {
                                widget.toggleView();
                                // do what you need to do when "Click here" gets clicked
                              }
                            )
                          ],
                        ),
                      ),
                    
                  )
              ),
            )
        );
  }
}
