#pragma once

#include "string.h"
#include "iostream"
#include "fstream"
using namespace std;
// RegDlg �Ի���

class RegDlg : public CDialogEx
{
	DECLARE_DYNAMIC(RegDlg)

public:
	RegDlg(CWnd* pParent = NULL);   // ��׼���캯��
	virtual ~RegDlg();

// �Ի�������
	enum { IDD = IDD_REGIST_DIALOG };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��

	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedButtonReg();
};
