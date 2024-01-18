import 'package:color_update_on_dialog/constants.dart';
import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorPickerDialog extends StatefulWidget {

  final Color initialColor;
  final Function(Color) onColorChanged;
  
  const ColorPickerDialog({
    required this.initialColor,
    required this.onColorChanged,
    super.key
  });

  @override
  State<ColorPickerDialog> createState() => _ColorPickerDialogState();
}

class _ColorPickerDialogState extends State<ColorPickerDialog> {

  final obj = Constants();
  Color containerColor = Colors.grey; // Initial color
  Color selectedColor = Colors.grey; // Temporary variable to store the selected color

  @override
  void initState() {
    super.initState();
    containerColor = widget.initialColor; // Set initial color when the dialog is created
  }

  void changeColor(Color color) {
    setState(() {
      // Update the temporary variable only when a color is selected
      selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {

    // Device's screen size
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Textstyle for title
    textStyleForTitle() {
      return GoogleFonts.poppins(
        fontSize: screenWidth * 0.04,
        color: Colors.grey,
        fontWeight: FontWeight.w500,
        letterSpacing: 1
      );
    }

    return AlertDialog(
      content: SizedBox(
        height: 150.0,
        width: 280.0,
        child: Column(
          children: [
            const SizedBox(
              height: 10.0
            ),
            GestureDetector(
              onTap: () {
                // Show the color picker
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: SizedBox(
                        height: screenHeight * 0.55,
                        width: screenWidth * 0.68225,
                        child: Scaffold(
                          backgroundColor: Colors.transparent,
                          body: Column(
                            children: [
                              SizedBox(
                                height: screenHeight * 0.02
                              ),
                              Center(
                                child: Text(
                                  "Pick a color",
                                  style: textStyleForTitle()
                                )
                              ),
                              SizedBox(
                                height: screenHeight * 0.03
                              ),
                              SizedBox(
                                height: screenHeight * 0.395,
                                child: ColorPicker(
                                  color: containerColor,
                                  onColorChanged: changeColor,
                                  pickersEnabled: const {
                                    ColorPickerType.accent: false
                                  },
                                  enableShadesSelection: false,
                                  columnSpacing: 0.0,
                                  width: screenWidth * 0.125, // Width of the color indicator items
                                  height: screenWidth * 0.125, // Height of the color indicator items
                                  borderRadius: screenWidth * 0.07,
                                  spacing: screenWidth * 0.0325, // Horizontal spacing between the color picker indicators
                                  runSpacing: screenWidth * 0.0325 // Vertical spacing between the color picker indicators
                                )
                              ),
                              SizedBox(
                                height: screenHeight * 0.02
                              )
                            ]
                          ),

                          // Buttons
                          bottomNavigationBar: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              // Cancel
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context); // Close the dialog box
                                },
                                child: Container(
                                  padding: EdgeInsets.only(bottom: screenWidth * 0.01),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: obj.greyShade
                                      )
                                    )
                                  ),
                                  child: Text(
                                    "Cancel",
                                    style: GoogleFonts.poppins(
                                      fontSize: screenWidth * 0.035,
                                      color: obj.blackShade,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1
                                    )
                                  )
                                )
                              ),

                              // Ok button
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    // Update the containerColor with the selectedColor when Ok button is pressed
                                    containerColor = selectedColor;                                    
                                  });
                                  Navigator.pop(context); // Close the color picker dialog
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  fixedSize: Size(screenWidth * 0.2, screenHeight * 0.05),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(screenWidth * 0.07)
                                  )
                                ),
                                child: Text(
                                  "Ok",
                                  style: GoogleFonts.poppins(
                                    fontSize: screenWidth * 0.035,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1
                                  )
                                )
                              )
                            ]
                          )
                        )
                      )
                    );
                  }
                );
              },
              child: Container(
                height: 70.0,
                width: 230.0,
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(40.0)
                ),
                child: const Center(
                  child: Text(
                    "Color",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3
                    )
                  )
                )
              )
            ),
            const SizedBox(
              height: 30.0
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey
                    )
                  )
                ),
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2
                  )
                )
              )
            )
          ]
        )
      )
    );
  }
}

