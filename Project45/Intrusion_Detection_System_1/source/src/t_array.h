
#ifndef TEMPLATE_ARRAY_H
#define TEMPLATE_ARRAY_H

#include <iostream.h>
#include <fstream.h>
#include <assert.h>
#include <stdlib.h>

template<class T> class Array {
	public:
		Array() {Init();}
		Array(const Array<T> &t) {Init(); Init(t);}	//copy constructor
		Array(int size) {Init(); Allocate(size);}
		~Array();
		
		void Allocate(int nSize);
		T &operator[](int i) const;
		T Data(int i) const;
		Array<T> &operator=(const Array<T> &t);
		int operator==(const Array<T> & t);
		void Set(T t);
		int Size() const ;
		friend ostream &operator<<<>(ostream &s,const Array<T> &t);
		friend ofstream & operator<<<>(ofstream & out_file,const Array<T> & t);
	private:
		void Init() {size=0; data=NULL;}
		void Init(const Array<T> &t);

		int size;
		T *data;
};

template<class T> Array<T>::~Array()
{	
	delete[] data;
}

template<class T> ostream &operator<<(ostream &s,const Array<T> &t)
{
	for(int i=0; i< t.size; i++)
		s<<t.data[i]<<" ";
	return s;
}


template<class T> ofstream &operator<<(ofstream & out_file,const Array<T> &t)
{
	for(int i=0; i< t.size;i++)
		out_file<<t.data[i]<<" ";
	return out_file;
}
	
template<class T> int Array<T>::Size() const 
{
	return size;
}

template<class T> void Array<T>::Set(T t)
{
	for(int i=0; i<size ; i++)
		data[i] = t;
}

template<class T> Array<T> &Array<T>::operator=(const Array<T> &t)
{
	Init(t);
	return *this;
}

template<class T> int Array<T>::operator==(const Array<T> & t)
{
	int  chk = 1;
	if(size == t.size){
		for(int i=0; (i < size) && chk; i++){
			if(data[i] != t.data[i])
				chk = 0;
		}
		return chk;
	}
	else return 0;
}

template<class T> T &Array<T>::operator[](int i) const
{
	if( (i<0) || (i>=size) ) { 
		cout<<"Error index of Array"<<endl;
		exit(-1);
	}
	return data[i];
}

template<class T> T Array<T>::Data(int i)const
{
	if( (i<0) || (i>size)){
		cout<<"Error Index of Array"<<endl;
		exit(-1);
	}
	return data[i];
}


template<class T> void Array<T>::Init(const Array<T> &t)
{
	Allocate(t.size);
	for(int i=0; i<size ;i++)
		data[i] = t.data[i];
}

template<class T> void Array<T>::Allocate(int nSize)
{
	if(size) delete[] data;
	size = nSize;
	data = new T[size];
	assert(data);
}


#endif

/*
void main()
{
	
	Array<int> i(10),a,b;
	cout<<"i"<<i<<endl;
	i.Set(-1);
	cout<<"i"<<i<<endl;
	cout<<"a"<<a<<endl;
	for(int j=0; j<i.Size(); j++)
		i[j] = j+10;
	
	b = a = i;
	cout<<"a"<<a<<endl<<"b"<<b<<endl;
	cout<<"[j]"<<i[9]<<endl;
	
}

*/
