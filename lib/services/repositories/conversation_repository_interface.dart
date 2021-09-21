// Helpers
import '../../helper/typedefs.dart';

// Models
import '../../models/conversation_model.dart';

/// A base class containing CRUD methods for conversations collection.
///
/// Should be implemented by any repository class that wishes to interact
/// with the collection.
abstract class IConversationRepository {
  /// Returns a stream of a list of all normal conversations
  /// that are neither spammed nor archived, sorted in ascending
  /// order.
  Stream<List<Conversation>> getAllConversations();

  /// Returns a stream of a single conversation fetched from the conversation
  /// document at the provided number.
  Stream<Conversation> getAConversation({required String number});

  /// Adds a conversation document.
  Future<void> addConversation(Conversation conversation);

  /// Updates an entire conversation document.
  /// Setting merge to true would only update the document with the new changes
  /// instead of re writing all field.
  Future<void> updateConversation(
    Conversation conversation, {
    bool merge = false,
  });

  /// Performs the specified changes on the entire conversation document.
  /// You have control over what's being updated and to what value it is
  /// being updated.
  Future<void> changeConversation(
    Conversation conversation, {
    required JSON changes,
  });

  /// Iterates over the conversations list to perform the specified changes
  /// on each of them.
  /// You have control over what's being updated and to what value it is
  /// being updated.
  Future<void> changeMultipleConversations(
    List<Conversation> convos, {
    required JSON changes,
  });

  /// Performs the provided changes on all the documents in the
  /// collection "conversations".
  /// It only applies this operation on normal conversations by filtering
  /// out any spammed or archived conversations.
  Future<void> markAllConversationsRead();

  /// Deletes the provided conversation document.
  Future<void> deleteConversation(Conversation conversation);
}
