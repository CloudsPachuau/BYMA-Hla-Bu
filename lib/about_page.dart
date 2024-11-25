import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart'; // For opening links

class AboutPageContent extends StatefulWidget {
  const AboutPageContent({super.key});

  @override
  AboutPageContentState createState() => AboutPageContentState();
}

class AboutPageContentState extends State<AboutPageContent>
    with TickerProviderStateMixin {
  late final AnimationController _controller1;
  late final AnimationController _controller2;
  late final AnimationController _controller3;
  late final AnimationController _controller4;
  late final AnimationController _controller5;
  late final AnimationController _controller6;

  late final Animation<Offset> _slideAnimation1;
  late final Animation<Offset> _slideAnimation2;
  late final Animation<Offset> _slideAnimation3;
  late final Animation<Offset> _slideAnimation4;
  late final Animation<Offset> _slideAnimation5;
  late final Animation<Offset> _slideAnimation6;

  @override
  void initState() {
    super.initState();

    // Initialize controllers with staggered durations for smoother animations
    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _controller3 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _controller4 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _controller5 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _controller6 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    // Define animations with new entry points and smoother curves
    _slideAnimation1 = Tween<Offset>(
      begin: const Offset(-1, 0), // Fly in from the left
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller1, curve: Curves.easeOut));

    _slideAnimation2 = Tween<Offset>(
      begin: const Offset(1, 0), // Fly in from the right
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller2, curve: Curves.easeOut));

    _slideAnimation3 = Tween<Offset>(
      begin: const Offset(0, -1), // Fly in from the top
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller3, curve: Curves.easeOut));

    _slideAnimation4 = Tween<Offset>(
      begin: const Offset(0, 1), // Fly in from the bottom
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller4, curve: Curves.easeOut));

    _slideAnimation5 = Tween<Offset>(
      begin: const Offset(-1.5, 0), // Fly in from farther left
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller5, curve: Curves.easeOut));

    _slideAnimation6 = Tween<Offset>(
      begin: const Offset(1, 0), // Fly in from the right for features points
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller6, curve: Curves.easeOut));

    // Start animations in sequence
    _startAnimations();
  }

  void _startAnimations() async {
    await _controller1.forward();
    await _controller2.forward();
    await _controller3.forward();
    await _controller6.forward();
    await _controller4.forward();
    await _controller5.forward();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _controller6.dispose();
    super.dispose();
  }

  Future<void> _openLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: const Text(
          'BYMA Hlabu App Chungchang',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: const BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
        // Wrap content in SingleChildScrollView
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 0),
            SlideTransition(
              position: _slideAnimation3,
              child: const Text(
                'Version',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(height: 0),
            SlideTransition(
              position: _slideAnimation3,
              child: const Text(
                '  v_1.0.0',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 18),
            SlideTransition(
              position: _slideAnimation3,
              child: const Text(
                'Developed and Designed by',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(height: 0),
            SlideTransition(
              position: _slideAnimation3,
              child: const Text(
                '  - Lalhmingliana Pachuau',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'serif',
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 22),
            SlideTransition(
              position: _slideAnimation2,
              child: const Text(
                'BYMA Hla Bu:',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'comic',
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
            SlideTransition(
              position: _slideAnimation2,
              child: const Text(
                '   Bethlehem Branch YMA Diamond Jubilee pualin mithi tlaivarpui zan leh khawhar in lamah sak theih tur Solfa leh Lengkhawm hla te, hruaituten a ṭul leh ṭha an tih ang ang te fimkhur taka thlang chhuakin hlabu dang ken ngai loa hman mai theih tur a buaisaih a.',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'serif',
                    fontWeight: FontWeight.normal),
              ),
            ),
            SlideTransition(
              position: _slideAnimation1,
              child: const Text(
                '   Chu hlabu chu a remchan zawk theih na tur leh awlsam zawk theih nan a hlabu ken theihnghilh leh ken ngai kher lo pawh a, phone hmanga en mai theih turin he hlabu app BYMA tih hi siam a lo ni ta a ni.',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'serif',
                    fontWeight: FontWeight.normal),
              ),
            ),
            SlideTransition(
              position: _slideAnimation2,
              child: const Text(
                '   He hla bu hi tualchhunga hman mai tur leh, zai hruaitute daih lek chhut chhuah tura ruahman a nih avangin, a hla phuahtute pawh a hranpaa ràwn an ni lo a. Pathian ropuina tur leh sak ho atana phuah an nih avangin min hriat thiam ngei kan beisei tlat a ni.',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'serif',
                    fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(height: 20),
            SlideTransition(
              position: _slideAnimation3,
              child: const Text(
                'Features:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            SlideTransition(
              position: _slideAnimation6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedBuilder(
                    animation: _controller6,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _controller6.value >= 0.1 ? 1.0 : 0.0,
                        child: Transform.translate(
                          offset: Offset(200 * (1.0 - _controller6.value), 0),
                          child: const Text('✓ App Drawer - Hla thupui thenna leh a dangte.',
                              style: TextStyle(fontSize: 16)),
                        ),
                      );
                    },
                  ),
                  AnimatedBuilder(
                    animation: _controller6,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _controller6.value >= 0.1 ? 1.0 : 0.0,
                        child: Transform.translate(
                          offset: Offset(400 * (1.0 - _controller6.value), 0),
                          child: const Text('✓ Hla thupui then.',
                              style: TextStyle(fontSize: 16)),
                        ),
                      );
                    },
                  ),
                  AnimatedBuilder(
                    animation: _controller6,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _controller6.value >= 0.1 ? 1.0 : 0.0,
                        child: Transform.translate(
                          offset: Offset(600 * (1.0 - _controller6.value), 0),
                          child: const Text('✓ Animated navigation mawi tak.',
                              style: TextStyle(fontSize: 16)),
                        ),
                      );
                    },
                  ),
                  AnimatedBuilder(
                    animation: _controller6,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _controller6.value >= 0.1 ? 1.0 : 0.0,
                        child: Transform.translate(
                          offset: Offset(800 * (1.0 - _controller6.value), 0),
                          child: const Text('✓ Hla nambar emaw hla thupui hmanga zawnna.',
                              style: TextStyle(fontSize: 16)),
                        ),
                      );
                    },
                  ),
                  AnimatedBuilder(
                    animation: _controller6,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _controller6.value >= 0.1 ? 1.0 : 0.0,
                        child: Transform.translate(
                          offset: Offset(1000 * (1.0 - _controller6.value), 0),
                          child: const Text('✓ Thim leh enga(light/dark mode) thlakna.',
                              style: TextStyle(fontSize: 16)),
                        ),
                      );
                    },
                  ),
                  AnimatedBuilder(
                    animation: _controller6,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _controller6.value >= 0.1 ? 1.0 : 0.0,
                        child: Transform.translate(
                          offset: Offset(1200 * (1.0 - _controller6.value), 0),
                          child: const Text('✓ Hla thluk lakna (music note key).',
                              style: TextStyle(fontSize: 16)),
                        ),
                      );
                    },
                  ),
                  AnimatedBuilder(
                    animation: _controller6,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _controller6.value >= 0.1 ? 1.0 : 0.0,
                        child: Transform.translate(
                          offset: Offset(1400 * (1.0 - _controller6.value), 0),
                          child: const Text('✓ Hla duh bik dah thatna (Bookmark/Favourites).',
                              style: TextStyle(fontSize: 16)),
                        ),
                      );
                    },
                  ),
                  AnimatedBuilder(
                    animation: _controller6,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _controller6.value >= 0.1 ? 1.0 : 0.0,
                        child: Transform.translate(
                          offset: Offset(1600 * (1.0 - _controller6.value), 0),
                          child: const Text('✓ Hla phek thawn na leh app thawn chhawn (Share) na.',
                              style: TextStyle(fontSize: 16)),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SlideTransition(
              position: _slideAnimation4,
              child: const Text(
                'Terms and Usage:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            SlideTransition(
              position: _slideAnimation5,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '1. He app hi a duh leh mamawh apiang tana hman theih tura siam a ni.',
                      style: TextStyle(fontSize: 16)),
                  Text(
                      '2. He app design UI/UX, logo leh app hming te hi Bethlehem Branch YMA Diamond Jubilee puala uluk taka siam a ni.',
                      style: TextStyle(fontSize: 16)),
                  Text(
                      '   © Copyright by Lalhmingliana Pachuau & Bethlehem Veng Branch YMA, 2024.',
                      style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SlideTransition(
              position: _slideAnimation3,
              child: const Text(
                'Connect with Me:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 0),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.instagram, color: Colors.deepOrangeAccent,),
              title: const Text('Follow me on Instagram'),
              onTap: () =>
                  _openLink('https://www.instagram.com/hmingteapachuau/'),
            ),
            const SizedBox(height: 0), // Add spacing between links
            ListTile(
              leading: const Icon(Icons.facebook, color: Colors.blue),
              title: const Text('Follow me on Facebook'),
              onTap: () => _openLink('https://www.facebook.com/Kazumapachuau/'),
            ),
            const SizedBox(height: 0), // Add spacing between links
            ListTile(
              leading: const Icon(Icons.email, color: Colors.redAccent),
              title: const Text('Contact me via Email'),
              onTap: () => _openLink('mailto:hmingzz17@gmail.com'),
            ),
            const SizedBox(height: 0), // Add spacing between links
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.green),
              title: const Text(
                '+91 9606738775',
                style: TextStyle(
                  fontWeight: FontWeight.bold, // Make the phone number bold
                  fontSize: 16, // Increase font size if needed
                ),
              ),
              onTap: () => _openLink('tel:+919606738775'), // Dial the number
            ),
          ],
        ),
      ),
    );
  }
}
