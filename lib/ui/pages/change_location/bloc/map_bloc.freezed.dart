// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MapEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Point address) changeByMap,
    required TResult Function(String address) changeByAddress,
    required TResult Function() scrollStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Point address)? changeByMap,
    TResult? Function(String address)? changeByAddress,
    TResult? Function()? scrollStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Point address)? changeByMap,
    TResult Function(String address)? changeByAddress,
    TResult Function()? scrollStarted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeByMap value) changeByMap,
    required TResult Function(_ChangeByAddress value) changeByAddress,
    required TResult Function(_ScrollStarted value) scrollStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeByMap value)? changeByMap,
    TResult? Function(_ChangeByAddress value)? changeByAddress,
    TResult? Function(_ScrollStarted value)? scrollStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeByMap value)? changeByMap,
    TResult Function(_ChangeByAddress value)? changeByAddress,
    TResult Function(_ScrollStarted value)? scrollStarted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapEventCopyWith<$Res> {
  factory $MapEventCopyWith(MapEvent value, $Res Function(MapEvent) then) =
      _$MapEventCopyWithImpl<$Res, MapEvent>;
}

/// @nodoc
class _$MapEventCopyWithImpl<$Res, $Val extends MapEvent>
    implements $MapEventCopyWith<$Res> {
  _$MapEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'MapEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Point address) changeByMap,
    required TResult Function(String address) changeByAddress,
    required TResult Function() scrollStarted,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Point address)? changeByMap,
    TResult? Function(String address)? changeByAddress,
    TResult? Function()? scrollStarted,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Point address)? changeByMap,
    TResult Function(String address)? changeByAddress,
    TResult Function()? scrollStarted,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeByMap value) changeByMap,
    required TResult Function(_ChangeByAddress value) changeByAddress,
    required TResult Function(_ScrollStarted value) scrollStarted,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeByMap value)? changeByMap,
    TResult? Function(_ChangeByAddress value)? changeByAddress,
    TResult? Function(_ScrollStarted value)? scrollStarted,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeByMap value)? changeByMap,
    TResult Function(_ChangeByAddress value)? changeByAddress,
    TResult Function(_ScrollStarted value)? scrollStarted,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements MapEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$ChangeByMapImplCopyWith<$Res> {
  factory _$$ChangeByMapImplCopyWith(
          _$ChangeByMapImpl value, $Res Function(_$ChangeByMapImpl) then) =
      __$$ChangeByMapImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Point address});
}

/// @nodoc
class __$$ChangeByMapImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$ChangeByMapImpl>
    implements _$$ChangeByMapImplCopyWith<$Res> {
  __$$ChangeByMapImplCopyWithImpl(
      _$ChangeByMapImpl _value, $Res Function(_$ChangeByMapImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
  }) {
    return _then(_$ChangeByMapImpl(
      null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Point,
    ));
  }
}

/// @nodoc

class _$ChangeByMapImpl implements _ChangeByMap {
  const _$ChangeByMapImpl(this.address);

  @override
  final Point address;

  @override
  String toString() {
    return 'MapEvent.changeByMap(address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeByMapImpl &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeByMapImplCopyWith<_$ChangeByMapImpl> get copyWith =>
      __$$ChangeByMapImplCopyWithImpl<_$ChangeByMapImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Point address) changeByMap,
    required TResult Function(String address) changeByAddress,
    required TResult Function() scrollStarted,
  }) {
    return changeByMap(address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Point address)? changeByMap,
    TResult? Function(String address)? changeByAddress,
    TResult? Function()? scrollStarted,
  }) {
    return changeByMap?.call(address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Point address)? changeByMap,
    TResult Function(String address)? changeByAddress,
    TResult Function()? scrollStarted,
    required TResult orElse(),
  }) {
    if (changeByMap != null) {
      return changeByMap(address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeByMap value) changeByMap,
    required TResult Function(_ChangeByAddress value) changeByAddress,
    required TResult Function(_ScrollStarted value) scrollStarted,
  }) {
    return changeByMap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeByMap value)? changeByMap,
    TResult? Function(_ChangeByAddress value)? changeByAddress,
    TResult? Function(_ScrollStarted value)? scrollStarted,
  }) {
    return changeByMap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeByMap value)? changeByMap,
    TResult Function(_ChangeByAddress value)? changeByAddress,
    TResult Function(_ScrollStarted value)? scrollStarted,
    required TResult orElse(),
  }) {
    if (changeByMap != null) {
      return changeByMap(this);
    }
    return orElse();
  }
}

abstract class _ChangeByMap implements MapEvent {
  const factory _ChangeByMap(final Point address) = _$ChangeByMapImpl;

  Point get address;
  @JsonKey(ignore: true)
  _$$ChangeByMapImplCopyWith<_$ChangeByMapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeByAddressImplCopyWith<$Res> {
  factory _$$ChangeByAddressImplCopyWith(_$ChangeByAddressImpl value,
          $Res Function(_$ChangeByAddressImpl) then) =
      __$$ChangeByAddressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String address});
}

/// @nodoc
class __$$ChangeByAddressImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$ChangeByAddressImpl>
    implements _$$ChangeByAddressImplCopyWith<$Res> {
  __$$ChangeByAddressImplCopyWithImpl(
      _$ChangeByAddressImpl _value, $Res Function(_$ChangeByAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
  }) {
    return _then(_$ChangeByAddressImpl(
      null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeByAddressImpl implements _ChangeByAddress {
  const _$ChangeByAddressImpl(this.address);

  @override
  final String address;

  @override
  String toString() {
    return 'MapEvent.changeByAddress(address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeByAddressImpl &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeByAddressImplCopyWith<_$ChangeByAddressImpl> get copyWith =>
      __$$ChangeByAddressImplCopyWithImpl<_$ChangeByAddressImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Point address) changeByMap,
    required TResult Function(String address) changeByAddress,
    required TResult Function() scrollStarted,
  }) {
    return changeByAddress(address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Point address)? changeByMap,
    TResult? Function(String address)? changeByAddress,
    TResult? Function()? scrollStarted,
  }) {
    return changeByAddress?.call(address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Point address)? changeByMap,
    TResult Function(String address)? changeByAddress,
    TResult Function()? scrollStarted,
    required TResult orElse(),
  }) {
    if (changeByAddress != null) {
      return changeByAddress(address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeByMap value) changeByMap,
    required TResult Function(_ChangeByAddress value) changeByAddress,
    required TResult Function(_ScrollStarted value) scrollStarted,
  }) {
    return changeByAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeByMap value)? changeByMap,
    TResult? Function(_ChangeByAddress value)? changeByAddress,
    TResult? Function(_ScrollStarted value)? scrollStarted,
  }) {
    return changeByAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeByMap value)? changeByMap,
    TResult Function(_ChangeByAddress value)? changeByAddress,
    TResult Function(_ScrollStarted value)? scrollStarted,
    required TResult orElse(),
  }) {
    if (changeByAddress != null) {
      return changeByAddress(this);
    }
    return orElse();
  }
}

abstract class _ChangeByAddress implements MapEvent {
  const factory _ChangeByAddress(final String address) = _$ChangeByAddressImpl;

  String get address;
  @JsonKey(ignore: true)
  _$$ChangeByAddressImplCopyWith<_$ChangeByAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScrollStartedImplCopyWith<$Res> {
  factory _$$ScrollStartedImplCopyWith(
          _$ScrollStartedImpl value, $Res Function(_$ScrollStartedImpl) then) =
      __$$ScrollStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ScrollStartedImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$ScrollStartedImpl>
    implements _$$ScrollStartedImplCopyWith<$Res> {
  __$$ScrollStartedImplCopyWithImpl(
      _$ScrollStartedImpl _value, $Res Function(_$ScrollStartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ScrollStartedImpl implements _ScrollStarted {
  const _$ScrollStartedImpl();

  @override
  String toString() {
    return 'MapEvent.scrollStarted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ScrollStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Point address) changeByMap,
    required TResult Function(String address) changeByAddress,
    required TResult Function() scrollStarted,
  }) {
    return scrollStarted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Point address)? changeByMap,
    TResult? Function(String address)? changeByAddress,
    TResult? Function()? scrollStarted,
  }) {
    return scrollStarted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Point address)? changeByMap,
    TResult Function(String address)? changeByAddress,
    TResult Function()? scrollStarted,
    required TResult orElse(),
  }) {
    if (scrollStarted != null) {
      return scrollStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeByMap value) changeByMap,
    required TResult Function(_ChangeByAddress value) changeByAddress,
    required TResult Function(_ScrollStarted value) scrollStarted,
  }) {
    return scrollStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeByMap value)? changeByMap,
    TResult? Function(_ChangeByAddress value)? changeByAddress,
    TResult? Function(_ScrollStarted value)? scrollStarted,
  }) {
    return scrollStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeByMap value)? changeByMap,
    TResult Function(_ChangeByAddress value)? changeByAddress,
    TResult Function(_ScrollStarted value)? scrollStarted,
    required TResult orElse(),
  }) {
    if (scrollStarted != null) {
      return scrollStarted(this);
    }
    return orElse();
  }
}

abstract class _ScrollStarted implements MapEvent {
  const factory _ScrollStarted() = _$ScrollStartedImpl;
}

/// @nodoc
mixin _$MapState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() hasScroll,
    required TResult Function() loading,
    required TResult Function(MapModel address) success,
    required TResult Function(String errorMessage) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? hasScroll,
    TResult? Function()? loading,
    TResult? Function(MapModel address)? success,
    TResult? Function(String errorMessage)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? hasScroll,
    TResult Function()? loading,
    TResult Function(MapModel address)? success,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HasScroll value) hasScroll,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HasScroll value)? hasScroll,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HasScroll value)? hasScroll,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapStateCopyWith<$Res> {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) then) =
      _$MapStateCopyWithImpl<$Res, MapState>;
}

/// @nodoc
class _$MapStateCopyWithImpl<$Res, $Val extends MapState>
    implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$HasScrollImplCopyWith<$Res> {
  factory _$$HasScrollImplCopyWith(
          _$HasScrollImpl value, $Res Function(_$HasScrollImpl) then) =
      __$$HasScrollImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HasScrollImplCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$HasScrollImpl>
    implements _$$HasScrollImplCopyWith<$Res> {
  __$$HasScrollImplCopyWithImpl(
      _$HasScrollImpl _value, $Res Function(_$HasScrollImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HasScrollImpl implements _HasScroll {
  const _$HasScrollImpl();

  @override
  String toString() {
    return 'MapState.hasScroll()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HasScrollImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() hasScroll,
    required TResult Function() loading,
    required TResult Function(MapModel address) success,
    required TResult Function(String errorMessage) error,
  }) {
    return hasScroll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? hasScroll,
    TResult? Function()? loading,
    TResult? Function(MapModel address)? success,
    TResult? Function(String errorMessage)? error,
  }) {
    return hasScroll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? hasScroll,
    TResult Function()? loading,
    TResult Function(MapModel address)? success,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (hasScroll != null) {
      return hasScroll();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HasScroll value) hasScroll,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return hasScroll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HasScroll value)? hasScroll,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return hasScroll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HasScroll value)? hasScroll,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (hasScroll != null) {
      return hasScroll(this);
    }
    return orElse();
  }
}

abstract class _HasScroll implements MapState {
  const factory _HasScroll() = _$HasScrollImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'MapState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() hasScroll,
    required TResult Function() loading,
    required TResult Function(MapModel address) success,
    required TResult Function(String errorMessage) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? hasScroll,
    TResult? Function()? loading,
    TResult? Function(MapModel address)? success,
    TResult? Function(String errorMessage)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? hasScroll,
    TResult Function()? loading,
    TResult Function(MapModel address)? success,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HasScroll value) hasScroll,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HasScroll value)? hasScroll,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HasScroll value)? hasScroll,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements MapState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MapModel address});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
  }) {
    return _then(_$SuccessImpl(
      null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as MapModel,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.address);

  @override
  final MapModel address;

  @override
  String toString() {
    return 'MapState.success(address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() hasScroll,
    required TResult Function() loading,
    required TResult Function(MapModel address) success,
    required TResult Function(String errorMessage) error,
  }) {
    return success(address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? hasScroll,
    TResult? Function()? loading,
    TResult? Function(MapModel address)? success,
    TResult? Function(String errorMessage)? error,
  }) {
    return success?.call(address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? hasScroll,
    TResult Function()? loading,
    TResult Function(MapModel address)? success,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HasScroll value) hasScroll,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HasScroll value)? hasScroll,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HasScroll value)? hasScroll,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements MapState {
  const factory _Success(final MapModel address) = _$SuccessImpl;

  MapModel get address;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$ErrorImpl(
      null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.errorMessage);

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'MapState.error(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() hasScroll,
    required TResult Function() loading,
    required TResult Function(MapModel address) success,
    required TResult Function(String errorMessage) error,
  }) {
    return error(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? hasScroll,
    TResult? Function()? loading,
    TResult? Function(MapModel address)? success,
    TResult? Function(String errorMessage)? error,
  }) {
    return error?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? hasScroll,
    TResult Function()? loading,
    TResult Function(MapModel address)? success,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HasScroll value) hasScroll,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HasScroll value)? hasScroll,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HasScroll value)? hasScroll,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements MapState {
  const factory _Error(final String errorMessage) = _$ErrorImpl;

  String get errorMessage;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
