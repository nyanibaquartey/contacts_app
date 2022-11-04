import 'package:flutter/material.dart';
import 'package:contacts_app/contacts_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Contacts'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Contacts> contactList = Contacts.contacts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final conList = contactList[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(conList.image),
              ),
              title: Text(
                conList.name,
                style: const TextStyle(fontFamily: 'Inconsolata'),
              ),
              subtitle: Text(
                conList.phone,
              ),
            );
          },
          itemCount: contactList.length,
        ));
  }
}
