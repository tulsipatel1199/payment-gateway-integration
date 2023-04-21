import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(34, 48, 60, 1),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 60),
              alignment: Alignment.center,
              child: Image.asset('assets/tsf_logo.png'),
            ),
            _landingPageColumnWidgets(
                text: 'The Sparks Foundation',
                marginFromTopVal: 0.0,
                fontSize: 25.0,
                color: Colors.amber),
            _landingPageColumnWidgets(
                text: 'Website and Mobile App Development Internship in Flutter',
                marginFromTopVal: 30.0,
                fontSize: 22.0),
            _landingPageColumnWidgets(
                text: 'Payment Gateway Integration',
                marginFromTopVal: 30.0,
                fontSize: 20.0,
                color: Colors.green),
            _donateButton(),
          ],
        ),
      ),
    );
  }

  Widget _landingPageColumnWidgets(
      {required String text,
      required double marginFromTopVal,
      required double fontSize,
      Color color = Colors.white70}) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: marginFromTopVal),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
        ),
      ),
    );
  }

  Widget _donateButton() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      alignment: Alignment.center,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.green,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
              side: const BorderSide(color: Colors.green)),
        ),
        child: const Text(
          'Donate',
          style: TextStyle(color: Colors.green, fontSize: 16.0),
        ),
        onPressed: () async {
          try {
            /// This is the RazorPay Payment Pages onBoarding link
            await launchUrl(Uri.parse("https://rzp.io/l/flUWqlDPf"), mode: LaunchMode.externalApplication);
          } catch (e) {
            debugPrint(e.toString());
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      backgroundColor: const Color.fromRGBO(34, 48, 60, 0.6),
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      title: const Center(
                        child: Text(
                          'Unknown Error Occured',
                          style: TextStyle(color: Colors.red, fontSize: 18.0),
                        ),
                      ),
                      content: const Center(
                        child: Text(
                          'Make Sure your Internet Connected Properly',
                          style: TextStyle(color: Colors.amber, fontSize: 18.0),
                        ),
                      ),
                    ));
          }
        },
      ),
    );
  }
}
