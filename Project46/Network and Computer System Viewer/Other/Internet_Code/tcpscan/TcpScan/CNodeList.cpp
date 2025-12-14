/*
	CNodeList.cpp
	Classe base per la gestione di una lista semplice con riutilizzo (automatico) degli elementi eliminati.
	Affanculo i templates (CRT).
	Luca Piergentili, 05/01/98
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#include "env.h"
#include "pragma.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "strcpyn.h"
#ifdef _WINDOWS
	#include "window.h"
#else
	#include "typedef.h"
#endif
#include "CNodeList.h"

/*
	CreateNode()

	Crea un nuovo nodo e lo inserisce nella lista.
	Prima di creare un nuovo nodo controlla se ne esistono di disponibili.
*/
CNode* CNodeList::CreateNode(void* ptr)
{
	CNode* node;

	// controlla se esistono nodi inutilizzati
	if((node = FindFirstNode(UNUSED_NODE))!=(CNode*)NULL)
	{
		InitializeNode(node,USED_NODE,ptr);
	}
	else
	{
		// nessun nodo disponibile, ne crea uno nuovo
		node = (CNode*)new CNode();
		if(node!=(CNode*)NULL)
		{
			InitializeNode(node,UNUSED_NODE,ptr);
			InsertNode(node);
		}
	}
	
	// indice del nodo/totale dei nodi presenti
	if(node)	
		node->index = m_iTot++;

	// rinumera i nodi occupati
	EnumerateNodes();

	return(node);
}

/*
	InitializeNode()

	Inizializza il nodo.
	Non inizializza il puntatore al nodo successivo dato che i nodi inutilizzati vengono 
	riciclati (il ptr al nodo successivo viene inizializzato solo quando si inserisce un
	nuovo nodo nella lista con InsertNode()).
*/
void CNodeList::InitializeNode(CNode* node,int status,void* ptr)
{
#ifdef _DEBUG
	memset(node->signature,'\0',SIGNATURE_LEN+1);
	strcpyn(node->signature,Signature(),SIGNATURE_LEN+1);
#endif
	node->index  = 0;
	node->status = status;
	node->data   = ptr;
}

/*
	InsertNode()

	Inserisce il nodo nella lista.
*/
void CNodeList::InsertNode(CNode* node)
{
	// marca il nodo come occupato
	node->status = USED_NODE;

	// imposta il puntatore al nodo successivo
	node->next = (CNode*)NULL;

	// inserisce il nodo nella lista
	if(m_pFirstNode==(CNode*)NULL)
		m_pFirstNode = m_pLastNode = node;
	else
		m_pLastNode = m_pLastNode->next = node;
}

/*
	CheckNode()

	Controlla la validita' del nodo.
*/
#ifdef _DEBUG
BOOL CNodeList::CheckNode(CNode* node)
{
	BOOL flag = FALSE;

	// controlla i puntatori e confronta la signature
	if(node)
		if(*node->signature)
			flag = memcmp(node->signature,Signature(),strlen(Signature()))==0;

	return(flag);
}
#endif

/*
	CountNodes()

	Conta i nodi (occupati) presenti nella lista.
*/
int CNodeList::CountNodes(void)
{
	int tot = 0;
	CNode* node = m_pFirstNode;

	// scorre la lista
	while(node!=(CNode*)NULL)
	{
#ifdef _DEBUG
		// controlla la signature
		if(!CheckNode(node))
			break;
#endif
		// controlla lo status ed incrementa il totale dei nodi occupati
		if(node->status==USED_NODE)
			tot++;

		// passa al nodo successivo
		node = node->next;
	}

	return(tot);
}

/*
	EnumerateNodes()

	Rinumera i nodi (occupati) presenti nella lista.
*/
void CNodeList::EnumerateNodes(void)
{
	int i = 0;
	CNode* node = m_pFirstNode;

	// scorre la lista
	while(node!=(CNode*)NULL)
	{
#ifdef _DEBUG
		// controlla la signature
		if(!CheckNode(node))
			break;
#endif
		// controlla lo status
		if(node->status==USED_NODE)
			node->index = i++;

		// passa al nodo successivo
		node = node->next;
	}
}

/*
	FindFirstNode()

	Cerca il primo nodo della lista con lo status uguale a quello specificato.
*/
CNode* CNodeList::FindFirstNode(int status)
{
	CNode* node = m_pFirstNode;

	// scorre la lista
	while(node!=(CNode*)NULL)
	{
#ifdef _DEBUG
		// controlla la signature
		if(!CheckNode(node))
		{
			node = (CNode*)NULL;
			break;
		}
#endif
		// se lo status e' diverso da quello specificato, passa al nodo successivo
		if(node->status!=status)
			node = node->next;
		else
			break;
	}

	return(node);
}

/*
	FindNextBlock()

	Restituisce il puntatore al successivo nodo (occupato) della lista.
	Passare il puntatore al corrente, restituisce il puntatore al seguente.
*/
CNode* CNodeList::FindNextBlock(CNode* node)
{
	// controlla il puntatore all'elemento corrente della lista
	if(node==(CNode*)NULL)
		return(node);

	// scorre la lista (a partire dall'elemento corrente, ossia quello ricevuto come parametro)
	while(node!=(CNode*)NULL)
	{
#ifdef _DEBUG
		// controlla la signature
		if(!CheckNode(node))
		{
			node = (CNode*)NULL;
			break;
		}
#endif
		// posiziona sul nodo seguente (il puntatore sta' puntando al nodo corrente del chiamante)
		if((node = node->next)!=(CNode*)NULL)
		{
			// controlla lo status
			if(node->status==USED_NODE)
				break;
		}
	}

	return(node);
}

/*
	FindNodeByIndex()

	Cerca il nodo relativo all'indice.
*/
CNode* CNodeList::FindNodeByIndex(int index)
{
	CNode* node = m_pFirstNode;

	// scorre la lista
	while(node!=(CNode*)NULL)
	{
#ifdef _DEBUG
		// controlla la signature
		if(!CheckNode(node))
		{
			node = (CNode*)NULL;
			break;
		}
#endif
		if(node->status==USED_NODE)
		{
			if(node->index==index)
				break;
		}
		
		node = node->next;
	}

	return(node);
}

/*
	GetAt()

	Restituisce il puntatore ai dati del nodo relativo all'indice.
*/
void* CNodeList::GetAt(int index)
{
	void* p = NULL;
	ITERATOR iter = FindAt(index);
	
	if(iter)
		if(iter->status==USED_NODE)
			p = iter->data;

	return(p);
}

/*
	ReleaseNode()

	Rilascia il nodo.
	Notare che i nodi non vengono mai rilasciati fisicamente, ma riciclati.
	Il rilascio consiste nel rilasciarne le risorse, reinizializzarlo e marcarlo come inutilizzato.
*/
BOOL CNodeList::ReleaseNode(CNode* node)
{
	BOOL flag = FALSE;

	// controlla il puntatore
	if(node!=(CNode*)NULL)
	{
		// controlla lo status
		if(node->status==USED_NODE)
		{
			flag = TRUE;

			// per permettere all'eventuale classe derivata di rilasciare le risorse associate al
			// nodo dei dati (ossia le risorse contenute in node->data)
			// notare che se i dati presenti in node->data sono o contengono una classe non e' sufficente
			// la delete di cui sotto, per cui, nella ridefinizione della virtuale, oltre ad eliminare
			// i dati contenuti in node->data bisogna eliminare anche node->data, effettuando i cast 
			// opportuni affinche venga chiamato il distruttore adeguato
			if(!PreDelete(node))
			{
				// elimina il nodo di dati
				if(node->data)
					delete node->data;
			}

			// marca il nodo come inutilizzato
			InitializeNode(node,UNUSED_NODE,(void*)NULL);

			m_iTot--;

			EnumerateNodes();
		}
	}

	return(flag);
}

/*
	ReleaseNodeList()

	Rilascia la lista dei nodi.
*/
void CNodeList::ReleaseNodeList(void)
{
	CNode* node = m_pFirstNode;
	CNode* next_node;

	// scorre la lista
	while(node!=(CNode*)NULL)
	{
#ifdef _DEBUG
		// controlla la signature
		if(!CheckNode(node))
		{
			node = (CNode*)NULL;
			break;
		}
#endif
		// salva l'indirizzo del nodo successivo
		next_node = node->next;

		// rilascia le risorse associate al nodo ed il nodo
		ReleaseNode(node);
		delete node;

		// passa al nodo successivo
		m_pFirstNode = node = next_node;
	}

	m_iTot = 0;

	// resetta la lista
	m_pFirstNode = m_pLastNode = (CNode*)NULL;
}
