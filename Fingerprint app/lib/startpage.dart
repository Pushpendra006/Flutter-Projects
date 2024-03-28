import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'tabsScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    _checkFirstTime();
  }

  Future<void> _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if(!isFirstTime){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
    }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'WELCOME',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 34,fontWeight: FontWeight.bold, fontFamily: 'Caveat'),
                  ),
                  const SizedBox(height: 7),
                  const Text(
                    'Please, take a moment to read our privacy policy. By clicking on the next button you accept our privacy policy.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 27, fontFamily: 'Caveat'),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.indigo.shade700,
                      ),
                      child: const Text(
                        'ACCEPT',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 34,fontWeight: FontWeight.bold, fontFamily: 'Caveat'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                launch('http://sites.google.com/view/zen-solutions-apps/privacy');
              },
              child: const Text(
                'VIEW PRIVACY POLICY',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 27, fontFamily: 'Caveat', fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ) // Empty container when not showing HomePage
    );
  }
}
