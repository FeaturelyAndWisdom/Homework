// RegDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "test2.h"
#include "RegDlg.h"
#include "afxdialogex.h"


// RegDlg 对话框

IMPLEMENT_DYNAMIC(RegDlg, CDialogEx)

RegDlg::RegDlg(CWnd* pParent /*=NULL*/)
	: CDialogEx(RegDlg::IDD, pParent)
{

}

RegDlg::~RegDlg()
{
}

void RegDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(RegDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BUTTON_REG, &RegDlg::OnBnClickedButtonReg)
END_MESSAGE_MAP()


// RegDlg 消息处理程序

//添加新用户，向登录配置文件中写入新用户信息
void RegDlg::OnBnClickedButtonReg()
{
	CString name, pwd, pwd2;
	GetDlgItemText(IDC_EDIT_REGNAME,name);
	GetDlgItemText(IDC_EDIT_REGPWD, pwd);
	GetDlgItemText(IDC_EDIT_REGPWD2, pwd2);
	string p1 = CT2A(pwd.GetBuffer());
	string p2 = CT2A(pwd2.GetBuffer());
	string n = CT2A(name.GetBuffer());
	if (p1 != p2){
		MessageBox(_T("密码不一致"));
		return;
	}
	else{
		string temp = n + ":" + p1+"\n";
		ofstream fout("E:\\wspace\\test2\\login.ini", ios::app);
		fout << temp.c_str();
		MessageBox(_T("添加成功"));
		fout.close();
		EndDialog(0);
	}
}
