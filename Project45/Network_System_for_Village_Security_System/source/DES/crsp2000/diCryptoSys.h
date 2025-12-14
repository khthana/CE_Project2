/* diCryptoSys.h  */

/* Copyright (C) 2001-3 D.I.Management Services Pty Ltd
   <www.di-mgt.com.au> all rights reserved.
   Unauthorised distribution prohibited
*/

/* C/C++ programmers may use this include file in conjunction
   with the diCryptoSys.lib library to access
   functions in the 'CryptoSys API' DLL (diCryptoSys.DLL).

   The C/C++ interface consists of this .H include file and 
   the associated .LIB file.
   The C/C++ interface is provided at no extra cost 
   and is not supported.

   The C/C++ interface has been tested in the following environments:-
     Microsoft Developer Studio 97 Visual C++ 5.0
	 Microsoft Visual C++ 6.0
	 Borland C++ Compiler 5.5

   If it works on your compiler, please let us know.

   To report bugs or make suggestions for improvement,
   please contact us at <code@di-mgt.com.au>.
*/

#ifndef DICRYPTOSYS_H_
#define DICRYPTOSYS_H_ 1

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
/* NB We only need windows.h for __stdcall */

#ifdef __cplusplus
extern "C" {
#endif

/* CONSTANTS */
#define ENCRYPT 1
#define DECRYPT 0
#define RNG_DEFAULT 0x00
#define RNG_NOCHECK 0x01
#define RNG_DESKEY  0x02

/* BLOWFISH PROTOTYPES */
long _stdcall BLF_Hex(char *sOutput, char *sInput,
	char *sKey, int bEncrypt);
long _stdcall BLF_HexMode(char *sOutput, char *sInput,
	char *sHexKey, int bEncrypt, char *sMode, char *sHexIV);
long _stdcall BLF_Bytes(unsigned char *output, unsigned char *input,
	long nbytes, unsigned char *key, long keyBytes, int bEncrypt);
long _stdcall BLF_BytesMode(unsigned char *output, unsigned char *input,
	long nbytes, unsigned char *key, long keyBytes, 
	int bEncrypt, char *sMode, unsigned char *iv);
long _stdcall BLF_File(char *sFileOut, char *sFileIn,
	unsigned char *key, long keyBytes, int bEncrypt,
	char *sMode, unsigned char *iv);
long _stdcall BLF_FileHex(char *sFileOut, char *sFileIn,
	char *sHexKey, int bEncrypt, char *sMode, char *sHexIV);
long _stdcall BLF_Init(unsigned char *key, 
	long keyBytes, int bEncrypt,
	char *sMode, unsigned char *iv);
long _stdcall BLF_InitHex(char *sHexKey, int bEncrypt,
	char *sMode, char *sHexIV);
long _stdcall BLF_UpdateHex(long ctx_handle, char *sHexData);
long _stdcall BLF_Update(long ctx_handle, unsigned char *data,
						   long dataLen);
long _stdcall BLF_Final(long ctx_handle);
long _stdcall BLF_Ecb(long ctx_handle, unsigned char *data,
						   long dataLen, int bEncrypt);
long _stdcall BLF_EcbHex(long ctx_handle, char *sHexBlock, int bEncrypt);
long _stdcall BLF_InitError(void);

/* di_Blowfish Version 1 prototypes */
long _stdcall bf_StringEnc(unsigned char *output, unsigned char *input,
	long length, unsigned char *key, long keylen);
long _stdcall bf_StringDec(unsigned char *output, unsigned char *input,
	long length, unsigned char *key, long keylen);
long _stdcall bf_FileEnc(char *outputFileName, char *inputFileName,
	unsigned char* key, long keylen);
long _stdcall bf_FileDec(char *outputFileName, char *inputFileName,
	unsigned char* key, long keylen);
long _stdcall bf_Init(unsigned char* key, long keylen);
long _stdcall bf_BlockEnc(long ctx_handle, unsigned char* block);
long _stdcall bf_BlockDec(long ctx_handle, unsigned char* block);
long _stdcall bf_Final(long ctx_handle);

/* SHA-1 PROTOTYPES */
long _stdcall SHA1_StringHexHash(char *sDigest, char *sMessage);
long _stdcall SHA1_FileHexHash(char *sDigest, char *sFilename, char *sMode);
long _stdcall SHA1_BytesHexHash(char *sDigest, unsigned char *bytes, long len);
long _stdcall SHA1_Init(void);
long _stdcall SHA1_AddString(long ctx_handle, char *sMessage);
long _stdcall SHA1_AddBytes(long ctx_handle, unsigned char *bytes, long len);
long _stdcall SHA1_HexDigest(char *sDigest, long ctx_handle);
long _stdcall SHA1_Reset(long ctx_handle);
long _stdcall SHA1_Hmac(char *sDigest, 
	unsigned char *textBytes, long textLen,
	unsigned char *keyBytes, long keyLen);

/* SHA-256 PROTOTYPES */
long _stdcall SHA2_StringHexHash(char *sDigest, char *sMessage);
long _stdcall SHA2_FileHexHash(char *sDigest, char *sFilename, char *sMode);
long _stdcall SHA2_BytesHexHash(char *sDigest, unsigned char *bytes, long len);
long _stdcall SHA2_Init(void);
long _stdcall SHA2_AddString(long ctx_handle, char *sMessage);
long _stdcall SHA2_AddBytes(long ctx_handle, unsigned char *bytes, long len);
long _stdcall SHA2_HexDigest(char *sDigest, long ctx_handle);
long _stdcall SHA2_Reset(long ctx_handle);
long _stdcall SHA2_Hmac(char *sDigest, 
	unsigned char *textBytes, long textLen,
	unsigned char *keyBytes, long keyLen);

/* DES PROTOTYPES */
long _stdcall DES_Hex(char *strOutput, char *strInput,
	char *strKey, int bEncrypt);
long _stdcall DES_HexMode(char *strOutput, char *strInput,
	char *strKey, int bEncrypt, char *strMode, char *strIV);
long _stdcall DES_Bytes(unsigned char *output, unsigned char *input,
	long nbytes, unsigned char *key, int bEncrypt);
long _stdcall DES_BytesMode(unsigned char *output, unsigned char *input,
	long nbytes, unsigned char *key, 
	int bEncrypt, char *pStrMode, unsigned char *iv);
long _stdcall DES_File(char *strFileOut, char *strFileIn,
	unsigned char *key, int bEncrypt,
	char *strMode, unsigned char *iv);
long _stdcall DES_FileHex(char *strFileOut, char *strFileIn,
	char *strKey, int bEncrypt, 
	char *strMode, char *strIV);
long _stdcall DES_Init(unsigned char *key, 
	int bEncrypt, char *strMode, unsigned char *iv);
long _stdcall DES_InitHex(char *strKey, int bEncrypt,
						  char *strMode, char *strIV);
long _stdcall DES_Update(long ctx_handle, unsigned char *data, long dataLen);
long _stdcall DES_UpdateHex(long ctx_handle, char *strHex);
long _stdcall DES_Final(long ctx_handle);
long _stdcall DES_InitError(void);

/* TRIPLE DES PROTOTYPES */
long _stdcall TDEA_Hex(char *strOutput, char *strInput,
	char *strKey, int bEncrypt);
long _stdcall TDEA_HexMode(char *strOutput, char *strInput,
	char *strKey, int bEncrypt, char *strMode, char *strIV);
long _stdcall TDEA_Bytes(unsigned char *output, unsigned char *input,
	long nbytes, unsigned char *key, int bEncrypt);
long _stdcall TDEA_BytesMode(unsigned char *output, unsigned char *input,
	long nbytes, unsigned char *key, 
	int bEncrypt, char *pStrMode, unsigned char *iv);
long _stdcall TDEA_File(char *strFileOut, char *strFileIn,
	unsigned char *key, int bEncrypt,
	char *strMode, unsigned char *iv);
long _stdcall TDEA_FileHex(char *strFileOut, char *strFileIn,
	char *strKey, int bEncrypt, 
	char *strMode, char *strIV);
long _stdcall TDEA_Init(unsigned char *key,  
	int bEncrypt, char *strMode, unsigned char *iv);
long _stdcall TDEA_InitHex(char *strKey, int bEncrypt, 
						   char *strMode, char *strIV);
long _stdcall TDEA_Update(long ctx_handle, unsigned char *data, long dataLen);
long _stdcall TDEA_UpdateHex(long ctx_handle, char *strHex);
long _stdcall TDEA_Final(long ctx_handle);
long _stdcall TDEA_InitError(void);

/* AES PROTOTYPES */
long _stdcall AES_Hex(char *strOutput, char *strInput,
	char *strKey, long keyBits, long blockBits, int bEncrypt);
long _stdcall AES_HexMode(char *strOutput, char *strInput,
	char *strKey, long keyBits, long blockBits, 
	int bEncrypt, char *strMode, char *strIV);
long _stdcall AES_Bytes(unsigned char *output, unsigned char *input,
	long nbytes, unsigned char *key, long keyBits, long blockBits, 
	int bEncrypt);
long _stdcall AES_BytesMode(unsigned char *output, unsigned char *input,
	long nbytes, unsigned char *key, long keyBits, long blockBits, 
	int bEncrypt, char *pStrMode, unsigned char *iv);
long _stdcall AES_File(char *strFileOut, char *strFileIn,
	unsigned char *key, long keyBits, long blockBits, int bEncrypt,
	char *strMode, unsigned char *iv);
long _stdcall AES_FileHex(char *strFileOut, char *strFileIn,
	char *strKey, long keyBits, long blockBits, 
	int bEncrypt, char *strMode, char *strIV);
long _stdcall AES_Init(unsigned char *key, 
	long keyBits, long blockBits, int bEncrypt,
	char *strMode, unsigned char *iv);
long _stdcall AES_InitHex(char *strKey, 
	long keyBits, long blockBits, int bEncrypt,
	char *strMode, char *strIV);
long _stdcall AES_Update(long ctx_handle, unsigned char *data, long dataLen);
long _stdcall AES_UpdateHex(long ctx_handle, char *strHex);
long _stdcall AES_Final(long ctx_handle);
long _stdcall AES_Ecb(long ctx_handle, unsigned char *data,
						   long dataLen, int bEncrypt);
long _stdcall AES_EcbHex(long ctx_handle, char *strHex, int bEncrypt);
long _stdcall AES_InitError(void);

/* ANSI X9.17/X9.31 RNG PROTOTYPES */
long _stdcall RNG_KeyGenerate(unsigned char *keyArray, long keyLen,
	char *seed, long *pcheck, long flags);
long _stdcall RNG_KeyGenHex(char *hexstr, long keyLen,
	char *seed, long *pcheck, long flags);
long _stdcall RNG_Nonce(unsigned char *bytearray, long nbytes, char *seed);
long _stdcall RNG_NonceHex(char *hexstr, long nbytes, char *seed);
long _stdcall RNG_Long(long lower, long upper, char *seed);
long _stdcall RNG_Test(char *filename);

/* VERSION 1 RANDOM PROTOTYPES */
long _stdcall RAN_KeyGenerate(unsigned char *keyArray, long keyLen, int bPromptUser);
long _stdcall RAN_KeyGenHex(char *strKey, long keyLen, int bPromptUser);
long _stdcall RAN_DESKeyGenerate(unsigned char *keyArray, int bPromptUser);
long _stdcall RAN_DESKeyGenHex(char *strKey, int bPromptUser);
long _stdcall RAN_TDEAKeyGenerate(unsigned char *keyArray, int bPromptUser);
long _stdcall RAN_TDEAKeyGenHex(char *strKey, int bPromptUser);
long _stdcall RAN_Seed(unsigned char *bytearray, long nbytes, int bPromptUser);
long _stdcall RAN_Nonce(unsigned char *bytearray, long nbytes);
long _stdcall RAN_NonceHex(char *strNonce, long nbytes);
long _stdcall RAN_Long(long lower, long upper);
long _stdcall RAN_Test(char *strFilename);

/* ZLIB COMPRESSION PROTOTYPES */
long _stdcall ZLIB_Deflate(unsigned char *output, long out_len, unsigned char *input, long in_len);
long _stdcall ZLIB_Inflate(unsigned char *output, long out_len, unsigned char *input, long in_len);


#ifdef __cplusplus
}
#endif

#endif /* DICRYPTOSYS_H_ */
