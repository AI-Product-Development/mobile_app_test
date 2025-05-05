import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/search_provider.dart';
import '../models/video_result.dart';
import 'video_detail_screen.dart'; // Import VideoDetailScreen

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Viral Video Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
            ElevatedButton(
              onPressed: searchProvider.isLoading ? null : () {
                searchProvider.performSearch();
              },
              child: searchProvider.isLoading
                  ? CircularProgressIndicator()
                  : const Text('Search'),
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
    );
  }
}
