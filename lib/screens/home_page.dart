import 'package:color_update_on_dialog/screens/color_picker_dialog.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Color containerColor = Colors.grey; // Initial color

  @override
  Widget build(BuildContext context) {

    // Device's screen size
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan.withOpacity(0.5),
          title: Text(
            "COLOR UPDATE ON DIALOG",
            style: TextStyle(
              fontSize: screenWidth * 0.035,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 3
            )
          ),
          centerTitle: true
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ColorPickerDialog(
                    initialColor: containerColor,
                    onColorChanged: (Color color) {
                      setState(() {
                        containerColor = color;
                      });
                    }
                  );
                }
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              fixedSize: Size(screenWidth * 0.34, screenHeight * 0.08),
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.grey
                )
              ),
              elevation: 0.0
            ),
            child: Text(
              "AlertBox",
              style: TextStyle(
                fontSize: screenWidth * 0.036,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                letterSpacing: 3
              )
            )
          )
        )
      )
    );
  }
}

