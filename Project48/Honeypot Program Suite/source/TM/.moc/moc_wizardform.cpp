/****************************************************************************
** WizardForm meta object code from reading C++ file 'wizardform.h'
**
** Created: Tue Jan 31 12:21:44 2006
**      by: The Qt MOC ($Id: qt/moc_yacc.cpp   3.3.5   edited Sep 2 14:41 $)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#undef QT_NO_COMPAT
#include "../.ui/wizardform.h"
#include <qmetaobject.h>
#include <qapplication.h>

#include <private/qucomextra_p.h>
#if !defined(Q_MOC_OUTPUT_REVISION) || (Q_MOC_OUTPUT_REVISION != 26)
#error "This file was generated using the moc from 3.3.5. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

const char *WizardForm::className() const
{
    return "WizardForm";
}

QMetaObject *WizardForm::metaObj = 0;
static QMetaObjectCleanUp cleanUp_WizardForm( "WizardForm", &WizardForm::staticMetaObject );

#ifndef QT_NO_TRANSLATION
QString WizardForm::tr( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "WizardForm", s, c, QApplication::DefaultCodec );
    else
	return QString::fromLatin1( s );
}
#ifndef QT_NO_TRANSLATION_UTF8
QString WizardForm::trUtf8( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "WizardForm", s, c, QApplication::UnicodeUTF8 );
    else
	return QString::fromUtf8( s );
}
#endif // QT_NO_TRANSLATION_UTF8

#endif // QT_NO_TRANSLATION

QMetaObject* WizardForm::staticMetaObject()
{
    if ( metaObj )
	return metaObj;
    QMetaObject* parentObject = QWizard::staticMetaObject();
    static const QUMethod slot_0 = {"checkInput", 0, 0 };
    static const QUMethod slot_1 = {"saveConfig", 0, 0 };
    static const QUMethod slot_2 = {"datachange", 0, 0 };
    static const QUMethod slot_3 = {"editdb", 0, 0 };
    static const QUMethod slot_4 = {"languageChange", 0, 0 };
    static const QMetaData slot_tbl[] = {
	{ "checkInput()", &slot_0, QMetaData::Public },
	{ "saveConfig()", &slot_1, QMetaData::Public },
	{ "datachange()", &slot_2, QMetaData::Public },
	{ "editdb()", &slot_3, QMetaData::Public },
	{ "languageChange()", &slot_4, QMetaData::Protected }
    };
    metaObj = QMetaObject::new_metaobject(
	"WizardForm", parentObject,
	slot_tbl, 5,
	0, 0,
#ifndef QT_NO_PROPERTIES
	0, 0,
	0, 0,
#endif // QT_NO_PROPERTIES
	0, 0 );
    cleanUp_WizardForm.setMetaObject( metaObj );
    return metaObj;
}

void* WizardForm::qt_cast( const char* clname )
{
    if ( !qstrcmp( clname, "WizardForm" ) )
	return this;
    return QWizard::qt_cast( clname );
}

bool WizardForm::qt_invoke( int _id, QUObject* _o )
{
    switch ( _id - staticMetaObject()->slotOffset() ) {
    case 0: checkInput(); break;
    case 1: saveConfig(); break;
    case 2: datachange(); break;
    case 3: editdb(); break;
    case 4: languageChange(); break;
    default:
	return QWizard::qt_invoke( _id, _o );
    }
    return TRUE;
}

bool WizardForm::qt_emit( int _id, QUObject* _o )
{
    return QWizard::qt_emit(_id,_o);
}
#ifndef QT_NO_PROPERTIES

bool WizardForm::qt_property( int id, int f, QVariant* v)
{
    return QWizard::qt_property( id, f, v);
}

bool WizardForm::qt_static_property( QObject* , int , int , QVariant* ){ return FALSE; }
#endif // QT_NO_PROPERTIES
