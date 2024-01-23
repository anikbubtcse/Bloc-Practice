import 'package:bloc_practice/bloc/university_bloc/university_bloc.dart';
import 'package:bloc_practice/pages/either_type_error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  static const String myHomePage = 'myHomePage';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    context.read<UniversityBloc>().add(UniversityDetailsEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Practice'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade100,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, EitherTypeErrorPage.eitherTypeErrorPage);
                  },
                  child: Text(
                    'Check Either Type Error',
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  )),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<UniversityBloc, UniversityState>(
                  builder: (context, universityState) {
                if (universityState is UniversityLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (universityState is UniversityLoaded) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: universityState.universityModel.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title:
                            Text(universityState.universityModel[index].name),
                        // trailing: Text(
                        //     todoState.todoModel[index].completed.toString()),
                      );
                    },
                  );
                }

                if (universityState is UniversityError) {
                  return Center(child: Text(universityState.message));
                }

                return Container();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
