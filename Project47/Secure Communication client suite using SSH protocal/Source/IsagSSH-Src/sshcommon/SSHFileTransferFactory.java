package sshcommon;

import java.io.File;

import application.MindTermApp;

public interface SSHFileTransferFactory {
    public SSHFileTransfer create(MindTermApp client, File cwd)
	throws Exception;
}
