#pragma once

#include "string.h"
#include "iostream"
#include "fstream"
using namespace std;
// RegDlg 对话框

class RegDlg : public CDialogEx
{
	DECLARE_DYNAMIC(RegDlg)

public:
	RegDlg(CWnd* pParent = NULL);   // 标准构造函数
	virtual ~RegDlg();

// 对话框数据
	enum { IDD = IDD_REGIST_DIALOG };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持

	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedButtonReg();
};
