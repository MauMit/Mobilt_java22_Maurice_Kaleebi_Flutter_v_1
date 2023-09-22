import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shake/shake.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_animate/flutter_animate.dart';
AudioPlayer player = AudioPlayer();

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RapperCard(),
    ));

class RapperCard extends StatefulWidget {
  @override
  State<RapperCard> createState() => _RapperCardState();
}

class _RapperCardState extends State<RapperCard> {
  late ShakeDetector detector;

  @override
  void initState() {
    super.initState();
    detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        print('shake detected');
        player.play(AssetSource('shakeIt.mp3'));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('SHAKE IT OFF'),
            ),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    detector.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[900],
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.add_alarm_rounded),
              tooltip: 'Press me',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('You Know What Time It Is')));
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: CircleAvatar(
                backgroundImage:
                    AssetImage('assets/pac.jpg'),
                    /* NetworkImage('https://i.imgur.com/Fsu2qaY.jpg') denna bild fungerar i localhost men inte när man kör build ,
 */
                radius: 40,
              ),
            ),
            FloatingActionButton(
              child: Text('click me',
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                player.play(AssetSource('hennessy.mp3'));
              },
            ),
            const Divider(
              height: 60,
            ),
            const Text('NAME',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                )),
            const SizedBox(height: 10.0),
            Text('Tupac',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 30.0),
            const Text('Occupation',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                )),
            const SizedBox(height: 10.0),
            Text('Rapper',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 30.0),
            const Text('DATE OF BIRTH',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                )),
            const SizedBox(height: 10.0),
            Text('June 16, 1971',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 20.0),
            ElevatedButton(
                child: const Text('Go to Snoop page'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SnoopPage()),
                  );
                }),
            const SizedBox(height: 20.0),
            ElevatedButton(
                child: const Text('Go to Radio page'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RadioPage()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class SnoopPage extends StatelessWidget {
  const SnoopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        title: const Text('Snoopy D-O-Double'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.add_alarm_rounded),
              tooltip: 'Press me',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Or Maybe You Dont')));
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: CircleAvatar(
                backgroundImage:
/*                     NetworkImage('https://i.imgur.com/sk7ojHE.jpg') denna bild fungerar i localhost men inte när man kör build ,
 */                       AssetImage('assets/snoop.jpg'),
                radius: 40,
              ),
            ),
            FloatingActionButton(
              child: Text('click me',
              textAlign: TextAlign.center,
              ),
              onPressed: () {
                var player = AudioPlayer();
                player.play(AssetSource('doggydog.mp3'));
              },
            ),
            const Divider(
              height: 60,
            ),
            const Text('NAME',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                )),
            const SizedBox(height: 10.0),
            Text('Snoop Dogg',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 30.0),
            const Text('Occupation',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                )),
            const SizedBox(height: 10.0),
            Text('Rapper',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 30.0),
            const Text('DATE OF BIRTH',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                )),
            const SizedBox(height: 10.0),
            Text('October 20, 1971',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                )),
            OutlinedButton(
                child: const Text(
                  'Go to home page',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}

class RadioPage extends StatefulWidget {
  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  int? selectedValue = 0;
  Color? backgroundColor;

  @override
  void initState() {
    super.initState();
    loadSelectedValue();
  }

  loadSelectedValue() async {
    SharedPreferences myprefs = await SharedPreferences.getInstance();
    int loadedValue = myprefs.getInt('selectedValue') ?? 0;
    setState(() {
      selectedValue = loadedValue;
      backgroundColor = getColorFromSelectedValue(selectedValue);
    });
  }

  void saveSelectedValue(int newValue) async {
    SharedPreferences myprefs = await SharedPreferences.getInstance();
    myprefs.setInt('selectedValue', newValue);
  }

  Color getColorFromSelectedValue(int? selectedValue) {
    switch (selectedValue) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.blue;
      case 3:
        return Colors.green;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Buttons'),
        centerTitle: true,
        // backgroundColor: backgroundColor,
      ),
      body: Container(
        color: backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("What Color Do You want?"),
            Row(
              children: [
                Radio(
                  activeColor: Colors.black,
                  value: 1,
                  groupValue: selectedValue,
                  onChanged: (newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedValue = newValue;
                        saveSelectedValue(newValue);
                        backgroundColor = Colors.red;
                      });
                    }
                  },
                ),
                SizedBox(width: 10.0),
                Text('RED'),
              ],
            ),
            Row(
              children: [
                Radio(
                  activeColor: Colors.black,
                  value: 2,
                  groupValue: selectedValue,
                  onChanged: (newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedValue = newValue;
                        saveSelectedValue(newValue);
                        backgroundColor = Colors.blue;
                      });
                    }
                  },
                ),
                SizedBox(width: 10.0),
                Text('BLUE'),
              ],
            ),
            Row(
              children: [
                Radio(
                  activeColor: Colors.black,
                  value: 3,
                  groupValue: selectedValue,
                  onChanged: (newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedValue = newValue;
                        saveSelectedValue(newValue);
                        backgroundColor = Colors.green;
                      });
                    }
                  },
                ),
                SizedBox(width: 10.0),
                Text('GREEN'),
              ],
            ),
            OutlinedButton(
                child: const Text(
                  'Go to home page',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
