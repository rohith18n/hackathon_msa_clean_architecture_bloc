import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon_msa_clean_architecture_bloc/features/restaurant/presentation/bloc/restaurant_bloc.dart';
import 'package:hackathon_msa_clean_architecture_bloc/features/restaurant/presentation/widgets/featured_product_card.dart';
import 'package:hackathon_msa_clean_architecture_bloc/core/utils/typo.dart';
import 'package:hackathon_msa_clean_architecture_bloc/features/restaurant/presentation/widgets/sponsored_product_card.dart';

class YelpHome extends StatefulWidget {
  const YelpHome({super.key});

  @override
  YelpHomeState createState() => YelpHomeState();
}

class YelpHomeState extends State<YelpHome> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  bool _showFirstTextField = true;

  final List<String> _cities = [
    'San Francisco, CA, United States',
    'San Diego, CA, United States',
    'Indio, CA, United States',
    'Menifee, CA, United States',
    'Canada, KY, United States',
    'Kent, WA, United States',
    'Campbell, CA, United States',
    'Cambridge, MA, United States',
  ]; // Example cities

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'yelp',
                  style: header,
                ),
                Text(
                  'MSA',
                  style: subline,
                ),
              ],
            ),
            const Spacer(),
            Image.asset('assets/user_photo.png', height: 42),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    if (_showFirstTextField)
                      TextField(
                        controller: _locationController,
                        readOnly: true,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'San Francisco, CA', // Hint text
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(20.0), // Rounded border
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _showFirstTextField = false;
                          });
                        },
                      ),
                    if (!_showFirstTextField) ...[
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              decoration: InputDecoration(
                                prefixIcon: IconButton(
                                  icon: const Icon(Icons.arrow_back),
                                  onPressed: () {
                                    setState(() {
                                      _showFirstTextField = true;
                                    });
                                  },
                                ),
                                hintText: 'e.g. tacos,Mels',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _locationController,
                        readOnly: true, // Make typing not allowed
                        onTap: () {
                          _showCityList(context);
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.location_on_outlined),
                          hintText: 'Select City',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          //-----logging  textEditingControllers ----
                          log(_searchController.text);
                          log(_locationController.text);
                          if (_searchController.text.isNotEmpty &&
                              _locationController.text.isNotEmpty) {
                            context.read<RestaurantBloc>().add(
                                  CreateRestaurantEvent(
                                    location: _locationController.text,
                                    search: _searchController.text,
                                  ),
                                );
                          }
                        },
                        child: const Text(
                          'Search',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Featured Takeout Options',
                      style: subheader,
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
              BlocBuilder<RestaurantBloc, RestaurantState>(
                builder: (context, state) {
                  if (state is RestaurantLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is RestaurantLoaded) {
                    return SizedBox(
                      height: 310,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.restaurant.length,
                        itemBuilder: (context, index) {
                          final restaurant = state.restaurant[index];
                          return FeaturedProductCard(
                            imagePath: restaurant.imageUrl,
                            productName: restaurant.name,
                            rating: restaurant.rating,
                          );
                        },
                      ),
                    );
                  } else if (state is RestaurantError) {
                    return Text('Error: ${state.message}');
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sponsored Results',
                      style: subheader,
                    ),
                    const SizedBox(height: 12),
                    BlocBuilder<RestaurantBloc, RestaurantState>(
                      builder: (context, state) {
                        if (state is RestaurantLoaded) {
                          return SizedBox(
                            height: 310,
                            child: ListView.builder(
                              itemCount: state.restaurant.length >= 5
                                  ? 5
                                  : state.restaurant.length,
                              itemBuilder: (context, index) {
                                final restaurant =
                                    state.restaurant.reversed.toList()[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: CustomProductCard(
                                    imagePath: restaurant.imageUrl,
                                    productName: restaurant.name,
                                    productPrice:
                                        '\$${restaurant.price}', // Assuming price is provided in the data
                                    ratingStars: [
                                      for (int i = 0;
                                          i < restaurant.rating;
                                          i++)
                                        Image.asset('assets/star.png',
                                            height: 18),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showCityList(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('   Select City'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: _cities.map((city) {
            return ListTile(
              title: Text(city),
              onTap: () {
                setState(() {
                  _locationController.text = city;
                });
                Navigator.of(context).pop();
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
