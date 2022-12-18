import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../post_details/post_details_widget.dart';
import '../survey/survey_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  List<NoticeBoardRecord> simpleSearchResults = [];
  TextEditingController? searchFieldController;
  PagingController<DocumentSnapshot?, NoticeBoardRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    searchFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    searchFieldController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFFFEBEB),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'HotD',
              style: FlutterFlowTheme.of(context).title1,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SurveyWidget(),
                    ),
                  );
                },
                text: '관심 주제 설정',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: Color(0xFFE83F3F),
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                    child: TextFormField(
                      controller: searchFieldController,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Search here',
                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24,
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                      maxLines: null,
                    ),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    await queryNoticeBoardRecordOnce()
                        .then(
                          (records) => simpleSearchResults = TextSearch(
                            records
                                .map(
                                  (record) => TextSearchItem(record,
                                      [record.postTitle!, record.postLink!]),
                                )
                                .toList(),
                          )
                              .search(searchFieldController!.text)
                              .map((r) => r.object)
                              .take(30)
                              .toList(),
                        )
                        .onError((_, __) => simpleSearchResults = [])
                        .whenComplete(() => setState(() {}));

                    setState(() {
                      FFAppState().fulllist = false;
                    });
                  },
                  text: 'Search',
                  options: FFButtonOptions(
                    width: 100,
                    height: 50,
                    color: Color(0xFFE83F3F),
                    textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                    elevation: 2,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 40,
                  icon: Icon(
                    Icons.cancel_outlined,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 20,
                  ),
                  onPressed: () async {
                    setState(() {
                      FFAppState().fulllist = true;
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    '추천 핫딜',
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Outfit',
                          fontSize: 17,
                        ),
                  ),
                ],
              ),
            ),
            if (FFAppState().fulllist)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                child: PagedListView<DocumentSnapshot<Object?>?,
                    NoticeBoardRecord>(
                  pagingController: () {
                    final Query<Object?> Function(Query<Object?>) queryBuilder =
                        (noticeBoardRecord) => noticeBoardRecord;
                    if (_pagingController != null) {
                      final query = queryBuilder(NoticeBoardRecord.collection);
                      if (query != _pagingQuery) {
                        // The query has changed
                        _pagingQuery = query;
                        _streamSubscriptions.forEach((s) => s?.cancel());
                        _streamSubscriptions.clear();
                        _pagingController!.refresh();
                      }
                      return _pagingController!;
                    }

                    _pagingController = PagingController(firstPageKey: null);
                    _pagingQuery = queryBuilder(NoticeBoardRecord.collection);
                    _pagingController!.addPageRequestListener((nextPageMarker) {
                      queryNoticeBoardRecordPage(
                        queryBuilder: (noticeBoardRecord) => noticeBoardRecord,
                        nextPageMarker: nextPageMarker,
                        pageSize: 25,
                        isStream: true,
                      ).then((page) {
                        _pagingController!.appendPage(
                          page.data,
                          page.nextPageMarker,
                        );
                        final streamSubscription =
                            page.dataStream?.listen((data) {
                          final itemIndexes = _pagingController!.itemList!
                              .asMap()
                              .map((k, v) => MapEntry(v.reference.id, k));
                          data.forEach((item) {
                            final index = itemIndexes[item.reference.id];
                            final items = _pagingController!.itemList!;
                            if (index != null) {
                              items.replaceRange(index, index + 1, [item]);
                              _pagingController!.itemList = {
                                for (var item in items) item.reference: item
                              }.values.toList();
                            }
                          });
                          setState(() {});
                        });
                        _streamSubscriptions.add(streamSubscription);
                      });
                    });
                    return _pagingController!;
                  }(),
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  builderDelegate: PagedChildBuilderDelegate<NoticeBoardRecord>(
                    // Customize what your widget looks like when it's loading the first page.
                    firstPageProgressIndicatorBuilder: (_) => Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                    ),

                    itemBuilder: (context, _, listViewIndex) {
                      final listViewNoticeBoardRecord =
                          _pagingController!.itemList![listViewIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: Image.network(
                                listViewNoticeBoardRecord.postPhoto!,
                              ).image,
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                color: Color(0x33000000),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 120, 0, 0),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            listViewNoticeBoardRecord
                                                .postTitle!,
                                            style: FlutterFlowTheme.of(context)
                                                .title2,
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              await launchURL(
                                                  listViewNoticeBoardRecord
                                                      .postLink!);
                                            },
                                            child: Text(
                                              listViewNoticeBoardRecord
                                                  .postLink!,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF39D2C0),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    PostDetailsWidget(
                                                  doc: listViewNoticeBoardRecord
                                                      .reference,
                                                ),
                                              ),
                                            );
                                          },
                                          text: '자세히 보기',
                                          icon: Icon(
                                            Icons.add_rounded,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          options: FFButtonOptions(
                                            width: 120,
                                            height: 40,
                                            color: Color(0xFFE83F3F),
                                            textStyle: GoogleFonts.getFont(
                                              'Lexend Deca',
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                            elevation: 3,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 40,
                                      icon: Icon(
                                        Icons.push_pin,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 25,
                                      ),
                                      onPressed: () async {
                                        final scrapCreateData =
                                            createScrapRecordData(
                                          user: currentUserReference,
                                          board: listViewNoticeBoardRecord
                                              .reference,
                                        );
                                        await ScrapRecord.collection
                                            .doc()
                                            .set(scrapCreateData);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            if (!FFAppState().fulllist)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                child: Builder(
                  builder: (context) {
                    final searchlist =
                        simpleSearchResults.toList().take(30).toList();
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: searchlist.length,
                      itemBuilder: (context, searchlistIndex) {
                        final searchlistItem = searchlist[searchlistIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: Image.network(
                                  searchlistItem.postPhoto!,
                                ).image,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  color: Color(0x33000000),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 120, 0, 0),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(0),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              searchlistItem.postTitle!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title2,
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                await launchURL(
                                                    searchlistItem.postLink!);
                                              },
                                              child: Text(
                                                searchlistItem.postLink!,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0xFF39D2C0),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      PostDetailsWidget(
                                                    doc: searchlistItem
                                                        .reference,
                                                  ),
                                                ),
                                              );
                                            },
                                            text: '자세히 보기',
                                            icon: Icon(
                                              Icons.add_rounded,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                            options: FFButtonOptions(
                                              width: 120,
                                              height: 40,
                                              color: Color(0xFFE83F3F),
                                              textStyle: GoogleFonts.getFont(
                                                'Lexend Deca',
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                              elevation: 3,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30,
                                        borderWidth: 1,
                                        buttonSize: 40,
                                        icon: Icon(
                                          Icons.push_pin,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 25,
                                        ),
                                        onPressed: () async {
                                          final scrapCreateData =
                                              createScrapRecordData(
                                            user: currentUserReference,
                                            board: searchlistItem.reference,
                                          );
                                          await ScrapRecord.collection
                                              .doc()
                                              .set(scrapCreateData);
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('스크랩완료'),
                                                content: Text('스크랩되었습니다.'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
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
