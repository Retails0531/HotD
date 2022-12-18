import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PostDetailsWidget extends StatefulWidget {
  const PostDetailsWidget({
    Key? key,
    this.doc,
  }) : super(key: key);

  final DocumentReference? doc;

  @override
  _PostDetailsWidgetState createState() => _PostDetailsWidgetState();
}

class _PostDetailsWidgetState extends State<PostDetailsWidget> {
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<NoticeBoardRecord>(
      stream: NoticeBoardRecord.getDocument(widget.doc!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final postDetailsNoticeBoardRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFFFEBEB),
          appBar: AppBar(
            backgroundColor: Color(0xFFE83F3F),
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.chevron_left_sharp,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        NavBarPage(initialPage: 'post_member'),
                  ),
                );
              },
            ),
            title: Text(
              'Post',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Outfit',
                    color: Colors.white,
                    fontSize: 22,
                  ),
            ),
            actions: [
              Visibility(
                visible: postDetailsNoticeBoardRecord.postUser ==
                    currentUserReference,
                child: ToggleIcon(
                  onPressed: () async {
                    final noticeBoardUpdateData = {
                      'alert': !postDetailsNoticeBoardRecord.alert!,
                    };
                    await postDetailsNoticeBoardRecord.reference
                        .update(noticeBoardUpdateData);
                  },
                  value: postDetailsNoticeBoardRecord.alert!,
                  onIcon: Icon(
                    Icons.notifications_active,
                    color: Colors.white,
                    size: 25,
                  ),
                  offIcon: Icon(
                    Icons.notifications_off,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ],
            centerTitle: false,
            elevation: 2,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        StreamBuilder<UsersRecord>(
                          stream: UsersRecord.getDocument(
                              postDetailsNoticeBoardRecord.postUser!),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            final rowUsersRecord = snapshot.data!;
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: Icon(
                                    Icons.location_history,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                                Expanded(
                                  child: SelectionArea(
                                      child: Text(
                                    rowUsersRecord.displayName!,
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  )),
                                ),
                                if (postDetailsNoticeBoardRecord.postUser ==
                                    currentUserReference)
                                  FFButtonWidget(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    text: '수정',
                                    options: FFButtonOptions(
                                      width: 70,
                                      height: 40,
                                      color: Color(0xFFDF7171),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
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
                                if (postDetailsNoticeBoardRecord.postUser ==
                                    currentUserReference)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 5, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await FirebaseStorage.instance
                                            .refFromURL('')
                                            .delete();
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => NavBarPage(
                                                initialPage: 'post_member'),
                                          ),
                                        );
                                      },
                                      text: '삭제',
                                      options: FFButtonOptions(
                                        width: 70,
                                        height: 40,
                                        color: Color(0xFFDF7171),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
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
                            );
                          },
                        ),
                        Container(
                          width: 500,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Color(0xFFC3B3B3),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: SelectionArea(
                                        child: Text(
                                      postDetailsNoticeBoardRecord
                                          .postDescription!,
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    )),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 10),
                                  child: Image.network(
                                    postDetailsNoticeBoardRecord.postPhoto!,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 5, 0),
                              child: Icon(
                                Icons.mode_comment_outlined,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                            SelectionArea(
                                child: Text(
                              postDetailsNoticeBoardRecord.numComments!
                                  .toString(),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            )),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: ToggleIcon(
                                onPressed: () async {
                                  final likesElement = currentUserReference;
                                  final likesUpdate =
                                      postDetailsNoticeBoardRecord.likes!
                                              .toList()
                                              .contains(likesElement)
                                          ? FieldValue.arrayRemove(
                                              [likesElement])
                                          : FieldValue.arrayUnion(
                                              [likesElement]);
                                  final noticeBoardUpdateData = {
                                    'likes': likesUpdate,
                                  };
                                  await postDetailsNoticeBoardRecord.reference
                                      .update(noticeBoardUpdateData);
                                },
                                value: postDetailsNoticeBoardRecord.likes!
                                    .toList()
                                    .contains(currentUserReference),
                                onIcon: Icon(
                                  Icons.thumb_up,
                                  color: Colors.black,
                                  size: 25,
                                ),
                                offIcon: Icon(
                                  Icons.thumb_up_outlined,
                                  color: Colors.black,
                                  size: 25,
                                ),
                              ),
                            ),
                            SelectionArea(
                                child: Text(
                              postDetailsNoticeBoardRecord.likes!
                                  .toList()
                                  .length
                                  .toString(),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            )),
                          ],
                        ),
                        Container(
                          width: 350,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: textController,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: '댓글을 입력하세요',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  final commentsCreateData =
                                      createCommentsRecordData(
                                    displayname: valueOrDefault<String>(
                                      currentUserDisplayName,
                                      'ㅇㅇ',
                                    ),
                                    contents: textController!.text,
                                    board:
                                        postDetailsNoticeBoardRecord.reference,
                                  );
                                  await CommentsRecord.collection
                                      .doc()
                                      .set(commentsCreateData);

                                  final noticeBoardUpdateData = {
                                    'num_comments': FieldValue.increment(1),
                                  };
                                  await postDetailsNoticeBoardRecord.reference
                                      .update(noticeBoardUpdateData);
                                  if (postDetailsNoticeBoardRecord.alert!) {
                                    triggerPushNotification(
                                      notificationTitle: '댓글업!',
                                      notificationText: '누군가 내 글에 댓글을 달았어요',
                                      userRefs: [
                                        postDetailsNoticeBoardRecord.postUser!
                                      ],
                                      initialPageName: 'post_details',
                                      parameterData: {
                                        'doc': postDetailsNoticeBoardRecord
                                            .reference,
                                      },
                                    );
                                  }
                                },
                                child: Icon(
                                  Icons.send,
                                  color: Colors.black,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Container(
                            width: 350,
                            height: 500,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: FutureBuilder<List<CommentsRecord>>(
                              future: queryCommentsRecordOnce(
                                queryBuilder: (commentsRecord) =>
                                    commentsRecord.where('board',
                                        isEqualTo: postDetailsNoticeBoardRecord
                                            .reference),
                                limit: 30,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                List<CommentsRecord> columnCommentsRecordList =
                                    snapshot.data!;
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: List.generate(
                                        columnCommentsRecordList.length,
                                        (columnIndex) {
                                      final columnCommentsRecord =
                                          columnCommentsRecordList[columnIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 5),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.person_outline,
                                              color: Colors.black,
                                              size: 30,
                                            ),
                                            SelectionArea(
                                                child: Text(
                                              columnCommentsRecord.displayname!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            )),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 0, 0, 0),
                                              child: SelectionArea(
                                                  child: Text(
                                                columnCommentsRecord.contents!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              )),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
