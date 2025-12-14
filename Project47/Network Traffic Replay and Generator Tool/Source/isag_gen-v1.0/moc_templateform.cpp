/****************************************************************************
** templateForm meta object code from reading C++ file 'templateform.h'
**
** Created: Wed Jan 26 14:01:47 2005
**      by: The Qt MOC ($Id: qt/moc_yacc.cpp   3.3.2   edited Apr 19 11:34 $)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#undef QT_NO_COMPAT
#include "templateform.h"
#include <qmetaobject.h>
#include <qapplication.h>

#include <private/qucomextra_p.h>
#if !defined(Q_MOC_OUTPUT_REVISION) || (Q_MOC_OUTPUT_REVISION != 26)
#error "This file was generated using the moc from 3.3.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

const char *templateForm::className() const
{
    return "templateForm";
}

QMetaObject *templateForm::metaObj = 0;
static QMetaObjectCleanUp cleanUp_templateForm( "templateForm", &templateForm::staticMetaObject );

#ifndef QT_NO_TRANSLATION
QString templateForm::tr( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "templateForm", s, c, QApplication::DefaultCodec );
    else
	return QString::fromLatin1( s );
}
#ifndef QT_NO_TRANSLATION_UTF8
QString templateForm::trUtf8( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "templateForm", s, c, QApplication::UnicodeUTF8 );
    else
	return QString::fromUtf8( s );
}
#endif // QT_NO_TRANSLATION_UTF8

#endif // QT_NO_TRANSLATION

QMetaObject* templateForm::staticMetaObject()
{
    if ( metaObj )
	return metaObj;
    QMetaObject* parentObject = QDialog::staticMetaObject();
    static const QUMethod slot_0 = {"ArpFunc", 0, 0 };
    static const QUMethod slot_1 = {"tcpFunc", 0, 0 };
    static const QUMethod slot_2 = {"udpFunc", 0, 0 };
    static const QUMethod slot_3 = {"syncfloodFunc", 0, 0 };
    static const QUMethod slot_4 = {"smurfFunc", 0, 0 };
    static const QUMethod slot_5 = {"icmpFunc", 0, 0 };
    static const QUMethod slot_6 = {"languageChange", 0, 0 };
    static const QMetaData slot_tbl[] = {
	{ "ArpFunc()", &slot_0, QMetaData::Public },
	{ "tcpFunc()", &slot_1, QMetaData::Public },
	{ "udpFunc()", &slot_2, QMetaData::Public },
	{ "syncfloodFunc()", &slot_3, QMetaData::Public },
	{ "smurfFunc()", &slot_4, QMetaData::Public },
	{ "icmpFunc()", &slot_5, QMetaData::Public },
	{ "languageChange()", &slot_6, QMetaData::Protected }
    };
    metaObj = QMetaObject::new_metaobject(
	"templateForm", parentObject,
	slot_tbl, 7,
	0, 0,
#ifndef QT_NO_PROPERTIES
	0, 0,
	0, 0,
#endif // QT_NO_PROPERTIES
	0, 0 );
    cleanUp_templateForm.setMetaObject( metaObj );
    return metaObj;
}

void* templateForm::qt_cast( const char* clname )
{
    if ( !qstrcmp( clname, "templateForm" ) )
	return this;
    return QDialog::qt_cast( clname );
}

bool templateForm::qt_invoke( int _id, QUObject* _o )
{
    switch ( _id - staticMetaObject()->slotOffset() ) {
    case 0: ArpFunc(); break;
    case 1: tcpFunc(); break;
    case 2: udpFunc(); break;
    case 3: syncfloodFunc(); break;
    case 4: smurfFunc(); break;
    case 5: icmpFunc(); break;
    case 6: languageChange(); break;
    default:
	return QDialog::qt_invoke( _id, _o );
    }
    return TRUE;
}

bool templateForm::qt_emit( int _id, QUObject* _o )
{
    return QDialog::qt_emit(_id,_o);
}
#ifndef QT_NO_PROPERTIES

bool templateForm::qt_property( int id, int f, QVariant* v)
{
    return QDialog::qt_property( id, f, v);
}

bool templateForm::qt_static_property( QObject* , int , int , QVariant* ){ return FALSE; }
#endif // QT_NO_PROPERTIES
