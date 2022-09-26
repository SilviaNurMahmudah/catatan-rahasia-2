import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Catatan extends StatefulWidget{
  const Catatan({super.key});

  @override
  State<Catatan> createState() => _CatatanAppState();
}

class _CatatanAppState extends State<Catatan>{
  TextEditingController catatanController = TextEditingController();   
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> insert() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('note', catatanController.text);
    });
  }

  Future<void> load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      catatanController.text = (prefs.getString('note') ?? '');
    });
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context){  
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children:<Widget>[
            const Padding(padding: EdgeInsets.only(top: 30)),
            const Text(
              'Catatan Rahasiaku',
              style: TextStyle(
                letterSpacing: 1,
                color: Colors.black,
                fontSize: 16
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: catatanController,
                maxLines: 15,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  contentPadding: EdgeInsets.all(10),
                  labelStyle: TextStyle(
                    color: Colors.black
                  ),
                ),
                onChanged: (value) {}, 
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 250,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    insert();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Data disimpan"),
                        duration: Duration(seconds: 2)
                      ),
                    );
                  },   
                  child: const Text(
                    'Simpan',
                    style: TextStyle(
                      letterSpacing: 1,
                      color: Colors.white,
                      fontSize: 16
                    ),
                  ),
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 250,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  }, 
                  child: const Text(
                    'Tutup Catatan Rahasia',
                    style: TextStyle(
                      letterSpacing: 1,
                      color: Colors.white,
                      fontSize: 16
                    ),
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}