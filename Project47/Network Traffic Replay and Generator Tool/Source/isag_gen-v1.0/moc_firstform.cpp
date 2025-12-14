/****************************************************************************
** firstForm meta object code from reading C++ file 'firstform.h'
**
** Created: Thu Jan 27 19:35:45 2005
**      by: The Qt MOC ($Id: qt/moc_yacc.cpp   3.3.2   edited Apr 19 11:34 $)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#undef QT_NO_COMPAT
#include "firstform.h"
#include <qmetaobject.h>
#include <qapplication.h>

#include <private/qucomextra_p.h>
#if !defined(Q_MOC_OUTPUT_REVISION) || (Q_MOC_OUTPUT_REVISION != 26)
#error "This file was generated using the moc from 3.3.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

const char *firstForm::className() const
{
    return "firstForm";
}

QMetaObject *firstForm::metaObj = 0;
static QMetaObjectCleanUp cleanUp_firstForm( "firstForm", &firstForm::staticMetaObject );

#ifndef QT_NO_TRANSLATION
QString firstForm::tr( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "firstForm", s, c, QApplication::DefaultCodec );
    else
	return QString::fromLatin1( s );
}
#ifndef QT_NO_TRANSLATION_UTF8
QString firstForm::trUtf8( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "firstForm", s, c, QApplication::UnicodeUTF8 );
    else
	return QString::fromUtf8( s );
}
#endif // QT_NO_TRANSLATION_UTF8

#endif // QT_NO_TRANSLATION

QMetaObject* firstForm::staticMetaObject()
{
    if ( metaObj )
	return metaObj;
    QMetaObject* parentObject = QMainWindow::staticMetaObject();
    static const QUMethod slot_0 = {"fileOpen", 0, 0 };
    static const QUMethod slot_1 = {"fileOpen2", 0, 0 };
    static const QUParameter param_slot_2[] = {
	{ "fileName", &static_QUType_QString, 0, QUParameter::In }
    };
    static const QUMethod slot_2 = {"load", 1, param_slot_2 };
    static const QUMethod slot_3 = {"fileSave", 0, 0 };
    static const QUMethod slot_4 = {"fileSaveAs", 0, 0 };
    static const QUMethod slot_5 = {"fileExit", 0, 0 };
    static const QUMethod slot_6 = {"helpAbout", 0, 0 };
    static const QUParameter param_slot_7[] = {
	{ "action", &static_QUType_ptr, "QAction", QUParameter::In }
    };
    static const QUMethod slot_7 = {"changeFunction", 1, param_slot_7 };
    static const QUMethod slot_8 = {"ChangeMode", 0, 0 };
    static const QUMethod slot_9 = {"showReplay", 0, 0 };
    static const QUMethod slot_10 = {"ModeChange", 0, 0 };
    static const QUParameter param_slot_11[] = {
	{ 0, &static_QUType_QString, 0, QUParameter::In }
    };
    static const QUMethod slot_11 = {"fileNameChanged", 1, param_slot_11 };
    static const QUMethod slot_12 = {"ShowCapture", 0, 0 };
    static const QUParameter param_slot_13[] = {
	{ "row", &static_QUType_int, 0, QUParameter::In },
	{ "col", &static_QUType_int, 0, QUParameter::In }
    };
    static const QUMethod slot_13 = {"clickTable", 2, param_slot_13 };
    static const QUMethod slot_14 = {"startCapture", 0, 0 };
    static const QUMethod slot_15 = {"Showprogress", 0, 0 };
    static const QUMethod slot_16 = {"ShowCaptureprogress", 0, 0 };
    static const QUMethod slot_17 = {"displayshow", 0, 0 };
    static const QUMethod slot_18 = {"languageChange", 0, 0 };
    static const QMetaData slot_tbl[] = {
	{ "fileOpen()", &slot_0, QMetaData::Public },
	{ "fileOpen2()", &slot_1, QMetaData::Public },
	{ "load(const QString&)", &slot_2, QMetaData::Public },
	{ "fileSave()", &slot_3, QMetaData::Public },
	{ "fileSaveAs()", &slot_4, QMetaData::Public },
	{ "fileExit()", &slot_5, QMetaData::Public },
	{ "helpAbout()", &slot_6, QMetaData::Public },
	{ "changeFunction(QAction*)", &slot_7, QMetaData::Public },
	{ "ChangeMode()", &slot_8, QMetaData::Public },
	{ "showReplay()", &slot_9, QMetaData::Public },
	{ "ModeChange()", &slot_10, QMetaData::Public },
	{ "fileNameChanged(const QString&)", &slot_11, QMetaData::Public },
	{ "ShowCapture()", &slot_12, QMetaData::Public },
	{ "clickTable(int,int)", &slot_13, QMetaData::Public },
	{ "startCapture()", &slot_14, QMetaData::Public },
	{ "Showprogress()", &slot_15, QMetaData::Public },
	{ "ShowCaptureprogress()", &slot_16, QMetaData::Public },
	{ "displayshow()", &slot_17, QMetaData::Public },
	{ "languageChange()", &slot_18, QMetaData::Protected }
    };
    metaObj = QMetaObject::new_metaobject(
	"firstForm", parentObject,
	slot_tbl, 19,
	0, 0,
#ifndef QT_NO_PROPERTIES
	0, 0,
	0, 0,
#endif // QT_NO_PROPERTIES
	0, 0 );
    cleanUp_firstForm.setMetaObject( metaObj );
    return metaObj;
}

void* firstForm::qt_cast( const char* clname )
{
    if ( !qstrcmp( clname, "firstForm" ) )
	return this;
    return QMainWindow::qt_cast( clname );
}

bool firstForm::qt_invoke( int _id, QUObject* _o )
{
    switch ( _id - staticMetaObject()->slotOffset() ) {
    case 0: fileOpen(); break;
    case 1: fileOpen2(); break;
    case 2: load((const QString&)static_QUType_QString.get(_o+1)); break;
    case 3: fileSave(); break;
    case 4: fileSaveAs(); break;
    case 5: fileExit(); break;
    case 6: helpAbout(); break;
    case 7: changeFunction((QAction*)static_QUType_ptr.get(_o+1)); break;
    case 8: ChangeMode(); break;
    case 9: showReplay(); break;
    case 10: ModeChange(); break;
    case 11: fileNameChanged((const QString&)static_QUType_QString.get(_o+1)); break;
    case 12: ShowCapture(); break;
    case 13: clickTable((int)static_QUType_int.get(_o+1),(int)static_QUType_int.get(_o+2)); break;
    case 14: startCapture(); break;
    case 15: Showprogress(); break;
    case 16: ShowCaptureprogress(); break;
    case 17: displayshow(); break;
    case 18: languageChange(); break;
    default:
	return QMainWindow::qt_invoke( _id, _o );
    }
    return TRUE;
}

bool firstForm::qt_emit( int _id, QUObject* _o )
{
    return QMainWindow::qt_emit(_id,_o);
}
#ifndef QT_NO_PROPERTIES

bool firstForm::qt_property( int id, int f, QVariant* v)
{
    return QMainWindow::qt_property( id, f, v);
}

bool firstForm::qt_static_property( QObject* , int , int , QVariant* ){ return FALSE; }
#endif // QT_NO_PROPERTIES
