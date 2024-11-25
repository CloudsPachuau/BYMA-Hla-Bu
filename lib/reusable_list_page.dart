import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'favorites_manager.dart';
import 'selectable_page.dart';
import 'list_item.dart';

class ReusableListPage extends StatefulWidget {
  final String title;
  final List<ListItem> items;
  final bool showFavorites; // New flag to indicate if it's a favorites list

  const ReusableListPage({
    super.key,
    required this.title,
    required this.items,
    this.showFavorites = false, // Default to showing all items
  });

  @override
  ReusableListPageState createState() => ReusableListPageState();
}

class ReusableListPageState extends State<ReusableListPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _bubbleAnimation;
  late Map<String, List<ListItem>> groupedItems;
  late List<String> sortedAlphabetIndex;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
  ItemPositionsListener.create();
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  String? activeLetter;
  double? bubblePositionY;
  List<ListItem> _filteredItems = [];

  final Map<String, int> customAlphabetOrder = {
    'Aw': 1, // Place longer prefixes first
    'A': 2,
    'B': 3,
    'Ch': 4,
    'C': 5,
    'D': 6,
    'E': 7,
    'F': 8,
    'Ng': 9,
    'H': 10,
    'I': 11,
    'J': 12,
    'K': 13,
    'L': 14,
    'M': 15,
    'N': 16,
    'O': 17,
    'P': 18,
    'R': 19,
    'S': 20,
    'T': 21,
    'Ṭ': 22,
    'U': 23,
    'V': 24,
    'Z': 25,
  };

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _bubbleAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(-0.4, 0), // Offset to "pop out"
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    if (widget.showFavorites) {
      final favoriteTitles =
      FavoritesManager.instance.favorites.map((e) => e['pageTitle']);
      widget.items.removeWhere((item) => !favoriteTitles.contains(item.title));
    }
    _filteredItems = List.from(widget.items);
    _groupItemsAlphabetically(_filteredItems);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _groupItemsAlphabetically(List<ListItem> items) {
    groupedItems = {};

    for (var item in items) {
      // Trim and normalize the title
      String title = item.title.trim();

      // Find the matching prefix
      String? firstLetter = customAlphabetOrder.keys.firstWhere(
            (prefix) {
          final matches = title.startsWith(prefix);
          if (matches) {
            debugPrint('Matched Prefix: $prefix for Title: $title');
          }
          return matches;
        },
        orElse: () {
          debugPrint(
              'No Match for Title: $title, Falling Back to: ${title.substring(0, 1)}');
          return title.substring(0, 1);
        },
      );

      if (customAlphabetOrder.containsKey(firstLetter)) {
        groupedItems.putIfAbsent(firstLetter, () => []).add(item);
      }
    }

    sortedAlphabetIndex = groupedItems.keys.toList()
      ..sort((a, b) {
        // Sort using customAlphabetOrder, but prioritize display order
        if (a == 'A' && b == 'Aw') return -1; // A comes before Aw
        if (a == 'Aw' && b == 'A') return 1; // Aw comes after A
        return customAlphabetOrder[a]!.compareTo(customAlphabetOrder[b]!);
      });
  }

  void _handleDrag(double localY, double letterHeight) {
    final index = (localY / letterHeight)
        .clamp(0, sortedAlphabetIndex.length - 1)
        .toInt();

    setState(() {
      activeLetter = sortedAlphabetIndex[index];
      bubblePositionY = localY - letterHeight - 1 / 4; // Center the bubble
    });

    _scrollToLetter(sortedAlphabetIndex[index]);
    _animationController.forward();
  }

  void _scrollToLetter(String letter) {
    final index = sortedAlphabetIndex.indexOf(letter);
    if (index != -1) {
      itemScrollController.scrollTo(
        index: index,
        duration: const Duration(milliseconds: 1000), // Smooth scroll duration
        curve: Curves.easeInOut, // Smooth scroll curve
      );
    }
  }

  void _onSearchChanged(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredItems = List.from(widget.items);
      } else {
        _filteredItems = widget.items.where((item) {
          return item.title.toLowerCase().contains(query.toLowerCase()) ||
              item.number.toString().contains(query);
        }).toList();
      }
      _groupItemsAlphabetically(_filteredItems);
    });
  }

  void _openSelectablePage(
      BuildContext context, int initialPage, List<ListItem> items) {
    final item = items[initialPage];
    final themeMode = Theme.of(context).brightness == Brightness.dark
        ? ThemeMode.dark
        : ThemeMode.light;

    Navigator.of(context).push(
      SelectablePage.createRoute(
        pages: [
          {
            'pageTitle': item.title,
            'filePath': item.imagePath,
            'musicIcon': Icons.music_note,
            'soundPath': item.soundPath,
            'note': item.note ?? '', // Provide a default value for null notes
          },
        ],
        initialPage: 0,
        themeMode: themeMode,
        backgroundColor: Colors.black.withOpacity(0.9),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1.0),
          child: Container(
            height: 40.0,
            decoration: BoxDecoration(
              color: isDarkMode
                  ? Colors.grey.withOpacity(0.6)
                  : Colors.white.withOpacity(0.6),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: TextField(
              controller: searchController,
              focusNode: searchFocusNode,
              decoration: const InputDecoration(
                hintText: "Zawn Awlna...",
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.search, color: Colors.white),
                border: InputBorder.none,
                contentPadding:
                EdgeInsets.symmetric(vertical: 6.0, horizontal: 5.0),
              ),
              style: const TextStyle(color: Colors.white),
              onChanged: _onSearchChanged,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: AnimationLimiter(
              child: ScrollablePositionedList.builder(
                itemCount: sortedAlphabetIndex.length + 1,
                itemScrollController: itemScrollController,
                itemPositionsListener: itemPositionsListener,
                itemBuilder: (context, index) {
                  if (index == sortedAlphabetIndex.length) {
                    return const SizedBox(height: 95);
                  }
                  final letter = sortedAlphabetIndex[index];
                  final items = groupedItems[letter] ?? [];

                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: StickyHeader(
                          header: Container(
                            height: 24.0,
                            color: isDarkMode
                                ? Colors.grey.shade700
                                : Colors.grey.shade400,
                            padding:
                            const EdgeInsets.symmetric(horizontal: 5.0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              letter,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                          content: Column(
                            children: items.map((item) {
                              return Card(
                                color: isDarkMode
                                    ? Colors.brown.shade400
                                    : Colors.white,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 2.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                elevation: 5.0,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: isDarkMode
                                        ? Colors.brown.shade800
                                        : Colors.cyan.shade900,
                                    child: Text(
                                      item.number.toString(),
                                      style:
                                      const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  title: Text(
                                    item.title,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),

                                  onTap: () => _openSelectablePage(
                                    context,
                                    widget.items.indexOf(
                                        item), // Get the correct index of the tapped item
                                    widget.items, // Pass the full list of items
                                  ), // Correct number of arguments
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          if (activeLetter != null &&
              !searchFocusNode.hasFocus) // Hide scrollbar if search is active
            Center(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  activeLetter!,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
          if (!searchFocusNode.hasFocus && activeLetter != null)
            Positioned(
              top: bubblePositionY,
              right: 50,
              child: SlideTransition(
                position: _bubbleAnimation,
                child: Material(
                  elevation: 4,
                  color: Colors.grey.withOpacity(0.7),
                  shape: const CircleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      activeLetter!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ), // Hide scrollbar if search is active
          Positioned(
            right: 6,
            top: 6,
            bottom: 82,
            child: Container(
              width: 35.0,
              decoration: BoxDecoration(
                color: isDarkMode
                    ? Colors.white.withOpacity(0.1)
                    : Colors.black.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                removeBottom: true,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final letterHeight =
                        constraints.maxHeight / sortedAlphabetIndex.length;

                    return GestureDetector(
                      onVerticalDragStart: (details) {
                        _handleDrag(details.localPosition.dy, letterHeight);
                      },
                      onVerticalDragUpdate: (details) {
                        _handleDrag(details.localPosition.dy, letterHeight);
                      },
                      onVerticalDragEnd: (_) {
                        // Reset the active letter when touch is released
                        setState(() {
                          activeLetter = null;
                        });
                      },
                      child: Column(
                        children: [
                          const SizedBox(height: 13.0), // Space above "A"
                          ...sortedAlphabetIndex.map((letter) {
                            final isActive = letter == activeLetter;

                            return Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _scrollToLetter(letter);

                                  setState(() {
                                    activeLetter = letter;
                                    bubblePositionY =
                                        (sortedAlphabetIndex.indexOf(letter) *
                                            letterHeight) -
                                            (letterHeight /
                                                4); // Position bubble for tap
                                  });

                                  // Restart animation
                                  _animationController.forward(from: 0);

                                  Future.delayed(
                                      const Duration(milliseconds: 500), () {
                                    if (mounted) {
                                      _animationController.reverse();
                                      setState(() {
                                        activeLetter = null;
                                      });
                                    }
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height:
                                  20.0, // Maintain reasonable size for each letter
                                  width: 30.0, // Optional: Make it a square
                                  decoration: BoxDecoration(
                                    color: isActive
                                        ? (isDarkMode
                                        ? Colors.white60.withOpacity(0.4)
                                        : Colors.black38.withOpacity(0.4))
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(
                                        25.0), // Add radius for rounded edges
                                  ),
                                  child: Text(
                                    letter,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: isActive
                                          ? (isDarkMode
                                          ? Colors.brown
                                          : Colors.cyan)
                                          : (isDarkMode
                                          ? Colors.white
                                          : Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                          const SizedBox(height: 15.0), // Space below "Z"
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}