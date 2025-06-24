import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:aql_app/constants/apis.dart';
import 'package:aql_app/models/steamlist_model.dart';

class StreamsProvider with ChangeNotifier {
  StreamList? _streamResponse;
  bool _isStreamLoading = false;
  String? _error;

  StreamList? get streamResponse => _streamResponse;
  bool get isStreamLoading => _isStreamLoading;
  String? get error => _error;

  Future<void> fetchStreamData(BuildContext context) async {
    _streamResponse = null;
    _error = null;
    _isStreamLoading = true;
    notifyListeners();

    debugPrint("----------fetchStreamData called-------");

    try {
      final uri = Uri.parse(Apis.getStreamtData());

      debugPrint("Requesting URI: $uri");
      final response = await http.get(uri);

      debugPrint("Response Status Code: ${response.statusCode}");
      debugPrint("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        _streamResponse = streamListFromJson(response.body);
        debugPrint(
          "Stream data successfully parsed. Total: ${_streamResponse?.response.length}",
        );
      } else {
        _error = 'Server returned error code ${response.statusCode}';
        debugPrint('Stream fetch failed: $_error');
        _showErrorSnackbar(context, 'Failed to fetch stream data.');
      }
    } on SocketException {
      _error = 'No internet connection';
      debugPrint(_error!);
      _showErrorSnackbar(context, _error!);
    } catch (e) {
      _error = 'Unexpected error: $e';
      debugPrint(_error!);
      _showErrorSnackbar(context, 'Something went wrong.');
    } finally {
      _isStreamLoading = false;
      notifyListeners();
    }
  }

  void _showErrorSnackbar(BuildContext context, String message) {
    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    }
  }
}
