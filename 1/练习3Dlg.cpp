// Á·Ï°3Dlg.cpp : implementation file
#include<graphics.h>
#include "stdafx.h"
#include "Á·Ï°3.h"
#include "Á·Ï°3Dlg.h"
#include "math.h"
#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif
static int  m_second;
static int  m_minute;
static int  m_hour;

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CMy3Dlg dialog

CMy3Dlg::CMy3Dlg(CWnd* pParent /*=NULL*/)
	: CDialog(CMy3Dlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CMy3Dlg)
	m_hour = 0;
	m_minute = 0;
	m_second = 0;
	m_bTime = FALSE;
	m_strData = _T("");
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CMy3Dlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CMy3Dlg)
	DDX_Control(pDX, IDC_MONTHCALENDAR1, m_monthCtrl);
	DDX_Control(pDX, IDC_DATETIMEPICKER1, m_timeCtrl);
	DDX_Text(pDX, IDC_EDIT1, m_hour);
	DDV_MinMaxInt(pDX, m_hour, 0, 23);
	DDX_Text(pDX, IDC_EDIT2, m_minute);
	DDV_MinMaxInt(pDX, m_minute, 0, 59);
	DDX_Text(pDX, IDC_EDIT3, m_second);
	DDV_MinMaxInt(pDX, m_second, 0, 59);
	DDX_Check(pDX, IDC_CHECK1, m_bTime);
	DDX_Text(pDX, IDC_STATIC6, m_strData);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CMy3Dlg, CDialog)
	//{{AFX_MSG_MAP(CMy3Dlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_WM_TIMER()
	ON_EN_CHANGE(IDC_EDIT1, OnChangeEdit1)
	ON_EN_CHANGE(IDC_EDIT2, OnChangeEdit2)
	ON_EN_CHANGE(IDC_EDIT3, OnChangeEdit3)
	ON_BN_CLICKED(IDC_CHECK1, OnCheck1)
	ON_NOTIFY(DTN_DROPDOWN, IDC_DATETIMEPICKER1, OnDropdownDatetimepicker1)
	ON_NOTIFY(DTN_DATETIMECHANGE, IDC_DATETIMEPICKER1, OnDatetimechangeDatetimepicker1)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CMy3Dlg message handlers

BOOL CMy3Dlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}
	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	SetTimer(0,1000,NULL);
	int a,b,c;
	CTime curtime=CTime::GetCurrentTime();
	a=curtime.GetHour();
	b=curtime.GetMinute();
	c=curtime.GetSecond();
    m_second=c;
    m_minute=b;
	m_hour=a;
    //m_timeCtrl.SetMonCal();
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CMy3Dlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CMy3Dlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}		
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CMy3Dlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CMy3Dlg::OnTimer(UINT nIDEvent) 
{
	// TODO: Add your message handler code here and/or call default
	CRect rect;
    CWnd *pWnd=GetDlgItem(IDC_STATIC);
	CDC *pDC=pWnd->GetDC();
	pWnd->GetClientRect(&rect);
	int centerX=rect.Width()/2;
	int centerY=rect.Height()/2;
	//±íÅÌ
	pDC->Ellipse(20,20,rect.Width()-20,rect.Height()-20);
	//±íÐÄ
	pDC->Ellipse(centerX-3,centerY-3,centerX+3,centerY+3);
	int clockradius=centerY>centerX?centerX:centerY;
    clockradius=clockradius*0.9;
	double keduDRadius=0.7*clockradius;
    double keduXRadius=0.82*clockradius;
	double hourradius=0.4*clockradius;
	double minuteradius=0.7*clockradius;
	double secondradius=0.8*clockradius;

    for(int i=0;i<12;i++)  //¿Ì¶È
	{
		pDC->MoveTo(centerX+keduDRadius*cos((i*30*PI)/180),
			        centerY+keduDRadius*sin((i*30*PI)/180));
		pDC->LineTo(centerX+0.85*clockradius*cos((i*30*PI)/180),
			        centerY+0.85*clockradius*sin((i*30*PI)/180));
	}
	    m_second+=1;
		if(m_second>59)
		{
			m_second=0;
			m_minute+=1;
			UpdateData(FALSE);
		}
		if(m_minute>59)
		{
			m_minute=0;
			m_hour+=1;
			UpdateData(FALSE);
		}
		if(m_hour>23)
		{
			m_hour=0;
			UpdateData(FALSE);
		}
	
	double secondRadians=m_second*(2*PI/60);
	double minuteRadians=m_minute*(2*PI/60)+secondRadians/60;
	double hourRadians=m_hour*(2*PI/12)+minuteRadians/12;

	//Ê±Õë
    pDC->MoveTo(centerX,centerY);
	pDC->LineTo(centerX+hourradius*sin(hourRadians),
		        centerY-hourradius*cos(hourRadians));
	//·ÖÕë
    pDC->MoveTo(centerX,centerY);
	pDC->LineTo(centerX+minuteradius*sin(minuteRadians),
		        centerY-minuteradius*cos(minuteRadians));
	//ÃëÕë
    pDC->MoveTo(centerX,centerY);
 	pDC->LineTo(centerX+secondradius*sin(secondRadians),
    	        centerY-secondradius*cos(secondRadians)); 

	UpdateData(FALSE);

	CDialog::OnTimer(nIDEvent);
	
}

void CMy3Dlg::OnChangeEdit1() 
{
	// TODO: If this is a RICHEDIT control, the control will not
	// send this notification unless you override the CDialog::OnInitDialog()
	// function and call CRichEditCtrl().SetEventMask()
	// with the ENM_CHANGE flag ORed into the mask.
	UpdateData();
	if(m_bTime)
	{
		if(m_hour>12)
		{
			m_hour=m_hour-12;
			m_strData="PM";
        
		}
		else
		{
			m_strData="AM";

		}
	}
	UpdateData(false);
	// TODO: Add your control notification handler code here
}

void CMy3Dlg::OnChangeEdit2() 
{
	// TODO: If this is a RICHEDIT control, the control will not
	// send this notification unless you override the CDialog::OnInitDialog()
	// function and call CRichEditCtrl().SetEventMask()
	// with the ENM_CHANGE flag ORed into the mask.b
	UpdateData();
	// TODO: Add your control notification handler code here
	
}

void CMy3Dlg::OnChangeEdit3() 
{
	// TODO: If this is a RICHEDIT control, the control will not
	// send this notification unless you override the CDialog::OnInitDialog()
	// function and call CRichEditCtrl().SetEventMask()
	// with the ENM_CHANGE flag ORed into the mask.
	UpdateData();
	// TODO: Add your control notification handler code here
	
}

void CMy3Dlg::OnCheck1() 
{
	// TODO: Add your control notification handler code here
    UpdateData();
	int a;
	a=m_hour;
	if(m_strData=="PM")
	{
		a=a+12;
	}
	if(m_bTime)
	{   
		if(a>12)
		{
		a=a-12;
        m_strData="PM";
		}
        else
		{
		m_strData="AM";
		}
	}
	else
	{

		if(m_hour>12)
		{
		a=a+12;
		}
	   m_strData=" ";
	}
    m_hour=a;
	UpdateData(FALSE);
}

void CMy3Dlg::OnDropdownDatetimepicker1(NMHDR* pNMHDR, LRESULT* pResult) 
{
	// TODO: Add your control notification handler code here
	COleDateTime m_data;
	m_timeCtrl.GetTime(m_data);
	m_timeCtrl.SetTime(m_data);
	CMonthCalCtrl *pCtrl=m_timeCtrl.GetMonthCalCtrl();
	pCtrl->SetToday(m_data);
	*pResult = 0;
}

void CMy3Dlg::OnDatetimechangeDatetimepicker1(NMHDR* pNMHDR, LRESULT* pResult) 
{
	// TODO: Add your control notification handler code here
	COleDateTime m_data;
	m_timeCtrl.GetTime(m_data);
	m_timeCtrl.SetTime(m_data);
	m_monthCtrl.SetCurSel(m_data);
	m_monthCtrl.SetToday(m_data);
	*pResult = 0;
}
