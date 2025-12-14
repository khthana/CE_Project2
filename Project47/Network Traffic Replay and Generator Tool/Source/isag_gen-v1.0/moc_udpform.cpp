/****************************************************************************
** udpForm meta object code from reading C++ file 'udpform.h'
**
** Created: Thu Jan 27 19:39:53 2005
**      by: The Qt MOC ($Id: qt/moc_yacc.cpp   3.3.2   edited Apr 19 11:34 $)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#undef QT_NO_COMPAT
#include "udpform.h"
#include <qmetaobject.h>
#include <qapplication.h>

#include <private/qucomextra_p.h>
#if !defined(Q_MOC_OUTPUT_REVISION) || (Q_MOC_OUTPUT_REVISION != 26)
#error "This file was generated using the moc from 3.3.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

const char *udpForm::className() const
{
    return "udpForm";
}

QMetaObject *udpForm::metaObj = 0;
static QMetaObjectCleanUp cleanUp_udpForm( "udpForm", &udpForm::staticMetaObject );

#ifndef QT_NO_TRANSLATION
QString udpForm::tr( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "udpForm", s, c, QApplication::DefaultCodec );
    else
	return QString::fromLatin1( s );
}
#ifndef QT_NO_TRANSLATION_UTF8
QString udpForm::trUtf8( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "udpForm", s, c, QApplication::UnicodeUTF8 );
    else
	return QString::fromUtf8( s );
}
#endif // QT_NO_TRANSLATION_UTF8

#endif // QT_NO_TRANSLATION

QMetaObject* udpForm::staticMetaObject()
{
    if ( metaObj )
	return metaObj;
    QMetaObject* parentObject = QDialog::staticMetaObject();
    static const QUMethod slot_0 = {"GenerateUDP", 0, 0 };
    static const QUMethod slot_1 = {"progressudp", 0, 0 };
    static const QUMethod slot_2 = {"languageChange", 0, 0 };
    static const QMetaData slot_tbl[] = {
	{ "GenerateUDP()", &slot_0, QMetaData::Public },
	{ "progressudp()", &slot_1, QMetaData::Public },
	{ "languageChange()", &slot_2, QMetaData::Protected }
    };
    metaObj = QMetaObject::new_metaobject(
	"udpForm", parentObject,
	slot_tbl, 3,
	0, 0,
#ifndef QT_NO_PROPERTIES
	0, 0,
	0, 0,
#endif // QT_NO_PROPERTIES
	0, 0 );
    cleanUp_udpForm.setMetaObject( metaObj );
    return metaObj;
}

void* udpForm::qt_cast( const char* clname )
{
    if ( !qstrcmp( clname, "udpForm" ) )
	return this;
    return QDialog::qt_cast( clname );
}

bool udpForm::qt_invoke( int _id, QUObject* _o )
{
    switch ( _id - staticMetaObject()->slotOffset() ) {
    case 0: GenerateUDP(); break;
    case 1: progressudp(); break;
    case 2: languageChange(); break;
    default:
	return QDialog::qt_invoke( _id, _o );
    }
    return TRUE;
}

bool udpForm::qt_emit( int _id, QUObject* _o )
{
    return QDialog::qt_emit(_id,_o);
}
#ifndef QT_NO_PROPERTIES

bool udpForm::qt_property( int id, int f, QVariant* v)
{
    return QDialog::qt_property( id, f, v);
}

bool udpForm::qt_static_property( QObject* , int , int , QVariant* ){ return FALSE; }
#endif // QT_NO_PROPERTIES
