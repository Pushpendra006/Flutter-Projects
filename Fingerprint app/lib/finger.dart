import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Fingers extends StatefulWidget {
  const Fingers({super.key});

  @override
  State<Fingers> createState() => _FingersState();
}

class _FingersState extends State<Fingers> {
  bool tapped = false;
  bool _isPressing = false;
  bool _result = false;
  Timer? _timer;
  String prediction = '';

  List<String> data = [
    "Financial prosperity awaits; abundance approaches swiftly.",
    "Share innovative ideas confidently; they'll be embraced warmly.",
    "Prioritize self-care; rejuvenate your mind, body, and soul.",
    "Unexpected travels bring excitement and spontaneity.",
    "Seek wisdom from admired individuals; their insights enlighten.",
    "Embrace change for personal and professional evolution.",
    "Your positivity inspires those around; spread optimism.",
    "Listen to your inner voice; it offers invaluable guidance.",
    "Prepare for unexpected romantic gestures; love brings joy.",
    "Overcome obstacles with perseverance and determination.",
    "Trust in the universe's plan; everything unfolds perfectly.",
    "Embrace opportunities for learning and growth eagerly.",
    "Acts of kindness create positive impacts; spread goodwill.",
    "Long-held dreams manifest; embrace the reality.",
    "Stay focused on goals; success is within reach.",
    "Connect with nature for peace and renewal.",
    "Intuition leads to breakthroughs; trust its whispers.",
    "Make steady progress; every step counts.",
    "Believe in your potential; greatness awaits.",
    "Take chances in love; it's worth it.",
    "Determination triumphs over adversity.",
    "Chance encounters lead to meaningful connections.",
    "Trust divine timing; things fall into place.",
    "Step out of comfort zones; growth follows.",
    "Practice gratitude for abundant blessings.",
    "Explore new opportunities with enthusiasm.",
    "Nourish relationships; they bring fulfillment.",
    "Pursue passions with dedication and zeal.",
    "Your journey unfolds beautifully; trust the process.",
    "Embrace uncertainty; it leads to growth.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: tapped == false
            ? const Text(' ')
            : const Text(
          'Hold to scan your finger',
          style: TextStyle(color: Colors.purpleAccent, fontWeight: FontWeight.bold, fontSize:28, fontFamily: 'Caveat'),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: const Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://i.pinimg.com/736x/87/4d/42/874d426d77dd0f42aad7ce66c4c68ad8.jpg',
              ),
            ),
          ),
          Center(
            child: tapped == false
                ? GestureDetector(
              onTap: () {
                setState(() {
                  tapped = true;
                });
              },
              child: Container(
                width: 300,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: const Center(
                  child: Text(
                    'NEW PREDICTION',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 34, fontFamily: 'Caveat'),
                  ),
                ),
              ),
            )
                : GestureDetector(
              onTapDown: (_) {
                setState(() {
                  _isPressing = true;
                });
                _timer = Timer(const Duration(seconds: 3), () {
                  setState(() {
                    _result = true;
                  });
                });
              },
              onTapUp: (_) {
                setState(() {
                  _isPressing = false;
                });
                _timer?.cancel();
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _isPressing ? 120 : 100,
                height: _isPressing ? 120 : 100,
                decoration: BoxDecoration(
                  color: _isPressing
                      ? Colors.green
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(53),
                ),
                child: Icon(
                  Icons.fingerprint,
                  size: 100,
                  color: _isPressing ? Colors.red : Colors.white,
                ),
              ),
            ),
          ),
          if (_result)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 350,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Center(
                      child: Text(
                        getRandomPrediction(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white, fontSize: 25, fontFamily: 'Caveat',fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _result = false;
                        tapped = false;
                      });
                    },
                    child: const Text('Restart',style: TextStyle( fontFamily: 'Caveat',fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  String getRandomPrediction() {
    final Random random = Random();
    final int randomNumber = random.nextInt(data.length);
    return data[randomNumber];
  }
}

