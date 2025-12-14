#ifndef REDIRECT_H_INCLUDED__
#define REDIRECT_H_INCLUDED__

//##ModelId=3E9ABEE70186
class CRedirect
{
public:

	//--------------------------------------------------------------------------
	//	constructor
	//--------------------------------------------------------------------------
	//##ModelId=3E9ABEE701A9
	CRedirect
	(
		LPCTSTR		szCommand,
		CEdit		*pEdit,
		LPCTSTR		szCurrentDirectory = NULL
	);

	//--------------------------------------------------------------------------
	//	destructor
	//--------------------------------------------------------------------------
	//##ModelId=3E9ABEE701A8
	virtual ~CRedirect();

	//--------------------------------------------------------------------------
	//	public member functions
	//--------------------------------------------------------------------------
	//##ModelId=3E9ABEE701A7
	virtual void		Run();
	//##ModelId=3E9ABEE701A6
	virtual	void		Stop();

protected:

	//--------------------------------------------------------------------------
	//	member functions
	//--------------------------------------------------------------------------
	//##ModelId=3E9ABEE701A4
	void				AppendText(LPCTSTR Text);
	//##ModelId=3E9ABEE701A0
	void				PeekAndPump();
	//##ModelId=3E9ABEE7019E
	void				SetSleepInterval(DWORD dwMilliseconds);
	//##ModelId=3E9ABEE7019C
	void				ShowLastError(LPCTSTR szText);

	//--------------------------------------------------------------------------
	//	member data
	//--------------------------------------------------------------------------
	//##ModelId=3E9ABEE7019B
	bool				m_bStopped;
	//##ModelId=3E9ABEE7019A
	DWORD				m_dwSleepMilliseconds;
	//##ModelId=3E9ABEE70194
	CEdit				*m_pEdit;
	//##ModelId=3E9ABEE70191
	LPCTSTR				m_szCommand;
	//##ModelId=3E9ABEE70190
	LPCTSTR				m_szCurrentDirectory;

};

#endif	// REDIRECT_H_INCLUDED__
