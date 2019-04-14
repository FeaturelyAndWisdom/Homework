#pragma once

#include "string.h"
#include <iostream>
#include "afxwin.h"
#include "vector"
#include "afxcmn.h"
using namespace std;
// MainDlg 对话框

class MainDlg : public CDialogEx
{
	DECLARE_DYNAMIC(MainDlg)

public:
	MainDlg(CWnd* pParent = NULL);   // 标准构造函数
	MainDlg(string uname, CWnd* pParent = NULL);
	virtual ~MainDlg();

// 对话框数据
	enum { IDD = IDD_MAIN_DIALOG };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持

	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedButtonInput();
	virtual BOOL OnInitDialog();
private:
	string _uname;
public:
	int all_line;
	int chinese;
	int chinese_line;
	int english;
	int english_line;
	int major;
	int major_line;
	int math;
	int math_line;
	bool line_flag;
	CString name;
	CButton findBtn;
	CButton download;
	CButton import;
	CButton input;
	CButton setLine;
	CListCtrl new_list;
	CListCtrl old_list;
	afx_msg void OnBnClickedButtonDownload();
	afx_msg void OnBnClickedButtonRegister();
	afx_msg void OnBnClickedButtonOutput();
	afx_msg void OnBnClickedButtonSetline();
	afx_msg void OnBnClickedButtonDelete();
	afx_msg void OnBnClickedButtonImport();
	afx_msg void OnBnClickedButtonFind();
	bool check(CString ma, CString c, CString e, CString mj);
	
};
