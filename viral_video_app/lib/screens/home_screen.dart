import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/search_provider.dart';
import '../models/video_result.dart';
import 'video_detail_screen.dart'; // Import VideoDetailScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xFFFFC43D), // Mustard yellow
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Viral\nVideo\nSearch',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Text(
                  'Enter the keywords below. The app will return a list of viral videos in this field',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF333333),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: searchProvider.isLoading ? null : () {
                    searchProvider.performSearch();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF75C9B), // Pink
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  ),
                  child: searchProvider.isLoading
                      ? CircularProgressIndicator()
                      : Text(
                          'Search',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter keywords',
                    suffixIcon: Icon(Icons.search),
                  ),
                  onChanged: (text) {
                    searchProvider.setSearchText(text);
                  },
                ),
                SizedBox(height: 16.0),
                Expanded(
                  child: searchProvider.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : searchProvider.errorMessage != null
                          ? Center(child: Text(searchProvider.errorMessage!))
                          : searchProvider.results.isEmpty
                              ? Center(child: Text('Enter keywords and search to see results.'))
                              : ListView.builder(
                                  itemCount: searchProvider.results.length,
                                  itemBuilder: (context, index) {
                                    final video = searchProvider.results[index];
                                    return ListTile(
                                      title: Text(video.title),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => VideoDetailScreen(video: video),
                                          ),
                                        );
                                      },
                                      // TODO: Add thumbnail
                                    );
                                  },
                                ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF0C1E3C),
        selectedItemColor: Color(0xFF22D3EE),
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onNavTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}
