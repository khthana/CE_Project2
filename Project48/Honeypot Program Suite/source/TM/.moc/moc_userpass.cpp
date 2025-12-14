/****************************************************************************
** UserPass meta object code from reading C++ file 'userpass.h'
**
** Created: Tue Jan 31 10:53:20 2006
**      by: The Qt MOC ($Id: qt/moc_yacc.cpp   3.3.5   edited Sep 2 14:41 $)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#undef QT_NO_COMPAT
#include "../.ui/userpass.h"
#include <qmetaobject.h>
#include <qapplication.h>

#include <private/qucomextra_p.h>
#if !defined(Q_MOC_OUTPUT_REVISION) || (Q_MOC_OUTPUT_REVISION != 26)
#error "This file was generated using the moc from 3.3.5. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

const char *UserPass::className() const
{
    return "UserPass";
}

QMetaObject *UserPass::metaObj = 0;
static QMetaObjectCleanUp cleanUp_UserPass( "UserPass", &UserPass::staticMetaObject );

#ifndef QT_NO_TRANSLATION
QString UserPass::tr( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "UserPass", s, c, QApplication::DefaultCodec );
    else
	return QString::fromLatin1( s );
}
#ifndef QT_NO_TRANSLATION_UTF8
QString UserPass::trUtf8( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "UserPass", s, c, QApplication::UnicodeUTF8 );
    else
	return QString::fromUtf8( s );
}
#endif // QT_NO_TRANSLATION_UTF8

#endif // QT_NO_TRANSLATION

QMetaObject* UserPass::staticMetaObject()
{
    if ( metaObj )
	return metaObj;
    QMetaObject* parentObject = QDialog::staticMetaObject();
    static const QUMethod slot_0 = {"dataChange", 0, 0 };
    static const QUMethod slot_1 = {"chkUser", 0, 0 };
    static const QUMethod slot_2 = {"cancelLogin", 0, 0 };
    static const QUMethod slot_3 = {"languageChange", 0, 0 };
    static const QMetaData slot_tbl[] = {
	{ "dataChange()", &slot_0, QMetaData::Public },
	{ "chkUser()", &slot_1, QMetaData::Public },
	{ "cancelLogin()", &slot_2, QMetaData::Public },
	{ "languageChange()", &slot_3, QMetaData::Protected }
    };
    metaObj = QMetaObject::new_metaobject(
	"UserPass", parentObject,
	slot_tbl, 4,
	0, 0,
#ifndef QT_NO_PROPERTIES
	0, 0,
	0, 0,
#endif // QT_NO_PROPERTIES
	0, 0 );
    cleanUp_UserPass.setMetaObject( metaObj );
    return metaObj;
}

void* UserPass::qt_cast( const char* clname )
{
    if ( !qstrcmp( clname, "UserPass" ) )
	return this;
    return QDialog::qt_cast( clname );
}

bool UserPass::qt_invoke( int _id, QUObject* _o )
{
    switch ( _id - staticMetaObject()->slotOffset() ) {
    case 0: dataChange(); break;
    case 1: chkUser(); break;
    case 2: cancelLogin(); break;
    case 3: languageChange(); break;
    default:
	return QDialog::qt_invoke( _id, _o );
    }
    return TRUE;
}

bool UserPass::qt_emit( int _id, QUObject* _o )
{
    return QDialog::qt_emit(_id,_o);
}
#ifndef QT_NO_PROPERTIES

bool UserPass::qt_property( int id, int f, QVariant* v)
{
    return QDialog::qt_property( id, f, v);
}

bool UserPass::qt_static_property( QObject* , int , int , QVariant* ){ return FALSE; }
#endif // QT_NO_PROPERTIES
