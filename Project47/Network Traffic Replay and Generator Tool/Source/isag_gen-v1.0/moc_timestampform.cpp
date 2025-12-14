/****************************************************************************
** timestampForm meta object code from reading C++ file 'timestampform.h'
**
** Created: Thu Jan 27 19:35:59 2005
**      by: The Qt MOC ($Id: qt/moc_yacc.cpp   3.3.2   edited Apr 19 11:34 $)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#undef QT_NO_COMPAT
#include "timestampform.h"
#include <qmetaobject.h>
#include <qapplication.h>

#include <private/qucomextra_p.h>
#if !defined(Q_MOC_OUTPUT_REVISION) || (Q_MOC_OUTPUT_REVISION != 26)
#error "This file was generated using the moc from 3.3.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

const char *timestampForm::className() const
{
    return "timestampForm";
}

QMetaObject *timestampForm::metaObj = 0;
static QMetaObjectCleanUp cleanUp_timestampForm( "timestampForm", &timestampForm::staticMetaObject );

#ifndef QT_NO_TRANSLATION
QString timestampForm::tr( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "timestampForm", s, c, QApplication::DefaultCodec );
    else
	return QString::fromLatin1( s );
}
#ifndef QT_NO_TRANSLATION_UTF8
QString timestampForm::trUtf8( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "timestampForm", s, c, QApplication::UnicodeUTF8 );
    else
	return QString::fromUtf8( s );
}
#endif // QT_NO_TRANSLATION_UTF8

#endif // QT_NO_TRANSLATION

QMetaObject* timestampForm::staticMetaObject()
{
    if ( metaObj )
	return metaObj;
    QMetaObject* parentObject = QDialog::staticMetaObject();
    static const QUMethod slot_0 = {"GenerateTimeStamp", 0, 0 };
    static const QUMethod slot_1 = {"progresstimestamp", 0, 0 };
    static const QUMethod slot_2 = {"languageChange", 0, 0 };
    static const QMetaData slot_tbl[] = {
	{ "GenerateTimeStamp()", &slot_0, QMetaData::Public },
	{ "progresstimestamp()", &slot_1, QMetaData::Public },
	{ "languageChange()", &slot_2, QMetaData::Protected }
    };
    metaObj = QMetaObject::new_metaobject(
	"timestampForm", parentObject,
	slot_tbl, 3,
	0, 0,
#ifndef QT_NO_PROPERTIES
	0, 0,
	0, 0,
#endif // QT_NO_PROPERTIES
	0, 0 );
    cleanUp_timestampForm.setMetaObject( metaObj );
    return metaObj;
}

void* timestampForm::qt_cast( const char* clname )
{
    if ( !qstrcmp( clname, "timestampForm" ) )
	return this;
    return QDialog::qt_cast( clname );
}

bool timestampForm::qt_invoke( int _id, QUObject* _o )
{
    switch ( _id - staticMetaObject()->slotOffset() ) {
    case 0: GenerateTimeStamp(); break;
    case 1: progresstimestamp(); break;
    case 2: languageChange(); break;
    default:
	return QDialog::qt_invoke( _id, _o );
    }
    return TRUE;
}

bool timestampForm::qt_emit( int _id, QUObject* _o )
{
    return QDialog::qt_emit(_id,_o);
}
#ifndef QT_NO_PROPERTIES

bool timestampForm::qt_property( int id, int f, QVariant* v)
{
    return QDialog::qt_property( id, f, v);
}

bool timestampForm::qt_static_property( QObject* , int , int , QVariant* ){ return FALSE; }
#endif // QT_NO_PROPERTIES
