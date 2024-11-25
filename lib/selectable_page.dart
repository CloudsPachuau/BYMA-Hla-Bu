import 'dart:math';
import 'dart:ui' as ui;
import 'dart:ui';
import 'favorites_manager.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async'; // For FutureBuilder

class SelectablePage extends StatefulWidget {
  final List<Map<String, dynamic>> pages;
  final int initialPage;
  final ThemeMode themeMode;
  final Color? backgroundColor;

  const SelectablePage({
    super.key,
    required this.pages,
    required this.initialPage,
    required this.themeMode,
    this.backgroundColor,
  });

  static Route createRoute({
    required List<Map<String, dynamic>> pages,
    required int initialPage,
    required ThemeMode themeMode,
    Color? backgroundColor,
  }) {
    final random = Random();
    final directions = [
      const Offset(1.0, 0.0),
      const Offset(-1.0, 0.0),
      const Offset(0.0, 1.0),
      const Offset(0.0, -1.0),
    ];
    final direction = directions[random.nextInt(directions.length)];

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SelectablePage(
        pages: pages,
        initialPage: initialPage,
        themeMode: themeMode,
        backgroundColor: backgroundColor,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final slideAnimation = Tween<Offset>(begin: direction, end: Offset.zero)
            .animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));
        return SlideTransition(position: slideAnimation, child: child);
      },
    );
  }

  @override
  SelectablePageState createState() => SelectablePageState();
}

class SelectablePageState extends State<SelectablePage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  late TransformationController _transformationController;
  late int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage;
    _transformationController = TransformationController();
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  void _playSound(String soundPath) async {
    try {
      await _audioPlayer.play(AssetSource(soundPath));
    } catch (e) {
      debugPrint("Error playing sound: $e");
    }
  }

  void _resetZoom() {
    setState(() {
      _transformationController.value = Matrix4.identity();
    });
  }

  Widget _buildPage(Map<String, dynamic> page) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;

        return FutureBuilder<ui.Image>(
          future: _getImage(page['filePath']),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final image = snapshot.data!;
            final imageWidth = image.width.toDouble();
            final imageHeight = image.height.toDouble();
            final aspectRatio = imageWidth / imageHeight;

            final scaledHeight = screenWidth / aspectRatio;

            return GestureDetector(
              onDoubleTap: () {
                final currentScale =
                    _transformationController.value.getMaxScaleOnAxis();
                final newScale = currentScale > 1.0 ? 1.0 : 2.0;

                setState(() {
                  _transformationController.value = Matrix4.identity()
                    ..scale(newScale);
                });
              },
              child: InteractiveViewer(
                transformationController: _transformationController,
                panEnabled: true,
                scaleEnabled: true,
                boundaryMargin:
                    const EdgeInsets.all(double.infinity), // Allow free panning
                minScale: 1.0,
                maxScale: 5.0,
                child: Center(
                  child: SizedBox(
                    width: screenWidth,
                    height:
                        scaledHeight, // Scale height dynamically to fit aspect ratio
                    child: FittedBox(
                      fit: BoxFit
                          .fitWidth, // Ensures the image width matches the screen width
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        page['filePath'],
                        fit: BoxFit.contain, // Maintain aspect ratio
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<ui.Image> _getImage(String assetPath) async {
    final Completer<ui.Image> completer = Completer();
    final imageStream =
        AssetImage(assetPath).resolve(const ImageConfiguration());
    imageStream.addListener(
      ImageStreamListener((ImageInfo info, _) {
        completer.complete(info.image);
      }),
    );
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    FavoritesManager.instance.favorites.any(
      (favorite) =>
          favorite['pageTitle'] == widget.pages[_currentPage]['pageTitle'],
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.themeMode == ThemeMode.dark
            ? Colors.brown.shade900
            : Colors.cyan.shade800,
        leading: const BackButton(color: Colors.white),
        title: Text(
          widget.pages[_currentPage]['title'] ?? '',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              FavoritesManager.instance
                      .isFavorite(widget.pages[_currentPage]['pageTitle'])
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: FavoritesManager.instance
                      .isFavorite(widget.pages[_currentPage]['pageTitle'])
                  ? Colors.amber
                  : Colors.white,
            ),
            onPressed: () async {
              final favorite = widget.pages[_currentPage];
              final pageTitle = favorite['pageTitle'];

              if (FavoritesManager.instance.isFavorite(pageTitle)) {
                await FavoritesManager.instance.removeFavorite(pageTitle);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Removed from favorites')),
                );
              } else {
                await FavoritesManager.instance.addFavorite(
                  pageTitle,
                  favorite['filePath'],
                  favorite['soundPath'],
                  favorite['note'] ?? '',
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Added to favorites')),
                );
              }

              setState(() {}); // Refresh the UI
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _resetZoom,
          ),
        ],
      ),
      body: Stack(
        children: [
          GestureDetector(

            child: _buildPage(widget.pages[_currentPage]),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60, right: 10),
              child: GestureDetector(
                onTap: () =>
                    _playSound(widget.pages[_currentPage]['soundPath']),
                child: Container(
                  width: 65,
                  height: 35,
                  decoration: BoxDecoration(
                    color: widget.themeMode == ThemeMode.dark
                        ? Colors.brown.shade800
                        : Colors.cyan.shade800,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      widget.pages[_currentPage]['note'] ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 47,
              width: double.infinity,
              color: Colors.grey.shade300,
              child: const Center(
                child: Text(
                  'Sponsored Ad',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
