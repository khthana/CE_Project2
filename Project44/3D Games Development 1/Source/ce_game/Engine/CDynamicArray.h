// Author: Ekapol Anantapornkich (the Direct4D member)
// Revision: (under construction)

#ifndef CDYNAMICARRAY_H
#define CDYNAMICARRAY_H

#include <stdlib.h>
#include <memory.h>
#include <assert.h>

template <class CElement>
class CDynamicArray
{
public:
	typedef const CElement& Ref_constElement;
	typedef CElement& Ref_Element;
	typedef const CElement* Ptr_constElement;
	typedef CElement* Ptr_Element;

	CDynamicArray();
	~CDynamicArray();

	size_t size() const;
	void setSize(const size_t);

	void adjust();
	void clear();

	size_t add(Ref_constElement);

	CDynamicArray<CElement>& operator =(const CDynamicArray<CElement>&);
	Ref_constElement operator [](const size_t) const;
	Ref_Element operator [](const size_t);

protected:
	Ptr_Element m_pData;
	size_t m_size;
	size_t m_maxSize;
	size_t m_granul;
};

template <class CElement>
inline CDynamicArray<CElement>::CDynamicArray():
	m_pData(NULL),
	m_size(0),
	m_maxSize(0),
	m_granul(0)
{
}

template <class CElement>
inline CDynamicArray<CElement>::~CDynamicArray()
{
	if (m_pData != NULL)
	{
		delete[] m_pData;
		m_pData = NULL;
	}
}

template <class CElement>
inline size_t CDynamicArray<CElement>::size() const
{
	return m_size;
}

template <class CElement>
void CDynamicArray<CElement>::setSize(const size_t newSize)
{
	assert(newSize >= 0);
	if (newSize == 0)
	{
		// Shrink data array to nothing.
		if (m_pData != NULL)
		{
			delete[] m_pData;
			m_pData = NULL;
		}
		m_size = m_maxSize = 0;
	}
	else if (m_pData == NULL)
	{
		// Create data array with exact size.
#ifdef MAX_SIZE
		assert(newSize <= MAX_SIZE/sizeof(CElement)); // no overflow
#endif
		m_pData = new CElement[newSize];
		m_size = m_maxSize = newSize;
	}
	else if (newSize <= m_maxSize)
	{
		if (newSize < m_size)
		{
			size_t iElement = 0;
			for (iElement = newSize; iElement < m_size; iElement++)
				m_pData[iElement].~CElement();
		}
		m_size = newSize;
	}
	else
	{
		// Reallocate data array.
		size_t granul = m_granul;
		if (granul == 0)
		{
			// Heuristically determine growth granularity when granul = 0
			// (this avoids heap fragmentation in many situations).
			granul = m_size / 8;
			granul = (granul < 4) ? 4 : ((granul > 1024) ? 1024 : granul);
		}

		size_t newMaxSize = m_maxSize + granul; // granularity
		if (newSize >= newMaxSize) newMaxSize = newSize; // no slush

		// assert(newMaxSize >= m_maxSize); // no wrap around
#ifdef MAX_SIZE
		assert(newMaxSize <= MAX_SIZE/sizeof(CElement)); // no overflow
#endif
		Ptr_Element pNewData = new CElement[newMaxSize];

		// Data relocation.
		::memcpy(pNewData, m_pData, m_size * sizeof(CElement));
		assert(newSize > m_size);

		// Release old block of memory (without destruct element).
		delete[] (unsigned char*)m_pData;
		m_pData = pNewData;
		m_size = newSize;
		m_maxSize = newMaxSize;
	}
}

template <class CElement>
void CDynamicArray<CElement>::adjust()
{
	if (m_size < m_maxSize)
	{
		// Shrink data to save some memory.
#ifdef MAX_SIZE
		assert(m_size <= MAX_SIZE/sizeof(CElement)); // no overflow
#endif

		Ptr_Element pNewData = NULL;
		// Assume positive value size.
		if (m_size > 0)
		{
			pNewData = new CElement[m_size];
			// Data relocation.
			::memcpy(pNewData, m_pData, m_size * sizeof(CElement));
		}

		// Release old block of memory (without destruct element).
		delete[] (unsigned char*)m_pData;
		m_pData = pNewData;
		m_maxSize = m_size;
	}
}

template <class CElement>
inline void CDynamicArray<CElement>::clear()
{
	setSize(0);
}

template <class CElement>
inline size_t CDynamicArray<CElement>::add(Ref_constElement newElement)
{
	setSize(m_size + 1);
	m_pData[m_size - 1] = newElement;
	return m_size;
}

template <class CElement>
inline CDynamicArray<CElement>&
	CDynamicArray<CElement>::operator =(const CDynamicArray<CElement>& src)
{
	if (this == &src) return;
	setSize(src.m_size);
	iElement = 0;
	for (iElement = 0; iElement < m_size; iElement++)
		m_pData[iElement] = src.m_pData[iElement];
}

template <class CElement>
inline CDynamicArray<CElement>::Ref_constElement
	CDynamicArray<CElement>::operator [](const size_t index) const
{
	assert((0 <= index) && (index < m_size));
	return m_pData[index];
}

template <class CElement>
inline CDynamicArray<CElement>::Ref_Element
	CDynamicArray<CElement>::operator [](const size_t index)
{
	assert((0 <= index) && (index < m_size));
	return m_pData[index];
}

#endif // CDYNAMICARRAY_H