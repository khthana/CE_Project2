/****************************************************************************
** unreachForm meta object code from reading C++ file 'unreachform.h'
**
** Created: Thu Jan 27 19:36:01 2005
**      by: The Qt MOC ($Id: qt/moc_yacc.cpp   3.3.2   edited Apr 19 11:34 $)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#undef QT_NO_COMPAT
#include "unreachform.h"
#include <qmetaobject.h>
#include <qapplication.h>

#include <private/qucomextra_p.h>
#if !defined(Q_MOC_OUTPUT_REVISION) || (Q_MOC_OUTPUT_REVISION != 26)
#error "This file was generated using the moc from 3.3.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

const char *unreachForm::className() const
{
    return "unreachForm";
}

QMetaObject *unreachForm::metaObj = 0;
static QMetaObjectCleanUp cleanUp_unreachForm( "unreachForm", &unreachForm::staticMetaObject );

#ifndef QT_NO_TRANSLATION
QString unreachForm::tr( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "unreachForm", s, c, QApplication::DefaultCodec );
    else
	return QString::fromLatin1( s );
}
#ifndef QT_NO_TRANSLATION_UTF8
QString unreachForm::trUtf8( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "unreachForm", s, c, QApplication::UnicodeUTF8 );
    else
	return QString::fromUtf8( s );
}
#endif // QT_NO_TRANSLATION_UTF8

#endif // QT_NO_TRANSLATION

QMetaObject* unreachForm::staticMetaObject()
{
    if ( metaObj )
	return metaObj;
    QMetaObject* parentObject = QDialog::staticMetaObject();
    static const QUMethod slot_0 = {"GenerateUnreach", 0, 0 };
    static const QUMethod slot_1 = {"ChangeMode", 0, 0 };
    static const QUMethod slot_2 = {"progressun", 0, 0 };
    static const QUMethod slot_3 = {"languageChange", 0, 0 };
    static const QMetaData slot_tbl[] = {
	{ "GenerateUnreach()", &slot_0, QMetaData::Public },
	{ "ChangeMode()", &slot_1, QMetaData::Public },
	{ "progressun()", &slot_2, QMetaData::Public },
	{ "languageChange()", &slot_3, QMetaData::Protected }
    };
    metaObj = QMetaObject::new_metaobject(
	"unreachForm", parentObject,
	slot_tbl, 4,
	0, 0,
#ifndef QT_NO_PROPERTIES
	0, 0,
	0, 0,
#endif // QT_NO_PROPERTIES
	0, 0 );
    cleanUp_unreachForm.setMetaObject( metaObj );
    return metaObj;
}

void* unreachForm::qt_cast( const char* clname )
{
    if ( !qstrcmp( clname, "unreachForm" ) )
	return this;
    return QDialog::qt_cast( clname );
}

bool unreachForm::qt_invoke( int _id, QUObject* _o )
{
    switch ( _id - staticMetaObject()->slotOffset() ) {
    case 0: GenerateUnreach(); break;
    case 1: ChangeMode(); break;
    case 2: progressun(); break;
    case 3: languageChange(); break;
    default:
	return QDialog::qt_invoke( _id, _o );
    }
    return TRUE;
}

bool unreachForm::qt_emit( int _id, QUObject* _o )
{
    return QDialog::qt_emit(_id,_o);
}
#ifndef QT_NO_PROPERTIES

bool unreachForm::qt_property( int id, int f, QVariant* v)
{
    return QDialog::qt_property( id, f, v);
}

bool unreachForm::qt_static_property( QObject* , int , int , QVariant* ){ return FALSE; }
#endif // QT_NO_PROPERTIES
