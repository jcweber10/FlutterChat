// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$messagesHash() => r'0bd2b66096c7145a9ab8db5a24cf8b06e647ea26';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$Messages
    extends BuildlessAutoDisposeStreamNotifier<List<Message>> {
  late final String conversationId;

  Stream<List<Message>> build(
    String conversationId,
  );
}

/// See also [Messages].
@ProviderFor(Messages)
const messagesProvider = MessagesFamily();

/// See also [Messages].
class MessagesFamily extends Family<AsyncValue<List<Message>>> {
  /// See also [Messages].
  const MessagesFamily();

  /// See also [Messages].
  MessagesProvider call(
    String conversationId,
  ) {
    return MessagesProvider(
      conversationId,
    );
  }

  @override
  MessagesProvider getProviderOverride(
    covariant MessagesProvider provider,
  ) {
    return call(
      provider.conversationId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'messagesProvider';
}

/// See also [Messages].
class MessagesProvider
    extends AutoDisposeStreamNotifierProviderImpl<Messages, List<Message>> {
  /// See also [Messages].
  MessagesProvider(
    String conversationId,
  ) : this._internal(
          () => Messages()..conversationId = conversationId,
          from: messagesProvider,
          name: r'messagesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$messagesHash,
          dependencies: MessagesFamily._dependencies,
          allTransitiveDependencies: MessagesFamily._allTransitiveDependencies,
          conversationId: conversationId,
        );

  MessagesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.conversationId,
  }) : super.internal();

  final String conversationId;

  @override
  Stream<List<Message>> runNotifierBuild(
    covariant Messages notifier,
  ) {
    return notifier.build(
      conversationId,
    );
  }

  @override
  Override overrideWith(Messages Function() create) {
    return ProviderOverride(
      origin: this,
      override: MessagesProvider._internal(
        () => create()..conversationId = conversationId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        conversationId: conversationId,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<Messages, List<Message>>
      createElement() {
    return _MessagesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MessagesProvider && other.conversationId == conversationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, conversationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MessagesRef on AutoDisposeStreamNotifierProviderRef<List<Message>> {
  /// The parameter `conversationId` of this provider.
  String get conversationId;
}

class _MessagesProviderElement
    extends AutoDisposeStreamNotifierProviderElement<Messages, List<Message>>
    with MessagesRef {
  _MessagesProviderElement(super.provider);

  @override
  String get conversationId => (origin as MessagesProvider).conversationId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
