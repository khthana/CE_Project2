/****************************************************************************
** processForm meta object code from reading C++ file 'processform.h'
**
** Created: Sat Jan 29 21:53:12 2005
**      by: The Qt MOC ($Id: qt/moc_yacc.cpp   3.3.2   edited Apr 19 11:34 $)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#undef QT_NO_COMPAT
#include "../.ui/processform.h"
#include <qmetaobject.h>
#include <qapplication.h>

#include <private/qucomextra_p.h>
#if !defined(Q_MOC_OUTPUT_REVISION) || (Q_MOC_OUTPUT_REVISION != 26)
#error "This file was generated using the moc from 3.3.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

const char *processForm::className() const
{
    return "processForm";
}

QMetaObject *processForm::metaObj = 0;
static QMetaObjectCleanUp cleanUp_processForm( "processForm", &processForm::staticMetaObject );

#ifndef QT_NO_TRANSLATION
QString processForm::tr( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "processForm", s, c, QApplication::DefaultCodec );
    else
	return QString::fromLatin1( s );
}
#ifndef QT_NO_TRANSLATION_UTF8
QString processForm::trUtf8( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "processForm", s, c, QApplication::UnicodeUTF8 );
    else
	return QString::fromUtf8( s );
}
#endif // QT_NO_TRANSLATION_UTF8

#endif // QT_NO_TRANSLATION

QMetaObject* processForm::staticMetaObject()
{
    if ( metaObj )
	return metaObj;
    QMetaObject* parentObject = QDialog::staticMetaObject();
    static const QUParameter param_slot_0[] = {
	{ "str", &static_QUType_charstar, 0, QUParameter::In }
    };
    static const QUMethod slot_0 = {"Process", 1, param_slot_0 };
    static const QUMethod slot_1 = {"stopProcess", 0, 0 };
    static const QUParameter param_slot_2[] = {
	{ "s", &static_QUType_charstar, 0, QUParameter::In }
    };
    static const QUMethod slot_2 = {"setDisplayText", 1, param_slot_2 };
    static const QUMethod slot_3 = {"languageChange", 0, 0 };
    static const QMetaData slot_tbl[] = {
	{ "Process(char*)", &slot_0, QMetaData::Public },
	{ "stopProcess()", &slot_1, QMetaData::Public },
	{ "setDisplayText(char*)", &slot_2, QMetaData::Public },
	{ "languageChange()", &slot_3, QMetaData::Protected }
    };
    metaObj = QMetaObject::new_metaobject(
	"processForm", parentObject,
	slot_tbl, 4,
	0, 0,
#ifndef QT_NO_PROPERTIES
	0, 0,
	0, 0,
#endif // QT_NO_PROPERTIES
	0, 0 );
    cleanUp_processForm.setMetaObject( metaObj );
    return metaObj;
}

void* processForm::qt_cast( const char* clname )
{
    if ( !qstrcmp( clname, "processForm" ) )
	return this;
    return QDialog::qt_cast( clname );
}

bool processForm::qt_invoke( int _id, QUObject* _o )
{
    switch ( _id - staticMetaObject()->slotOffset() ) {
    case 0: Process((char*)static_QUType_charstar.get(_o+1)); break;
    case 1: stopProcess(); break;
    case 2: setDisplayText((char*)static_QUType_charstar.get(_o+1)); break;
    case 3: languageChange(); break;
    default:
	return QDialog::qt_invoke( _id, _o );
    }
    return TRUE;
}

bool processForm::qt_emit( int _id, QUObject* _o )
{
    return QDialog::qt_emit(_id,_o);
}
#ifndef QT_NO_PROPERTIES

bool processForm::qt_property( int id, int f, QVariant* v)
{
    return QDialog::qt_property( id, f, v);
}

bool processForm::qt_static_property( QObject* , int , int , QVariant* ){ return FALSE; }
#endif // QT_NO_PROPERTIES
