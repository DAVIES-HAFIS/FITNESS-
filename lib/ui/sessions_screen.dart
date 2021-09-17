import 'package:flutter/material.dart';
import 'package:global_fitness_app/data/session.dart';
import 'package:global_fitness_app/data/spHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({Key? key}) : super(key: key);

  @override
  _SessionsScreenState createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  List<Session> sessions = [];
  final TextEditingController _txtDescription = TextEditingController();
  final TextEditingController _txtDuration = TextEditingController();
  final SPHelper helper = SPHelper();

  @override
  void initState() {
    helper.init().then((value) => updateScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YOUR TRAINING SESSIONS'),
      ),
      body: ListView(
       children: getContent(),
      ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            showSessionDialog(context);
          },
        ),
    );
  }

  Future<dynamic> showSessionDialog(BuildContext context) async{
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Insert Training Session'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: _txtDescription,
                    decoration: InputDecoration(
                      hintText: 'Training Description',
                    ),
                  ),
                  TextField(
                    controller: _txtDuration,
                    decoration: InputDecoration(
                      hintText: 'Training Duration',
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: Text('Cancel'),
                onPressed: (){
                  Navigator.pop(context);
                  _txtDuration.text = '';
                  _txtDuration.text = '';
                },
              ),
              ElevatedButton(
                  onPressed: saveSession,
                  child: Text('Save')
              ),
            ],
          );
        },
    );
  }

  Future saveSession() async{
    DateTime now =DateTime.now();
    String today = '${now.year}-${now.month}-${now.day}';
    int id = helper.getCounter() + 1;
    Session newSession = Session(
      id, _txtDescription.text, int.tryParse(_txtDuration.text)??0, today);
    helper.writeSession(newSession).then((_) {
      updateScreen();
      helper.setCounter();
    });
    _txtDescription.text = '';
    _txtDuration.text = '';
    Navigator.pop(context);
  }

  List<Widget> getContent(){
    List<Widget> tiles = [];
    sessions.forEach((session) {
      tiles.add(Dismissible(
        key: UniqueKey(),
        onDismissed: (_){
          helper.deleteSession(session.id).then((value) => updateScreen());
        },
        child: ListTile(
          title: Text(session.description),
          subtitle: Text('${session.date} - duartion: ${session.duration} min')   ,
        ),
      ));
    });
    return tiles;
  }

  void updateScreen(){
    sessions = helper.getSessions();
    setState(() {

    });
  }
}
