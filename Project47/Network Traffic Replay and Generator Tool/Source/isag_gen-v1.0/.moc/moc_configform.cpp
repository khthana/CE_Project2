/****************************************************************************
** ConfigForm meta object code from reading C++ file 'configForm.h'
**
** Created: Tue Jan 11 18:43:03 2005
**      by: The Qt MOC ($Id: qt/moc_yacc.cpp   3.3.3   edited Aug 5 16:40 $)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#undef QT_NO_COMPAT
#include "../.ui/configForm.h"
#include <qmetaobject.h>
#include <qapplication.h>

#include <private/qucomextra_p.h>
#if !defined(Q_MOC_OUTPUT_REVISION) || (Q_MOC_OUTPUT_REVISION != 26)
#error "This file was generated using the moc from 3.3.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

const char *ConfigForm::className() const
{
    return "ConfigForm";
}

QMetaObject *ConfigForm::metaObj = 0;
static QMetaObjectCleanUp cleanUp_ConfigForm( "ConfigForm", &ConfigForm::staticMetaObject );

#ifndef QT_NO_TRANSLATION
QString ConfigForm::tr( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "ConfigForm", s, c, QApplication::DefaultCodec );
    else
	return QString::fromLatin1( s );
}
#ifndef QT_NO_TRANSLATION_UTF8
QString ConfigForm::trUtf8( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "ConfigForm", s, c, QApplication::UnicodeUTF8 );
    else
	return QString::fromUtf8( s );
}
#endif // QT_NO_TRANSLATION_UTF8

#endif // QT_NO_TRANSLATION

QMetaObject* ConfigForm::staticMetaObject()
{
    if ( metaObj )
	return metaObj;
    QMetaObject* parentObject = QMainWindow::staticMetaObject();
    static const QUMethod slot_0 = {"fileNew", 0, 0 };
    static const QUMethod slot_1 = {"fileOpen", 0, 0 };
    static const QUMethod slot_2 = {"fileOpen2", 0, 0 };
    static const QUParameter param_slot_3[] = {
	{ "fileName", &static_QUType_QString, 0, QUParameter::In }
    };
    static const QUMethod slot_3 = {"load", 1, param_slot_3 };
    static const QUMethod slot_4 = {"fileSave", 0, 0 };
    static const QUMethod slot_5 = {"fileSaveAs", 0, 0 };
    static const QUMethod slot_6 = {"filePrint", 0, 0 };
    static const QUMethod slot_7 = {"fileExit", 0, 0 };
    static const QUMethod slot_8 = {"editUndo", 0, 0 };
    static const QUMethod slot_9 = {"editRedo", 0, 0 };
    static const QUMethod slot_10 = {"editCut", 0, 0 };
    static const QUMethod slot_11 = {"editCopy", 0, 0 };
    static const QUMethod slot_12 = {"editPaste", 0, 0 };
    static const QUMethod slot_13 = {"GenerateConfig", 0, 0 };
    static const QUParameter param_slot_14[] = {
	{ "fileName", &static_QUType_QString, 0, QUParameter::In }
    };
    static const QUMethod slot_14 = {"FileNameSelected", 1, param_slot_14 };
    static const QUMethod slot_15 = {"languageChange", 0, 0 };
    static const QMetaData slot_tbl[] = {
	{ "fileNew()", &slot_0, QMetaData::Public },
	{ "fileOpen()", &slot_1, QMetaData::Public },
	{ "fileOpen2()", &slot_2, QMetaData::Public },
	{ "load(const QString&)", &slot_3, QMetaData::Public },
	{ "fileSave()", &slot_4, QMetaData::Public },
	{ "fileSaveAs()", &slot_5, QMetaData::Public },
	{ "filePrint()", &slot_6, QMetaData::Public },
	{ "fileExit()", &slot_7, QMetaData::Public },
	{ "editUndo()", &slot_8, QMetaData::Public },
	{ "editRedo()", &slot_9, QMetaData::Public },
	{ "editCut()", &slot_10, QMetaData::Public },
	{ "editCopy()", &slot_11, QMetaData::Public },
	{ "editPaste()", &slot_12, QMetaData::Public },
	{ "GenerateConfig()", &slot_13, QMetaData::Public },
	{ "FileNameSelected(const QString&)", &slot_14, QMetaData::Public },
	{ "languageChange()", &slot_15, QMetaData::Protected }
    };
    metaObj = QMetaObject::new_metaobject(
	"ConfigForm", parentObject,
	slot_tbl, 16,
	0, 0,
#ifndef QT_NO_PROPERTIES
	0, 0,
	0, 0,
#endif // QT_NO_PROPERTIES
	0, 0 );
    cleanUp_ConfigForm.setMetaObject( metaObj );
    return metaObj;
}

void* ConfigForm::qt_cast( const char* clname )
{
    if ( !qstrcmp( clname, "ConfigForm" ) )
	return this;
    return QMainWindow::qt_cast( clname );
}

bool ConfigForm::qt_invoke( int _id, QUObject* _o )
{
    switch ( _id - staticMetaObject()->slotOffset() ) {
    case 0: fileNew(); break;
    case 1: fileOpen(); break;
    case 2: fileOpen2(); break;
    case 3: load((const QString&)static_QUType_QString.get(_o+1)); break;
    case 4: fileSave(); break;
    case 5: fileSaveAs(); break;
    case 6: filePrint(); break;
    case 7: fileExit(); break;
    case 8: editUndo(); break;
    case 9: editRedo(); break;
    case 10: editCut(); break;
    case 11: editCopy(); break;
    case 12: editPaste(); break;
    case 13: GenerateConfig(); break;
    case 14: FileNameSelected((const QString&)static_QUType_QString.get(_o+1)); break;
    case 15: languageChange(); break;
    default:
	return QMainWindow::qt_invoke( _id, _o );
    }
    return TRUE;
}

bool ConfigForm::qt_emit( int _id, QUObject* _o )
{
    return QMainWindow::qt_emit(_id,_o);
}
#ifndef QT_NO_PROPERTIES

bool ConfigForm::qt_property( int id, int f, QVariant* v)
{
    return QMainWindow::qt_property( id, f, v);
}

bool ConfigForm::qt_static_property( QObject* , int , int , QVariant* ){ return FALSE; }
#endif // QT_NO_PROPERTIES
