/****************************************************************************
** ARP_Form meta object code from reading C++ file 'arp_form.h'
**
** Created: Thu Jan 27 19:35:42 2005
**      by: The Qt MOC ($Id: qt/moc_yacc.cpp   3.3.2   edited Apr 19 11:34 $)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#undef QT_NO_COMPAT
#include "arp_form.h"
#include <qmetaobject.h>
#include <qapplication.h>

#include <private/qucomextra_p.h>
#if !defined(Q_MOC_OUTPUT_REVISION) || (Q_MOC_OUTPUT_REVISION != 26)
#error "This file was generated using the moc from 3.3.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

const char *ARP_Form::className() const
{
    return "ARP_Form";
}

QMetaObject *ARP_Form::metaObj = 0;
static QMetaObjectCleanUp cleanUp_ARP_Form( "ARP_Form", &ARP_Form::staticMetaObject );

#ifndef QT_NO_TRANSLATION
QString ARP_Form::tr( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "ARP_Form", s, c, QApplication::DefaultCodec );
    else
	return QString::fromLatin1( s );
}
#ifndef QT_NO_TRANSLATION_UTF8
QString ARP_Form::trUtf8( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "ARP_Form", s, c, QApplication::UnicodeUTF8 );
    else
	return QString::fromUtf8( s );
}
#endif // QT_NO_TRANSLATION_UTF8

#endif // QT_NO_TRANSLATION

QMetaObject* ARP_Form::staticMetaObject()
{
    if ( metaObj )
	return metaObj;
    QMetaObject* parentObject = QDialog::staticMetaObject();
    static const QUMethod slot_0 = {"set_value", 0, 0 };
    static const QUMethod slot_1 = {"ProgressArp", 0, 0 };
    static const QUMethod slot_2 = {"languageChange", 0, 0 };
    static const QMetaData slot_tbl[] = {
	{ "set_value()", &slot_0, QMetaData::Public },
	{ "ProgressArp()", &slot_1, QMetaData::Public },
	{ "languageChange()", &slot_2, QMetaData::Protected }
    };
    metaObj = QMetaObject::new_metaobject(
	"ARP_Form", parentObject,
	slot_tbl, 3,
	0, 0,
#ifndef QT_NO_PROPERTIES
	0, 0,
	0, 0,
#endif // QT_NO_PROPERTIES
	0, 0 );
    cleanUp_ARP_Form.setMetaObject( metaObj );
    return metaObj;
}

void* ARP_Form::qt_cast( const char* clname )
{
    if ( !qstrcmp( clname, "ARP_Form" ) )
	return this;
    return QDialog::qt_cast( clname );
}

bool ARP_Form::qt_invoke( int _id, QUObject* _o )
{
    switch ( _id - staticMetaObject()->slotOffset() ) {
    case 0: set_value(); break;
    case 1: ProgressArp(); break;
    case 2: languageChange(); break;
    default:
	return QDialog::qt_invoke( _id, _o );
    }
    return TRUE;
}

bool ARP_Form::qt_emit( int _id, QUObject* _o )
{
    return QDialog::qt_emit(_id,_o);
}
#ifndef QT_NO_PROPERTIES

bool ARP_Form::qt_property( int id, int f, QVariant* v)
{
    return QDialog::qt_property( id, f, v);
}

bool ARP_Form::qt_static_property( QObject* , int , int , QVariant* ){ return FALSE; }
#endif // QT_NO_PROPERTIES
