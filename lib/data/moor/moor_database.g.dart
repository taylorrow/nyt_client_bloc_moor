// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class NYTMainPageTableData extends DataClass
    implements Insertable<NYTMainPageTableData> {
  final int id;
  final String title;
  final String url;
  final String image;
  NYTMainPageTableData(
      {@required this.id,
      @required this.title,
      @required this.url,
      @required this.image});
  factory NYTMainPageTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NYTMainPageTableData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      url: stringType.mapFromDatabaseResponse(data['${effectivePrefix}url']),
      image:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}image']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    return map;
  }

  NYTMainPageTableCompanion toCompanion(bool nullToAbsent) {
    return NYTMainPageTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
    );
  }

  factory NYTMainPageTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NYTMainPageTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      url: serializer.fromJson<String>(json['url']),
      image: serializer.fromJson<String>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'url': serializer.toJson<String>(url),
      'image': serializer.toJson<String>(image),
    };
  }

  NYTMainPageTableData copyWith(
          {int id, String title, String url, String image}) =>
      NYTMainPageTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        url: url ?? this.url,
        image: image ?? this.image,
      );
  @override
  String toString() {
    return (StringBuffer('NYTMainPageTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode, $mrjc(title.hashCode, $mrjc(url.hashCode, image.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NYTMainPageTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.url == this.url &&
          other.image == this.image);
}

class NYTMainPageTableCompanion extends UpdateCompanion<NYTMainPageTableData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> url;
  final Value<String> image;
  const NYTMainPageTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.url = const Value.absent(),
    this.image = const Value.absent(),
  });
  NYTMainPageTableCompanion.insert({
    this.id = const Value.absent(),
    @required String title,
    @required String url,
    @required String image,
  })  : title = Value(title),
        url = Value(url),
        image = Value(image);
  static Insertable<NYTMainPageTableData> custom({
    Expression<int> id,
    Expression<String> title,
    Expression<String> url,
    Expression<String> image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (url != null) 'url': url,
      if (image != null) 'image': image,
    });
  }

  NYTMainPageTableCompanion copyWith(
      {Value<int> id,
      Value<String> title,
      Value<String> url,
      Value<String> image}) {
    return NYTMainPageTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      image: image ?? this.image,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NYTMainPageTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

class $NYTMainPageTableTable extends NYTMainPageTable
    with TableInfo<$NYTMainPageTableTable, NYTMainPageTableData> {
  final GeneratedDatabase _db;
  final String _alias;
  $NYTMainPageTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _urlMeta = const VerificationMeta('url');
  GeneratedTextColumn _url;
  @override
  GeneratedTextColumn get url => _url ??= _constructUrl();
  GeneratedTextColumn _constructUrl() {
    return GeneratedTextColumn(
      'url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _imageMeta = const VerificationMeta('image');
  GeneratedTextColumn _image;
  @override
  GeneratedTextColumn get image => _image ??= _constructImage();
  GeneratedTextColumn _constructImage() {
    return GeneratedTextColumn(
      'image',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, title, url, image];
  @override
  $NYTMainPageTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'n_y_t_main_page_table';
  @override
  final String actualTableName = 'n_y_t_main_page_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<NYTMainPageTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url'], _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image'], _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NYTMainPageTableData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NYTMainPageTableData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $NYTMainPageTableTable createAlias(String alias) {
    return $NYTMainPageTableTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $NYTMainPageTableTable _nYTMainPageTable;
  $NYTMainPageTableTable get nYTMainPageTable =>
      _nYTMainPageTable ??= $NYTMainPageTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [nYTMainPageTable];
}
