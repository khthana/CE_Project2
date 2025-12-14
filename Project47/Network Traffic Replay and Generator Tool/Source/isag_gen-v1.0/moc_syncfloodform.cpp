/****************************************************************************
** syncfloodForm meta object code from reading C++ file 'syncfloodform.h'
**
** Created: Thu Jan 27 19:35:54 2005
**      by: The Qt MOC ($Id: qt/moc_yacc.cpp   3.3.2   edited Apr 19 11:34 $)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#undef QT_NO_COMPAT
#include "syncfloodform.h"
#include <qmetaobject.h>
#include <qapplication.h>

#include <private/qucomextra_p.h>
#if !defined(Q_MOC_OUTPUT_REVISION) || (Q_MOC_OUTPUT_REVISION != 26)
#error "This file was generated using the moc from 3.3.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

const char *syncfloodForm::className() const
{
    return "syncfloodForm";
}

QMetaObject *syncfloodForm::metaObj = 0;
static QMetaObjectCleanUp cleanUp_syncfloodForm( "syncfloodForm", &syncfloodForm::staticMetaObject );

#ifndef QT_NO_TRANSLATION
QString syncfloodForm::tr( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "syncfloodForm", s, c, QApplication::DefaultCodec );
    else
	return QString::fromLatin1( s );
}
#ifndef QT_NO_TRANSLATION_UTF8
QString syncfloodForm::trUtf8( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "syncfloodForm", s, c, QApplication::UnicodeUTF8 );
    else
	return QString::fromUtf8( s );
}
#endif // QT_NO_TRANSLATION_UTF8

#endif // QT_NO_TRANSLATION

QMetaObject* syncfloodForm::staticMetaObject()
{
    if ( metaObj )
	return metaObj;
    QMetaObject* parentObject = QDialog::staticMetaObject();
    static const QUMethod slot_0 = {"GenerateSyncflood", 0, 0 };
    static const QUMethod slot_1 = {"progresssyn", 0, 0 };
    static const QUMethod slot_2 = {"languageChange", 0, 0 };
    static const QMetaData slot_tbl[] = {
	{ "GenerateSyncflood()", &slot_0, QMetaData::Public },
	{ "progresssyn()", &slot_1, QMetaData::Public },
	{ "languageChange()", &slot_2, QMetaData::Protected }
    };
    metaObj = QMetaObject::new_metaobject(
	"syncfloodForm", parentObject,
	slot_tbl, 3,
	0, 0,
#ifndef QT_NO_PROPERTIES
	0, 0,
	0, 0,
#endif // QT_NO_PROPERTIES
	0, 0 );
    cleanUp_syncfloodForm.setMetaObject( metaObj );
    return metaObj;
}

void* syncfloodForm::qt_cast( const char* clname )
{
    if ( !qstrcmp( clname, "syncfloodForm" ) )
	return this;
    return QDialog::qt_cast( clname );
}

bool syncfloodForm::qt_invoke( int _id, QUObject* _o )
{
    switch ( _id - staticMetaObject()->slotOffset() ) {
    case 0: GenerateSyncflood(); break;
    case 1: progresssyn(); break;
    case 2: languageChange(); break;
    default:
	return QDialog::qt_invoke( _id, _o );
    }
    return TRUE;
}

bool syncfloodForm::qt_emit( int _id, QUObject* _o )
{
    return QDialog::qt_emit(_id,_o);
}
#ifndef QT_NO_PROPERTIES

bool syncfloodForm::qt_property( int id, int f, QVariant* v)
{
    return QDialog::qt_property( id, f, v);
}

bool syncfloodForm::qt_static_property( QObject* , int , int , QVariant* ){ return FALSE; }
#endif // QT_NO_PROPERTIES
