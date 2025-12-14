package org.globus.progtutorial.services.core.first.impl;

import org.globus.ogsa.impl.ogsi.GridServiceImpl;
import org.globus.progtutorial.stubs.MatrixService.MatrixPortType;
import java.rmi.RemoteException;

public class MatrixImpl extends GridServiceImpl implements MatrixPortType
{
	private int value = 0;

	public MatrixImpl()
	{
		super("Simple MatrixService");
	}

	public void multiplyMatrix(int [] a, int [] b, int c) throws RemoteException
	{
		for (int i=0;i<c;i++)
		{
			value = value + (a[i]*b[i]);
		}
	}

	public int getValue() throws RemoteException
	{
		return value;
	}
}
