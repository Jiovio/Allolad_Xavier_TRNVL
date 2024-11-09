import 'dart:async';
import 'package:allolab/API/Local.dart';
import 'package:allolab/Controller/User/UserController.dart';
import 'package:allolab/db/dbHelper.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  // Stream controllers for different user types
  late final StreamController<List<Map<String, dynamic>>> _patientChatController;
  late final StreamController<List<Map<String, dynamic>>> _doctorChatController;
  late final StreamController<List<Map<String, dynamic>>> _healthWorkerChatController;

  // Streams for different user types
  final patientChatList = getChatListStream("patient");
  final doctorChatList = getChatListStream("doctor");
  final healthWorkerChatList = getChatListStream("healthWorker");

  // Expose streams for UI consumption
  Stream<List<Map<String, dynamic>>> get patientChatListStream => 
      _patientChatController.stream;
  Stream<List<Map<String, dynamic>>> get doctorChatListStream => 
      _doctorChatController.stream;
  Stream<List<Map<String, dynamic>>> get healthWorkerChatListStream => 
      _healthWorkerChatController.stream;

  ChatController() {
    // Initialize stream controllers
    _patientChatController = StreamController<List<Map<String, dynamic>>>.broadcast();
    _doctorChatController = StreamController<List<Map<String, dynamic>>>.broadcast();
    _healthWorkerChatController = StreamController<List<Map<String, dynamic>>>.broadcast();
    
    // Start listening to all streams
    _startListeningToAllChatLists();
  }

  void _startListeningToAllChatLists() {
    // Listen to patient chat stream
    getChatListStream("patient").listen(
      (data) {
        _patientChatController.add(data);
      },
      onError: (error) {
        _patientChatController.addError(error);
      },
    );

    // Listen to doctor chat stream
    getChatListStream("doctor").listen(
      (data) {
        _doctorChatController.add(data);
      },
      onError: (error) {
        _doctorChatController.addError(error);
      },
    );

    // Listen to health worker chat stream
    getChatListStream("healthWorker").listen(
      (data) {
        _healthWorkerChatController.add(data);
      },
      onError: (error) {
        _healthWorkerChatController.addError(error);
      },
    );
  }

  // Method to get appropriate stream based on user type
  Stream<List<Map<String, dynamic>>> getChatStreamForUserType(String userType) {
    switch (userType.toLowerCase()) {
      case "patient":
        return patientChatListStream;
      case "doctor":
        return doctorChatListStream;
      case "healthworker":
        return healthWorkerChatListStream;
      default:
        throw ArgumentError('Invalid user type: $userType');
    }
  }

  @override
  void onClose() {
    // Close all stream controllers
    _patientChatController.close();
    _doctorChatController.close();
    _healthWorkerChatController.close();
    super.onClose();
  }
}