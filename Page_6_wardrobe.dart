import 'package:flutter/material.dart';

void main() {
  runApp(const MyWardrobeApp());
}

class MyWardrobeApp extends StatelessWidget {
  const MyWardrobeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const WardrobeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WardrobeScreen extends StatefulWidget {
  const WardrobeScreen({super.key});

  @override
  State<WardrobeScreen> createState() => _WardrobeScreenState();
}

class _WardrobeScreenState extends State<WardrobeScreen> {
  String selectedCategory = 'Tops';
  String selectedColor = 'All';
  List<String> categories = ['Tops', 'Bottoms'];
  List<String> colors = ['All', 'Red', 'Blue', 'Green', 'Black', 'White'];

  // Wardrobe items with category and color (using local assets)
  List<Map<String, dynamic>> wardrobeItems = [
    {
      'id': 1,
      'category': 'Tops',
      'color': 'Red',
      'image': 'assets/images/red_top.png',
      'selected': false,
    },
    {
      'id': 2,
      'category': 'Tops',
      'color': 'Blue',
      'image': 'assets/images/blue_top.jpeg',
      'selected': false,
    },
    {
      'id': 3,
      'category': 'Tops',
      'color': 'Green',
      'image': 'assets/images/green_top.png',
      'selected': false,
    },
    {
      'id': 4,
      'category': 'Bottoms',
      'color': 'Black',
      'image': 'assets/images/black_bottom.png',
      'selected': false,
    },
    {
      'id': 5,
      'category': 'Bottoms',
      'color': 'Blue',
      'image': 'assets/images/blue_bottom.jpeg',
      'selected': false,
    },
    {
      'id': 6,
      'category': 'Tops',
      'color': 'Red',
      'image': 'assets/images/red_top.png',
      'selected': false,
    },
    {
      'id': 7,
      'category': 'Tops',
      'color': 'Blue',
      'image': 'assets/images/blue_top.jpeg',
      'selected': false,
    },
    {
      'id': 8,
      'category': 'Tops',
      'color': 'Green',
      'image': 'assets/images/green_top.png',
      'selected': false,
    },
    {
      'id': 9,
      'category': 'Bottoms',
      'color': 'Black',
      'image': 'assets/images/black_bottom.png',
      'selected': false,
    },
    {
      'id': 10,
      'category': 'Bottoms',
      'color': 'Blue',
      'image': 'assets/images/blue_bottom.jpeg',
      'selected': false,
    },
    {
      'id': 11,
      'category': 'Tops',
      'color': 'Red',
      'image': 'assets/images/red_top.png',
      'selected': false,
    },
    {
      'id': 12,
      'category': 'Tops',
      'color': 'Blue',
      'image': 'assets/images/blue_top.jpeg',
      'selected': false,
    },
    {
      'id': 13,
      'category': 'Tops',
      'color': 'Green',
      'image': 'assets/images/green_top.png',
      'selected': false,
    },
    {
      'id': 14,
      'category': 'Bottoms',
      'color': 'Black',
      'image': 'assets/images/black_bottom.png',
      'selected': false,
    },
    {
      'id': 15,
      'category': 'Bottoms',
      'color': 'Blue',
      'image': 'assets/images/blue_bottom.jpeg',
      'selected': false,
    },
  ];

  // Get filtered items based on category and color
  List<Map<String, dynamic>> get filteredItems {
    return wardrobeItems.where((item) {
      bool matchesCategory = item['category'] == selectedCategory;
      bool matchesColor = selectedColor == 'All' || item['color'] == selectedColor;
      return matchesCategory && matchesColor;
    }).toList();
  }

  void toggleSelection(int itemId) {
    setState(() {
      final index = wardrobeItems.indexWhere((item) => item['id'] == itemId);
      if (index != -1) {
        wardrobeItems[index]['selected'] = !wardrobeItems[index]['selected'];
      }
    });
  }

  void deleteSelected() {
    setState(() {
      wardrobeItems.removeWhere((item) => item['selected'] == true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final filtered = filteredItems;

    return Scaffold(
      backgroundColor: const Color(0xFF0C473E),
      body: SafeArea(
        child: Column(
          children: [
            // Top bar with back arrow and title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Text(
                          "MY WARDROBE",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Filter dropdowns
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Category dropdown
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: DropdownButton<String>(
                        value: selectedCategory,
                        underline: const SizedBox(),
                        isExpanded: true,
                        icon: const Icon(Icons.keyboard_arrow_down, size: 20),
                        items: categories
                            .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value!;
                          });
                        },
                      ),
                    ),
                  ),

                  // Color dropdown
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: DropdownButton<String>(
                        value: selectedColor,
                        underline: const SizedBox(),
                        isExpanded: true,
                        icon: const Icon(Icons.keyboard_arrow_down, size: 20),
                        items: colors
                            .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedColor = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Light green rounded container with items
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF63918B),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(180),
                    topRight: Radius.circular(180),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 70, 40, 20),
                  child: Column(
                    children: [
                      // Scrollable Grid
                      Expanded(
                        child: filtered.isEmpty
                            ? const Center(
                          child: Text(
                            'No items found',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        )
                            : GridView.builder(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          itemCount: filtered.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 18,
                            mainAxisSpacing: 18,
                            childAspectRatio: 0.8,
                          ),
                          itemBuilder: (context, index) {
                            final item = filtered[index];
                            return GestureDetector(
                              onLongPress: () => toggleSelection(item['id']),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: item['selected'] ? Colors.red : Colors.white,
                                    width: 3,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    item['image'],
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey[300],
                                        child: const Icon(
                                          Icons.checkroom,
                                          size: 50,
                                          color: Colors.grey,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Bottom buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Delete button
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: IconButton(
                              onPressed: deleteSelected,
                              icon: const Icon(Icons.remove, size: 28),
                              color: Colors.black,
                              padding: const EdgeInsets.all(16),
                            ),
                          ),

                          // Add button
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: IconButton(
                              onPressed: () {
                                // Add functionality - currently does nothing
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Add button clicked!'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.add, size: 28),
                              color: Colors.black,
                              padding: const EdgeInsets.all(16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}