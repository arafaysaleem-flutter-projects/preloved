// Helpers
import '../../helper/typedefs.dart';

// Models
import '../../models/conversation_model.dart';

// Services
import '../networking/firestore_service.dart';

// Interfaces
import 'conversation_repository_interface.dart';

class ConversationRepository implements IConversationRepository {
  /// Logged in user id
  final String uid;

  /// Instance of firestore service
  final _service = FirestoreService.instance;

  ConversationRepository({required this.uid});

  @override
  Stream<Conversation> getAConversation({required String number}) {
    throw UnimplementedError();
    // return _service.documentStream<Conversation>(
    //   path: FirestorePath.conversation(uid, number),
    //   builder: (data, documentId) => Conversation.fromMap(data),
    // );
  }

  @override
  Stream<List<Conversation>> getAllConversations({
    QueryBuilder queryBuilder,
    Sorter<Conversation> sorter,
  }) {
    throw UnimplementedError();
    // return _service.collectionStream<Conversation>(
    //   path: FirestorePath.conversations(uid),
    //   queryBuilder: queryBuilder,
    //   builder: (data, _) => Conversation.fromMap(data),
    //   sort: sorter,
    // );
  }

  @override
  Future<void> addConversation(Conversation conversation) async {
    // return await _service.setData(
    //   path: FirestorePath.conversation(uid, conversation.sender.number),
    //   data: conversation.toMap(),
    // );
  }

  @override
  Future<void> updateConversation(
    Conversation conversation, {
    bool merge = false,
  }) async {
    // return await _service.setData(
    //   path: FirestorePath.conversation(uid, conversation.sender.number),
    //   data: conversation.toMap(),
    //   merge: merge,
    // );
  }

  @override
  Future<void> changeConversation(
    Conversation conversation, {
    required JSON changes,
  }) async {
    // return await _service.documentAction(
    //   path: FirestorePath.conversation(uid, conversation.sender.number),
    //   changes: <String, Object?>{'isRead': conversation.isRead},
    // );
  }

  @override
  Future<void> changeMultipleConversations(
    List<Conversation> convos, {
    required JSON changes,
  }) async {
    for (var convo in convos) {
      // debugPrint('${convo.isArchived}\t${convo.sender}');
      // await _service.documentAction(
      //   path: FirestorePath.conversation(uid, convo.sender.number),
      //   changes: <String,Object?>{'isArchived': convo.isArchived},
      // );
    }
  }

  @override
  Future<void> markAllConversationsRead() async {
    // return await _service.batchActon(
    //   path: FirestorePath.conversations(uid),
    //   changes: <String, Object?>{'isRead': true},
    //   queryBuilder: (query) => query
    //       .where('isSpam', isEqualTo: false)
    //       .where('isArchived', isEqualTo: false),
    // );
  }

  @override
  Future<void> deleteConversation(Conversation conversation) async {
    //   return await _service.deleteData(
    //     path: FirestorePath.conversation(uid, conversation.sender.number),
    //   );
  }
}
