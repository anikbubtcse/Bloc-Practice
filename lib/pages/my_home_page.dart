import 'package:bloc_practice/bloc/university_bloc/university_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

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
              })
            ],
          ),
        ),
      ),
    );
  }
}
