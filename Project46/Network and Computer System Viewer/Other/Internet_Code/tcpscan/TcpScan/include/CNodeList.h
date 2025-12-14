/*
	CNodeList.h
	Classe base per la gestione di una lista semplice con riutilizzo (automatico) degli elementi eliminati.
	Affanculo i templates (CRT).
	Luca Piergentili, 05/01/98
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#ifndef _CNODELIST_H
#define _CNODELIST_H 1

#include <stdio.h>
#include <stdlib.h>
#ifdef _WINDOWS
  #include "window.h"
#else
  #include "typedef.h"
#endif

#ifdef _DEBUG
#define SIGNATURE_LEN	32
#endif
#define USED_NODE		1965
#define UNUSED_NODE		1981

/*
	CNode
	Elemento per la lista.
*/
class CNodeList;
class CNode
{
	friend CNodeList;
public:
	CNode() {}
	virtual ~CNode() {}

private:
#ifdef _DEBUG
	char		signature[SIGNATURE_LEN+1];	// signature del nodo (senza lo '\0' finale)
#endif
	int		index;					// indice (base 0)
	int		status;					// status del nodo (in uso/disponibile)
	CNode*	next;					// puntatore al nodo successivo della lista
public:
	void*	data;					// puntatore ai dati
};

/*
	ITERATOR
	Puntatore per la ricerca nella lista.
*/
typedef CNode* ITERATOR;

/*
	CNodeList
	Classe base per la gestione di una lista semplice con riutilizzo (automatico) degli elementi eliminati.
	
	utilizzo:
	
	- definire una struct/classe per i dati da inserire nella lista:
	
	struct/class myData {
		...
	};
	
	se la struct/classe alloca dati, eliminarli nel distruttore che verra chiamato dalla PreDelete()
	della classe derivata (vedi sotto).

	- derivare dalla classe base una classe che contenga il codice per l'eliminazione dell'elemento:
		
	class CMyList : public CNodeList
	{
	public:
		CMyList() {}
		virtual ~CMyList() {CNodeList::DeleteAll();}
		BOOL PreDelete(ITERATOR iter)
		{
			if((myData*)iter->data)
			{
				delete ((myData*)iter->data);
				iter->data = (myData*)NULL;
			}
			return(TRUE);
		}
		int Size(void) {return(sizeof(myData));}
	#ifdef _DEBUG
		const char* Signature(void) {return("CMyList");}
	#endif
	};

	dove il distruttore della derivata si occupa di eliminare gli elementi della lista (DeleteAll()).
	Notare che la DeleteAll() della classe base chiama la virtuale PreDelete() che si occupa di eliminare
	l'elemento (myData), per cui se la struct/classe per i dati contiene dati complessi o effettua
	allocazioni, nel distruttore eseguire le operazioni appropiate.
	La virtuale Size() della classe base permette di specificare la dimensione della struttura utilizzata
	nella derivata.
*/
class CNodeList
{
public:
	CNodeList()								{m_iTot = 0; m_pFirstNode = m_pLastNode = NULL;}
	virtual ~CNodeList()						{ReleaseNodeList();}

	// inserimento
	inline BOOL		Add		(void* ptr)		{return(CreateNode(ptr)!=(CNode*)NULL);}
	inline ITERATOR	Insert	(void* ptr)		{return(CreateNode(ptr));}
	
	// rimozione
	virtual BOOL		PreDelete	(ITERATOR) = 0;
	inline void		Delete	(ITERATOR iter)	{ReleaseNode(iter);}
	inline void		DeleteAll	(void)			{ReleaseNodeList();}

	// status
	inline int		Count	(void)			{return(CountNodes());}

	// ricerca
	inline ITERATOR	First	(void)			{return(FindFirstNode(USED_NODE));}
	inline ITERATOR	Next		(ITERATOR iter)	{return(FindNextBlock(iter));}
	inline ITERATOR	FindAt	(int index)		{return(FindNodeByIndex(index));}
	void*			GetAt	(int);

	// dimensione dei dati associati al nodo
	virtual int		Size		(void) = 0;

#ifdef _DEBUG
	virtual const char*	Signature	(void) = 0;
#endif

private:
	// inserimento
	CNode*	CreateNode		(void* ptr);
	void		InitializeNode		(CNode* node,int status,void* ptr);
	void		InsertNode		(CNode* node);

	// ricerca
#ifdef _DEBUG
	BOOL		CheckNode			(CNode* node);
#endif
	int		CountNodes		(void);
	void		EnumerateNodes		(void);
	CNode*	FindFirstNode		(int status);
	CNode*	FindNextBlock		(CNode* node);
	CNode*	FindNodeByIndex	(int index);
	
	// rimozione
	BOOL		ReleaseNode		(CNode* node);
	void		ReleaseNodeList	(void);

	int		m_iTot;
	CNode*	m_pFirstNode;
	CNode*	m_pLastNode;
};

#endif // _CNODELIST_H
