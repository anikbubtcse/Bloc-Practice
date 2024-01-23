import 'package:bloc_practice/custom/custom_method.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EitherTypeErrorPage extends StatefulWidget {
  const EitherTypeErrorPage({super.key});

  static const String eitherTypeErrorPage = "eitherTypeErrorPage";

  @override
  State<EitherTypeErrorPage> createState() => _EitherTypeErrorPageState();
}

class _EitherTypeErrorPageState extends State<EitherTypeErrorPage> {
  TextEditingController errorTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Either Type Error',
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w400)),
        centerTitle: true,
        backgroundColor: Colors.blue.shade100,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: errorTextEditingController,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                width: 1, color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                width: 1, color: Colors.blue))),
                    onChanged: (value) {
                      setState(() {
                        errorTextEditingController.text = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                    onPressed: () {
                      final data = CustomMethod.dateTimeFormatter(
                          errorTextEditingController.text);

                      data.fold((l) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(l.errorMessage),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Ok"))
                              ],
                            );
                          },
                        );
                      }, (r) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(r),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Ok"))
                              ],
                            );
                          },
                        );
                      });
                    },
                    child: Text('Tap'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
