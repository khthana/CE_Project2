/****************************************************************************
** configureForm meta object code from reading C++ file 'configureform.h'
**
** Created: Mon Jan 10 10:42:25 2005
**      by: The Qt MOC ($Id: qt/moc_yacc.cpp   3.3.3   edited Aug 5 16:40 $)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#undef QT_NO_COMPAT
#include "../.ui/configureform.h"
#include <qmetaobject.h>
#include <qapplication.h>

#include <private/qucomextra_p.h>
#if !defined(Q_MOC_OUTPUT_REVISION) || (Q_MOC_OUTPUT_REVISION != 26)
#error "This file was generated using the moc from 3.3.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

const char *configureForm::className() const
{
    return "configureForm";
}

QMetaObject *configureForm::metaObj = 0;
static QMetaObjectCleanUp cleanUp_configureForm( "configureForm", &configureForm::staticMetaObject );

#ifndef QT_NO_TRANSLATION
QString configureForm::tr( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "configureForm", s, c, QApplication::DefaultCodec );
    else
	return QString::fromLatin1( s );
}
#ifndef QT_NO_TRANSLATION_UTF8
QString configureForm::trUtf8( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "configureForm", s, c, QApplication::UnicodeUTF8 );
    else
	return QString::fromUtf8( s );
}
#endif // QT_NO_TRANSLATION_UTF8

#endif // QT_NO_TRANSLATION

QMetaObject* configureForm::staticMetaObject()
{
    if ( metaObj )
	return metaObj;
    QMetaObject* parentObject = QMainWindow::staticMetaObject();
    static const QUMethod slot_0 = {"fileExit", 0, 0 };
    static const QUMethod slot_1 = {"fileNew", 0, 0 };
    static const QUMethod slot_2 = {"fileOpen", 0, 0 };
    static const QUParameter param_slot_3[] = {
	{ "fileName", &static_QUType_QString, 0, QUParameter::In }
    };
    static const QUMethod slot_3 = {"load", 1, param_slot_3 };
    static const QUMethod slot_4 = {"fileSave", 0, 0 };
    static const QUMethod slot_5 = {"fileSaveAs", 0, 0 };
    static const QUParameter param_slot_6[] = {
	{ "align", &static_QUType_ptr, "QAction", QUParameter::In }
    };
    static const QUMethod slot_6 = {"changeAlignment", 1, param_slot_6 };
    static const QUParameter param_slot_7[] = {
	{ 0, &static_QUType_int, 0, QUParameter::Out },
	{ "action", &static_QUType_QString, 0, QUParameter::In }
    };
    static const QUMethod slot_7 = {"saveAndContinue", 2, param_slot_7 };
    static const QUMethod slot_8 = {"languageChange", 0, 0 };
    static const QMetaData slot_tbl[] = {
	{ "fileExit()", &slot_0, QMetaData::Public },
	{ "fileNew()", &slot_1, QMetaData::Public },
	{ "fileOpen()", &slot_2, QMetaData::Public },
	{ "load(const QString&)", &slot_3, QMetaData::Public },
	{ "fileSave()", &slot_4, QMetaData::Public },
	{ "fileSaveAs()", &slot_5, QMetaData::Public },
	{ "changeAlignment(QAction*)", &slot_6, QMetaData::Public },
	{ "saveAndContinue(const QString&)", &slot_7, QMetaData::Public },
	{ "languageChange()", &slot_8, QMetaData::Protected }
    };
    metaObj = QMetaObject::new_metaobject(
	"configureForm", parentObject,
	slot_tbl, 9,
	0, 0,
#ifndef QT_NO_PROPERTIES
	0, 0,
	0, 0,
#endif // QT_NO_PROPERTIES
	0, 0 );
    cleanUp_configureForm.setMetaObject( metaObj );
    return metaObj;
}

void* configureForm::qt_cast( const char* clname )
{
    if ( !qstrcmp( clname, "configureForm" ) )
	return this;
    return QMainWindow::qt_cast( clname );
}

bool configureForm::qt_invoke( int _id, QUObject* _o )
{
    switch ( _id - staticMetaObject()->slotOffset() ) {
    case 0: fileExit(); break;
    case 1: fileNew(); break;
    case 2: fileOpen(); break;
    case 3: load((const QString&)static_QUType_QString.get(_o+1)); break;
    case 4: fileSave(); break;
    case 5: fileSaveAs(); break;
    case 6: changeAlignment((QAction*)static_QUType_ptr.get(_o+1)); break;
    case 7: static_QUType_int.set(_o,saveAndContinue((const QString&)static_QUType_QString.get(_o+1))); break;
    case 8: languageChange(); break;
    default:
	return QMainWindow::qt_invoke( _id, _o );
    }
    return TRUE;
}

bool configureForm::qt_emit( int _id, QUObject* _o )
{
    return QMainWindow::qt_emit(_id,_o);
}
#ifndef QT_NO_PROPERTIES

bool configureForm::qt_property( int id, int f, QVariant* v)
{
    return QMainWindow::qt_property( id, f, v);
}

bool configureForm::qt_static_property( QObject* , int , int , QVariant* ){ return FALSE; }
#endif // QT_NO_PROPERTIES
