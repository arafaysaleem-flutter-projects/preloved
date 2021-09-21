import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../helper/typedefs.dart';

import 'firestore_path.dart';
import 'firestore_service.dart';

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDatabase {
  FirestoreDatabase({ required this.uid });
  
  /// Logged in user id
  final String uid;

  /// Instance of firestore service
  final _service = FirestoreService.instance;

  /// Updates an entire conversation document or adds it if it doesn't exist.
  /// Setting merge to true would only update the document with the new changes
  /// instead of re writing all field.
  // Future<void> addOrUpdateConversation(Conversation conversation,
  //     {bool merge = false}) {
  //   return _service.setData(
  //     path: FirestorePath.conversation(uid, conversation.sender.number),
  //     data: conversation.toMap(),
  //     merge: merge,
  //   );
  // }

  /*
  * Most of the below specified methods for document action can be removed and
  * all the work can be done by addOrUpdate method by specifying merge true.
  *  However, you won't have control over what's being updated and to what
  *  value it is being updated.
  */

  /// Sets the conversation isRead to true.
  /// Updates only the specific isRead field instead of updating
  /// the whole document
  // Future<void> readConversation(Conversation conversation) {
  //   return _service.documentAction(
  //     path: FirestorePath.conversation(uid, conversation.sender.number),
  //     changes: <String,Object?>{'isRead': conversation.isRead},
  //   );
  // }

  /// Updates the messages list for a conversation to add the new
  /// messages. Updates only the specific messages field instead of updating
  /// the whole document.
  // Future<void> addMessages(Conversation conversation) {
  //   return _service.setData(
  //     path: FirestorePath.conversation(uid, conversation.sender.number),
  //     data: conversation.toMap() as JSON,
  //     merge: true,
  //   );
  // }

  /// Checks if the recipient exists as a user.
  Future<bool> checkUser(String number) async {
    return await _service.checkDocument(
      path: FirestorePath.user(number),
    );
  }

  /// Creates a new user document
  Future<void> createUser(String number, JSON data) async {
    return await _service.setData(
      path: FirestorePath.user(number),
      data: data,
    );
  }

  /// Iterates over the conversations list to toggle the isArchived field.
  /// Updates only the specific isArchived field instead of updating
  /// the whole document.
  // void toggleArchiveSelectedConversations(List<Conversation> archivedConvos) {
  //   for (var convo in archivedConvos) {
  //     debugPrint('${convo.isArchived}\t${convo.sender}');
  //     _service.documentAction(
  //       path: FirestorePath.conversation(uid, convo.sender.number),
  //       changes: <String,Object?>{'isArchived': convo.isArchived},
  //     );
  //   }
  // }

  /// Performs a batchAction to perform the provided changes on all
  /// the documents in the collection "conversations".
  /// It only applies this operation on normal conversations by filtering
  /// out any spammed or archived conversations.
  Future<void> markAllConversationsRead() {
    return _service.batchActon(
      path: FirestorePath.conversations(uid),
      changes: <String, Object?>{'isRead': true},
      queryBuilder: (query) => query
          .where('isSpam', isEqualTo: false)
          .where('isArchived', isEqualTo: false),
    );
  }

  /// Deletes the provided conversation document.
  // Future<void> deleteConversation(Conversation conversation) {
  //   return _service.deleteData(
  //     path: FirestorePath.conversation(uid, conversation.sender.number),
  //   );
  // }

  /// Returns a stream of a single conversation fetched from the conversation
  /// document at the provided number.
  // Stream<Conversation> conversationStream({required String number}) {
  //   return _service.documentStream<Conversation>(
  //     path: FirestorePath.conversation(uid, number),
  //     builder: (data, documentId) => Conversation.fromMap(data),
  //   );
  // }

  /// Returns a stream of a list of all normal conversations
  /// that are neither spammed nor archived, sorted in ascending
  /// order.
  // Stream<List<Conversation>> normalStream() {
  //   return _service.collectionStream<Conversation>(
  //     path: FirestorePath.conversations(uid),
  //     queryBuilder: (query) => query
  //         .where('isSpam', isEqualTo: false)
  //         .where('isArchived', isEqualTo: false),
  //     builder: (data, _) => Conversation.fromMap(data),
  //     sort: (Conversation lhs,Conversation rhs) =>
  //         lhs.latestMessage.datetime.compareTo(rhs.latestMessage.datetime) as int,
  //   );
  // }
}
