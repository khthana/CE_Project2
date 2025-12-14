/****************************************************************************
** ErrorMsg meta object code from reading C++ file 'ErrorMsg.h'
**
** Created: Tue Jan 3 14:39:52 2006
**      by: The Qt MOC ($Id: qt/moc_yacc.cpp   3.3.4   edited Jan 21 18:14 $)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#undef QT_NO_COMPAT
#include "../.ui/ErrorMsg.h"
#include <qmetaobject.h>
#include <qapplication.h>

#include <private/qucomextra_p.h>
#if !defined(Q_MOC_OUTPUT_REVISION) || (Q_MOC_OUTPUT_REVISION != 26)
#error "This file was generated using the moc from 3.3.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

const char *ErrorMsg::className() const
{
    return "ErrorMsg";
}

QMetaObject *ErrorMsg::metaObj = 0;
static QMetaObjectCleanUp cleanUp_ErrorMsg( "ErrorMsg", &ErrorMsg::staticMetaObject );

#ifndef QT_NO_TRANSLATION
QString ErrorMsg::tr( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "ErrorMsg", s, c, QApplication::DefaultCodec );
    else
	return QString::fromLatin1( s );
}
#ifndef QT_NO_TRANSLATION_UTF8
QString ErrorMsg::trUtf8( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "ErrorMsg", s, c, QApplication::UnicodeUTF8 );
    else
	return QString::fromUtf8( s );
}
#endif // QT_NO_TRANSLATION_UTF8

#endif // QT_NO_TRANSLATION

QMetaObject* ErrorMsg::staticMetaObject()
{
    if ( metaObj )
	return metaObj;
    QMetaObject* parentObject = QDialog::staticMetaObject();
    static const QUMethod slot_0 = {"languageChange", 0, 0 };
    static const QMetaData slot_tbl[] = {
	{ "languageChange()", &slot_0, QMetaData::Protected }
    };
    metaObj = QMetaObject::new_metaobject(
	"ErrorMsg", parentObject,
	slot_tbl, 1,
	0, 0,
#ifndef QT_NO_PROPERTIES
	0, 0,
	0, 0,
#endif // QT_NO_PROPERTIES
	0, 0 );
    cleanUp_ErrorMsg.setMetaObject( metaObj );
    return metaObj;
}

void* ErrorMsg::qt_cast( const char* clname )
{
    if ( !qstrcmp( clname, "ErrorMsg" ) )
	return this;
    return QDialog::qt_cast( clname );
}

bool ErrorMsg::qt_invoke( int _id, QUObject* _o )
{
    switch ( _id - staticMetaObject()->slotOffset() ) {
    case 0: languageChange(); break;
    default:
	return QDialog::qt_invoke( _id, _o );
    }
    return TRUE;
}

bool ErrorMsg::qt_emit( int _id, QUObject* _o )
{
    return QDialog::qt_emit(_id,_o);
}
#ifndef QT_NO_PROPERTIES

bool ErrorMsg::qt_property( int id, int f, QVariant* v)
{
    return QDialog::qt_property( id, f, v);
}

bool ErrorMsg::qt_static_property( QObject* , int , int , QVariant* ){ return FALSE; }
#endif // QT_NO_PROPERTIES
