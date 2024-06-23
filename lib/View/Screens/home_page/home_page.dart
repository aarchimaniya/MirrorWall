import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Web_view_page/web_view_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> _bookmarks = [];

  @override
  void initState() {
    super.initState();
    _loadBookmarks();
  }

  void _navigateToWebView(String url, String title) async {
    await _saveBookmark(url, title);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewPage(url: url, title: title),
      ),
    );
  }

  Future<void> _loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? bookmarkList = prefs.getStringList('bookmarks');
    if (bookmarkList != null) {
      setState(() {
        _bookmarks = bookmarkList.map((item) {
          final split = item.split('||');
          return {'title': split[0], 'url': split[1]};
        }).toList();
      });
    }
  }

  Future<void> _saveBookmark(String url, String title) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> bookmarkList = _bookmarks
        .map((bookmark) => '${bookmark['title']}||${bookmark['url']}')
        .toList();
    bookmarkList.add('$title||$url');
    await prefs.setStringList('bookmarks', bookmarkList);
    setState(() {
      _bookmarks.add({'title': title, 'url': url});
    });
  }

  void _openBookmarks() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.black12,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Bookmarks',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _bookmarks.length,
                  itemBuilder: (context, index) {
                    final bookmark = _bookmarks[index];
                    return ListTile(
                      leading: const Icon(Icons.bookmark, color: Colors.black),
                      title: Text(bookmark['title'] ?? ''),
                      subtitle: Text(bookmark['url'] ?? ''),
                      onTap: () {
                        Navigator.pop(context);
                        _navigateToWebView(
                            bookmark['url']!, bookmark['title']!);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/images/category/backmulti.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.bookmark,
                        color: Colors.white,
                      ),
                      onPressed: _openBookmarks,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => _navigateToWebView(
                          'https://www.netflix.com/in/', 'Netflix'),
                      child: Container(
                        height: 115,
                        width: 150,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(5, 5),
                            ),
                          ],
                          image: const DecorationImage(
                            image: AssetImage(
                                "lib/assets/images/category/netflix.png"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => _navigateToWebView(
                          'https://www.primevideo.com/region/eu/?ref_=atv_auth_pre',
                          'Prime Video'),
                      child: Container(
                        height: 115,
                        width: 150,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(5, 5),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black,
                          image: const DecorationImage(
                            image: AssetImage(
                                "lib/assets/images/category/primevideo.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => _navigateToWebView(
                          'https://www.hotstar.com/', 'Disney+ Hotstar'),
                      child: Container(
                        height: 115,
                        width: 150,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(5, 5),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueAccent,
                          image: const DecorationImage(
                            image: AssetImage(
                                "lib/assets/images/category/disneyhotstar.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => _navigateToWebView(
                          'https://www.mxplayer.in/', 'MX Player'),
                      child: Container(
                        height: 110,
                        width: 160,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(5, 5),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                          // color: Colors.blueAccent,
                          image: const DecorationImage(
                            image: AssetImage(
                                "lib/assets/images/category/mxplayer.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => _navigateToWebView(
                          'https://www.amazon.in/minitv?mtv_pt=external&refMarker=AVOD_gs_mw_BRND_EDU_GS_TXT_Desk_skey28',
                          'Amazon Mini TV'),
                      child: Container(
                        height: 115,
                        width: 150,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(5, 5),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.pink,
                          image: const DecorationImage(
                            image: AssetImage(
                                "lib/assets/images/category/minitv.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
