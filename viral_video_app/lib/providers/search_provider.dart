import 'package:flutter/material.dart';
import '../models/video_result.dart';

class SearchProvider with ChangeNotifier {
  String _searchText = '';
  bool _isLoading = false;
  List<VideoResult> _results = [];
  String? _errorMessage;

  String get searchText => _searchText;
  bool get isLoading => _isLoading;
  List<VideoResult> get results => _results;
  String? get errorMessage => _errorMessage;

  void setSearchText(String text) {
    _searchText = text;
    notifyListeners();
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setResults(List<VideoResult> results) {
    _results = results;
    notifyListeners();
  }

  void _setErrorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  // Hardcoded dummy data
  final List<VideoResult> _dummyData = [
    VideoResult(
      title: 'Viral Video 1: Amazing Cats',
      thumbnailUrl: 'https://example.com/thumbs/cat1.jpg',
      transcript: 'This video is about amazing cats doing funny things.',
    ),
    VideoResult(
      title: 'Viral Video 2: Top 10 Tech Gadgets',
      thumbnailUrl: 'https://example.com/thumbs/tech1.jpg',
      transcript: 'Review of the top 10 tech gadgets of the year.',
    ),
    VideoResult(
      title: 'Funny Dogs Compilation',
      thumbnailUrl: 'https://example.com/thumbs/dog1.jpg',
      transcript: 'A compilation of funny dog videos.',
    ),
    VideoResult(
      title: 'How to Learn Flutter in 2024',
      thumbnailUrl: 'https://example.com/thumbs/flutter1.jpg',
      transcript: 'A tutorial on getting started with Flutter development.',
    ),
  ];

  Future<void> performSearch() async {
    _setLoading(true);
    _setErrorMessage(null);
    _setResults([]);

    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 1));

    if (_searchText.isEmpty) {
      _setErrorMessage('Please enter keywords to search.');
      _setLoading(false);
      return;
    }

    final filteredResults = _dummyData.where((video) {
      final lowerCaseQuery = _searchText.toLowerCase();
      return video.title.toLowerCase().contains(lowerCaseQuery) ||
             (video.transcript?.toLowerCase().contains(lowerCaseQuery) ?? false);
    }).toList();

    if (filteredResults.isEmpty) {
      _setErrorMessage('No results found for "${_searchText}".');
    } else {
      _setResults(filteredResults);
    }

    _setLoading(false);
  }
}
