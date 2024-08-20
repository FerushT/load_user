import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadUser extends StatefulWidget {
  const LoadUser({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadUserState createState() => _LoadUserState();
}

class _LoadUserState extends State<LoadUser> {
  final TextEditingController _controller = TextEditingController();
  String _username = "";

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  // Mit dieser Funktion wird der Benutzername aus dem SharedPreferences geladen.
  _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString("username") ?? "";
    });
  }

  // Mit dieser Funktion wird der Benutzername in ShardePreferences gespeichert.
  _saveUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("username", _controller.text);
    setState(() {
      _username = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Benutzernamen speichern"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration:
                  const InputDecoration(labelText: "Gib deinen Namen ein"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _saveUsername,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 135, 232, 124)),
              child: const Text("Namen speichern"),
            ),
            const SizedBox(height: 30),
            const Text(
              "Gespeicherter Name:",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              _username,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
