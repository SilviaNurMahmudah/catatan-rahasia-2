import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget{
  const Login({super.key});

  @override
  State<Login> createState() => _LoginAppState();
}

class _LoginAppState extends State<Login>{
  TextEditingController getPass = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isHidePassword = true;
  
  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[ 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: _isHidePassword,
                autofocus: false,
                controller: getPass,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  LengthLimitingTextInputFormatter(6),
                ],
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  contentPadding: const EdgeInsets.only(left: 30.0, top: 20.0, bottom: 20.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _togglePasswordVisibility();
                    },
                    child: Icon(
                      _isHidePassword ? Icons.visibility_off : Icons.visibility,
                      color: _isHidePassword ? Colors.grey[600] : Colors.black,
                    ),
                  ),
                  isDense: true,
                  labelText: ('Masukkan PIN Anda'),
                  labelStyle: const TextStyle(
                    color: Colors.black
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 150,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () async {
                    String pass = '123456';
                    if (getPass.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("PIN tidak boleh kosong"),
                          duration: Duration(seconds: 2)
                        ),
                      );
                    } else if (getPass.text == pass) {
                      Navigator.pushNamed(context, '/note');
                    } else if (getPass.text.length < 5) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("minimal PIN harus 6 karakter"),
                          duration: Duration(seconds: 2)
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("PIN anda salah"),
                          duration: Duration(seconds: 2)
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Buka",
                    style: TextStyle(
                      letterSpacing: 1,
                      color: Colors.white,
                      fontSize: 16
                    ),
                  ),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}
