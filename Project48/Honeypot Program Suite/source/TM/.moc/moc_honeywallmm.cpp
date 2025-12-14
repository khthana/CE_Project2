/****************************************************************************
** HoneywallMM meta object code from reading C++ file 'honeywallmm.h'
**
** Created: Tue Jan 31 22:40:10 2006
**      by: The Qt MOC ($Id: qt/moc_yacc.cpp   3.3.5   edited Sep 2 14:41 $)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#undef QT_NO_COMPAT
#include "../.ui/honeywallmm.h"
#include <qmetaobject.h>
#include <qapplication.h>

#include <private/qucomextra_p.h>
#if !defined(Q_MOC_OUTPUT_REVISION) || (Q_MOC_OUTPUT_REVISION != 26)
#error "This file was generated using the moc from 3.3.5. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

const char *HoneywallMM::className() const
{
    return "HoneywallMM";
}

QMetaObject *HoneywallMM::metaObj = 0;
static QMetaObjectCleanUp cleanUp_HoneywallMM( "HoneywallMM", &HoneywallMM::staticMetaObject );

#ifndef QT_NO_TRANSLATION
QString HoneywallMM::tr( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "HoneywallMM", s, c, QApplication::DefaultCodec );
    else
	return QString::fromLatin1( s );
}
#ifndef QT_NO_TRANSLATION_UTF8
QString HoneywallMM::trUtf8( const char *s, const char *c )
{
    if ( qApp )
	return qApp->translate( "HoneywallMM", s, c, QApplication::UnicodeUTF8 );
    else
	return QString::fromUtf8( s );
}
#endif // QT_NO_TRANSLATION_UTF8

#endif // QT_NO_TRANSLATION

QMetaObject* HoneywallMM::staticMetaObject()
{
    if ( metaObj )
	return metaObj;
    QMetaObject* parentObject = QDialog::staticMetaObject();
    static const QUMethod slot_0 = {"startcage1", 0, 0 };
    static const QUMethod slot_1 = {"suspendcage1", 0, 0 };
    static const QUMethod slot_2 = {"startcage2", 0, 0 };
    static const QUMethod slot_3 = {"suspendcage2", 0, 0 };
    static const QUMethod slot_4 = {"startcage3", 0, 0 };
    static const QUMethod slot_5 = {"suspendcage3", 0, 0 };
    static const QUMethod slot_6 = {"starth1", 0, 0 };
    static const QUMethod slot_7 = {"stoph1", 0, 0 };
    static const QUMethod slot_8 = {"dataChange", 0, 0 };
    static const QUMethod slot_9 = {"copyVmware", 0, 0 };
    static const QUMethod slot_10 = {"regisCage", 0, 0 };
    static const QUMethod slot_11 = {"delCage", 0, 0 };
    static const QUMethod slot_12 = {"createCageConfig", 0, 0 };
    static const QUMethod slot_13 = {"applyRule", 0, 0 };
    static const QUMethod slot_14 = {"clearRule", 0, 0 };
    static const QUMethod slot_15 = {"selectRule", 0, 0 };
    static const QUMethod slot_16 = {"removeRule", 0, 0 };
    static const QUMethod slot_17 = {"showLog", 0, 0 };
    static const QUMethod slot_18 = {"showCageInformation", 0, 0 };
    static const QUMethod slot_19 = {"showCageTable", 0, 0 };
    static const QUParameter param_slot_20[] = {
	{ "sqlcmd", &static_QUType_QString, 0, QUParameter::In }
    };
    static const QUMethod slot_20 = {"querySnortDB", 1, param_slot_20 };
    static const QUParameter param_slot_21[] = {
	{ "sqlcmd", &static_QUType_QString, 0, QUParameter::In }
    };
    static const QUMethod slot_21 = {"querySamhainDB", 1, param_slot_21 };
    static const QUParameter param_slot_22[] = {
	{ "sqlcmd", &static_QUType_QString, 0, QUParameter::In }
    };
    static const QUMethod slot_22 = {"querySebekDB", 1, param_slot_22 };
    static const QUParameter param_slot_23[] = {
	{ "sqlcmd", &static_QUType_QString, 0, QUParameter::In }
    };
    static const QUMethod slot_23 = {"queryCageDB", 1, param_slot_23 };
    static const QUMethod slot_24 = {"checkButton", 0, 0 };
    static const QUMethod slot_25 = {"chageCageState", 0, 0 };
    static const QUMethod slot_26 = {"configTartarus", 0, 0 };
    static const QUMethod slot_27 = {"about", 0, 0 };
    static const QUMethod slot_28 = {"refresh", 0, 0 };
    static const QUMethod slot_29 = {"languageChange", 0, 0 };
    static const QMetaData slot_tbl[] = {
	{ "startcage1()", &slot_0, QMetaData::Public },
	{ "suspendcage1()", &slot_1, QMetaData::Public },
	{ "startcage2()", &slot_2, QMetaData::Public },
	{ "suspendcage2()", &slot_3, QMetaData::Public },
	{ "startcage3()", &slot_4, QMetaData::Public },
	{ "suspendcage3()", &slot_5, QMetaData::Public },
	{ "starth1()", &slot_6, QMetaData::Public },
	{ "stoph1()", &slot_7, QMetaData::Public },
	{ "dataChange()", &slot_8, QMetaData::Public },
	{ "copyVmware()", &slot_9, QMetaData::Public },
	{ "regisCage()", &slot_10, QMetaData::Public },
	{ "delCage()", &slot_11, QMetaData::Public },
	{ "createCageConfig()", &slot_12, QMetaData::Public },
	{ "applyRule()", &slot_13, QMetaData::Public },
	{ "clearRule()", &slot_14, QMetaData::Public },
	{ "selectRule()", &slot_15, QMetaData::Public },
	{ "removeRule()", &slot_16, QMetaData::Public },
	{ "showLog()", &slot_17, QMetaData::Public },
	{ "showCageInformation()", &slot_18, QMetaData::Public },
	{ "showCageTable()", &slot_19, QMetaData::Public },
	{ "querySnortDB(QString)", &slot_20, QMetaData::Public },
	{ "querySamhainDB(QString)", &slot_21, QMetaData::Public },
	{ "querySebekDB(QString)", &slot_22, QMetaData::Public },
	{ "queryCageDB(QString)", &slot_23, QMetaData::Public },
	{ "checkButton()", &slot_24, QMetaData::Public },
	{ "chageCageState()", &slot_25, QMetaData::Public },
	{ "configTartarus()", &slot_26, QMetaData::Public },
	{ "about()", &slot_27, QMetaData::Public },
	{ "refresh()", &slot_28, QMetaData::Public },
	{ "languageChange()", &slot_29, QMetaData::Protected }
    };
    metaObj = QMetaObject::new_metaobject(
	"HoneywallMM", parentObject,
	slot_tbl, 30,
	0, 0,
#ifndef QT_NO_PROPERTIES
	0, 0,
	0, 0,
#endif // QT_NO_PROPERTIES
	0, 0 );
    cleanUp_HoneywallMM.setMetaObject( metaObj );
    return metaObj;
}

void* HoneywallMM::qt_cast( const char* clname )
{
    if ( !qstrcmp( clname, "HoneywallMM" ) )
	return this;
    return QDialog::qt_cast( clname );
}

bool HoneywallMM::qt_invoke( int _id, QUObject* _o )
{
    switch ( _id - staticMetaObject()->slotOffset() ) {
    case 0: startcage1(); break;
    case 1: suspendcage1(); break;
    case 2: startcage2(); break;
    case 3: suspendcage2(); break;
    case 4: startcage3(); break;
    case 5: suspendcage3(); break;
    case 6: starth1(); break;
    case 7: stoph1(); break;
    case 8: dataChange(); break;
    case 9: copyVmware(); break;
    case 10: regisCage(); break;
    case 11: delCage(); break;
    case 12: createCageConfig(); break;
    case 13: applyRule(); break;
    case 14: clearRule(); break;
    case 15: selectRule(); break;
    case 16: removeRule(); break;
    case 17: showLog(); break;
    case 18: showCageInformation(); break;
    case 19: showCageTable(); break;
    case 20: querySnortDB((QString)static_QUType_QString.get(_o+1)); break;
    case 21: querySamhainDB((QString)static_QUType_QString.get(_o+1)); break;
    case 22: querySebekDB((QString)static_QUType_QString.get(_o+1)); break;
    case 23: queryCageDB((QString)static_QUType_QString.get(_o+1)); break;
    case 24: checkButton(); break;
    case 25: chageCageState(); break;
    case 26: configTartarus(); break;
    case 27: about(); break;
    case 28: refresh(); break;
    case 29: languageChange(); break;
    default:
	return QDialog::qt_invoke( _id, _o );
    }
    return TRUE;
}

bool HoneywallMM::qt_emit( int _id, QUObject* _o )
{
    return QDialog::qt_emit(_id,_o);
}
#ifndef QT_NO_PROPERTIES

bool HoneywallMM::qt_property( int id, int f, QVariant* v)
{
    return QDialog::qt_property( id, f, v);
}

bool HoneywallMM::qt_static_property( QObject* , int , int , QVariant* ){ return FALSE; }
#endif // QT_NO_PROPERTIES
