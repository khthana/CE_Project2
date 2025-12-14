/****************************************************************************
** icmpEchoReqForm meta object code from reading C++ file 'icmpform.h'
**
** Created: Fri Nov 19 10:05:59 2004
**      by: The Qt MOC ($Id: qt/moc_yacc.cpp   3.3.3   edited Aug 5 16:40 $)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#undef QT_NO_COMPAT
#include "../.ui/icmpform.h"
#include <qmetaobject.h>
#include <qapplication.h>

#include <private/qucomextra_p.h>
#if !defined(Q_MOC_OUTPUT_REVISION) || (Q_MOC_OUTPUT_REVISION != 26)
#error "This file was generated using the moc from 3.3.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

const char *icmpEchoReqForm::className() const
{
    return "icmpEchoReqForm";
}

QMetaObject *icmpEchoReqForm::metaObj = 0;
static QMetaObjectCleanUp cleanUp_icmpEchoReqForm( "icmpEchoReqForm", &icmpEchoReqForm::staticMetaObject );

#ifndef QT_NO_TRANSLATION
QString icmpEchoReqForm::tr( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "icmpEchoReqForm", s, c, QApplication::DefaultCodec );
    else
	return QString::fromLatin1( s );
}
#ifndef QT_NO_TRANSLATION_UTF8
QString icmpEchoReqForm::trUtf8( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "icmpEchoReqForm", s, c, QApplication::UnicodeUTF8 );
    else
	return QString::fromUtf8( s );
}
#endif // QT_NO_TRANSLATION_UTF8

#endif // QT_NO_TRANSLATION

QMetaObject* icmpEchoReqForm::staticMetaObject()
{
    if ( metaObj )
	return metaObj;
    QMetaObject* parentObject = QDialog::staticMetaObject();
    static const QUMethod slot_0 = {"GenerateICMP", 0, 0 };
    static const QUMethod slot_1 = {"languageChange", 0, 0 };
    static const QMetaData slot_tbl[] = {
	{ "GenerateICMP()", &slot_0, QMetaData::Public },
	{ "languageChange()", &slot_1, QMetaData::Protected }
    };
    metaObj = QMetaObject::new_metaobject(
	"icmpEchoReqForm", parentObject,
	slot_tbl, 2,
	0, 0,
#ifndef QT_NO_PROPERTIES
	0, 0,
	0, 0,
#endif // QT_NO_PROPERTIES
	0, 0 );
    cleanUp_icmpEchoReqForm.setMetaObject( metaObj );
    return metaObj;
}

void* icmpEchoReqForm::qt_cast( const char* clname )
{
    if ( !qstrcmp( clname, "icmpEchoReqForm" ) )
	return this;
    return QDialog::qt_cast( clname );
}

bool icmpEchoReqForm::qt_invoke( int _id, QUObject* _o )
{
    switch ( _id - staticMetaObject()->slotOffset() ) {
    case 0: GenerateICMP(); break;
    case 1: languageChange(); break;
    default:
	return QDialog::qt_invoke( _id, _o );
    }
    return TRUE;
}

bool icmpEchoReqForm::qt_emit( int _id, QUObject* _o )
{
    return QDialog::qt_emit(_id,_o);
}
#ifndef QT_NO_PROPERTIES

bool icmpEchoReqForm::qt_property( int id, int f, QVariant* v)
{
    return QDialog::qt_property( id, f, v);
}

bool icmpEchoReqForm::qt_static_property( QObject* , int , int , QVariant* ){ return FALSE; }
#endif // QT_NO_PROPERTIES
