import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon_msa_clean_architecture_bloc/features/restaurant/data/repositories/yelp_repositories.dart';
import 'package:hackathon_msa_clean_architecture_bloc/features/restaurant/presentation/bloc/restaurant_bloc.dart';
import 'package:hackathon_msa_clean_architecture_bloc/features/restaurant/presentation/pages/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final SpotRepositoryImpl spotRepository =
        SpotRepositoryImpl(); // Create an instance of SpotRepositoryImpl

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => RestaurantBloc(repository: spotRepository)),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const YelpHome(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
