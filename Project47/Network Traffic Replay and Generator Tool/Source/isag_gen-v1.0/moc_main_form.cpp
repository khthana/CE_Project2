/****************************************************************************
** Main_Form meta object code from reading C++ file 'main_form.h'
**
** Created: Thu Jan 13 13:10:52 2005
**      by: The Qt MOC ($Id: qt/moc_yacc.cpp   3.3.3   edited Aug 5 16:40 $)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#undef QT_NO_COMPAT
#include "main_form.h"
#include <qmetaobject.h>
#include <qapplication.h>

#include <private/qucomextra_p.h>
#if !defined(Q_MOC_OUTPUT_REVISION) || (Q_MOC_OUTPUT_REVISION != 26)
#error "This file was generated using the moc from 3.3.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

const char *Main_Form::className() const
{
    return "Main_Form";
}

QMetaObject *Main_Form::metaObj = 0;
static QMetaObjectCleanUp cleanUp_Main_Form( "Main_Form", &Main_Form::staticMetaObject );

#ifndef QT_NO_TRANSLATION
QString Main_Form::tr( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "Main_Form", s, c, QApplication::DefaultCodec );
    else
	return QString::fromLatin1( s );
}
#ifndef QT_NO_TRANSLATION_UTF8
QString Main_Form::trUtf8( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "Main_Form", s, c, QApplication::UnicodeUTF8 );
    else
	return QString::fromUtf8( s );
}
#endif // QT_NO_TRANSLATION_UTF8

#endif // QT_NO_TRANSLATION

QMetaObject* Main_Form::staticMetaObject()
{
    if ( metaObj )
	return metaObj;
    QMetaObject* parentObject = QMainWindow::staticMetaObject();
    static const QUMethod slot_0 = {"fileNew", 0, 0 };
    static const QUMethod slot_1 = {"fileOpen", 0, 0 };
    static const QUMethod slot_2 = {"fileSave", 0, 0 };
    static const QUMethod slot_3 = {"fileSaveAs", 0, 0 };
    static const QUMethod slot_4 = {"filePrint", 0, 0 };
    static const QUMethod slot_5 = {"fileExit", 0, 0 };
    static const QUMethod slot_6 = {"editUndo", 0, 0 };
    static const QUMethod slot_7 = {"editRedo", 0, 0 };
    static const QUMethod slot_8 = {"editCut", 0, 0 };
    static const QUMethod slot_9 = {"editCopy", 0, 0 };
    static const QUMethod slot_10 = {"editPaste", 0, 0 };
    static const QUMethod slot_11 = {"editFind", 0, 0 };
    static const QUMethod slot_12 = {"helpIndex", 0, 0 };
    static const QUMethod slot_13 = {"helpContents", 0, 0 };
    static const QUMethod slot_14 = {"helpAbout", 0, 0 };
    static const QUMethod slot_15 = {"ArpForm", 0, 0 };
    static const QUMethod slot_16 = {"icmp_form", 0, 0 };
    static const QUMethod slot_17 = {"tcp_form", 0, 0 };
    static const QUMethod slot_18 = {"udp_form", 0, 0 };
    static const QUMethod slot_19 = {"smurf_form", 0, 0 };
    static const QUMethod slot_20 = {"syncflood_form", 0, 0 };
    static const QUMethod slot_21 = {"languageChange", 0, 0 };
    static const QMetaData slot_tbl[] = {
	{ "fileNew()", &slot_0, QMetaData::Public },
	{ "fileOpen()", &slot_1, QMetaData::Public },
	{ "fileSave()", &slot_2, QMetaData::Public },
	{ "fileSaveAs()", &slot_3, QMetaData::Public },
	{ "filePrint()", &slot_4, QMetaData::Public },
	{ "fileExit()", &slot_5, QMetaData::Public },
	{ "editUndo()", &slot_6, QMetaData::Public },
	{ "editRedo()", &slot_7, QMetaData::Public },
	{ "editCut()", &slot_8, QMetaData::Public },
	{ "editCopy()", &slot_9, QMetaData::Public },
	{ "editPaste()", &slot_10, QMetaData::Public },
	{ "editFind()", &slot_11, QMetaData::Public },
	{ "helpIndex()", &slot_12, QMetaData::Public },
	{ "helpContents()", &slot_13, QMetaData::Public },
	{ "helpAbout()", &slot_14, QMetaData::Public },
	{ "ArpForm()", &slot_15, QMetaData::Public },
	{ "icmp_form()", &slot_16, QMetaData::Public },
	{ "tcp_form()", &slot_17, QMetaData::Public },
	{ "udp_form()", &slot_18, QMetaData::Public },
	{ "smurf_form()", &slot_19, QMetaData::Public },
	{ "syncflood_form()", &slot_20, QMetaData::Public },
	{ "languageChange()", &slot_21, QMetaData::Protected }
    };
    metaObj = QMetaObject::new_metaobject(
	"Main_Form", parentObject,
	slot_tbl, 22,
	0, 0,
#ifndef QT_NO_PROPERTIES
	0, 0,
	0, 0,
#endif // QT_NO_PROPERTIES
	0, 0 );
    cleanUp_Main_Form.setMetaObject( metaObj );
    return metaObj;
}

void* Main_Form::qt_cast( const char* clname )
{
    if ( !qstrcmp( clname, "Main_Form" ) )
	return this;
    return QMainWindow::qt_cast( clname );
}

bool Main_Form::qt_invoke( int _id, QUObject* _o )
{
    switch ( _id - staticMetaObject()->slotOffset() ) {
    case 0: fileNew(); break;
    case 1: fileOpen(); break;
    case 2: fileSave(); break;
    case 3: fileSaveAs(); break;
    case 4: filePrint(); break;
    case 5: fileExit(); break;
    case 6: editUndo(); break;
    case 7: editRedo(); break;
    case 8: editCut(); break;
    case 9: editCopy(); break;
    case 10: editPaste(); break;
    case 11: editFind(); break;
    case 12: helpIndex(); break;
    case 13: helpContents(); break;
    case 14: helpAbout(); break;
    case 15: ArpForm(); break;
    case 16: icmp_form(); break;
    case 17: tcp_form(); break;
    case 18: udp_form(); break;
    case 19: smurf_form(); break;
    case 20: syncflood_form(); break;
    case 21: languageChange(); break;
    default:
	return QMainWindow::qt_invoke( _id, _o );
    }
    return TRUE;
}

bool Main_Form::qt_emit( int _id, QUObject* _o )
{
    return QMainWindow::qt_emit(_id,_o);
}
#ifndef QT_NO_PROPERTIES

bool Main_Form::qt_property( int id, int f, QVariant* v)
{
    return QMainWindow::qt_property( id, f, v);
}

bool Main_Form::qt_static_property( QObject* , int , int , QVariant* ){ return FALSE; }
#endif // QT_NO_PROPERTIES
