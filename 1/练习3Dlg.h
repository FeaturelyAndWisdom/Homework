// Á·Ï°3Dlg.h : header file
//

#if !defined(AFX_3DLG_H__CA96E6F7_FBFD_4F36_816E_5DC2EEDEDA5F__INCLUDED_)
#define AFX_3DLG_H__CA96E6F7_FBFD_4F36_816E_5DC2EEDEDA5F__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CMy3Dlg dialog
const double PI=3.14159265;
class CMy3Dlg : public CDialog
{
// Construction
public:
	CMy3Dlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CMy3Dlg)
	enum { IDD = IDD_MY3_DIALOG };
	CMonthCalCtrl	m_monthCtrl;
	CDateTimeCtrl	m_timeCtrl;
	int		m_hour;
	int		m_minute;
	int		m_second;
	BOOL	m_bTime;
	CString	m_strData;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMy3Dlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CMy3Dlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnTimer(UINT nIDEvent);
	afx_msg void OnChangeEdit1();
	afx_msg void OnChangeEdit2();
	afx_msg void OnChangeEdit3();
	afx_msg void OnCheck1();
	afx_msg void OnDropdownDatetimepicker1(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnDatetimechangeDatetimepicker1(NMHDR* pNMHDR, LRESULT* pResult);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_3DLG_H__CA96E6F7_FBFD_4F36_816E_5DC2EEDEDA5F__INCLUDED_)
