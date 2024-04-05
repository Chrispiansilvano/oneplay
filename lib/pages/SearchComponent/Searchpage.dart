import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 20, 62, 87),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            )),
      ),
      body: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50, // Adjust height as needed
          decoration: BoxDecoration(
            color: Colors.blueGrey[800], // Dark blue background
            borderRadius: BorderRadius.circular(0.0), // Rounded corners
          ),
          child: Row(
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search movies, tv shows, series, ...',
                      hintStyle: TextStyle(
                          color: Colors.white70), // Light gray hint text
                      border: InputBorder.none, // Remove borders
                    ),
                    style: TextStyle(color: Colors.white), // White text
                    // onChanged: onSearch, // Update on user input
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.search,
                    color: Colors.white), // Search icon
                onPressed: () {}, // Handle search button press (optional)
              ),
            ],
          ),
        )
      ]),
    );
  }
}
