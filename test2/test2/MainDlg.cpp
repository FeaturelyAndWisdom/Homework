// MainDlg.cpp : ʵ���ļ�
//

#include "stdafx.h"
#include "test2.h"
#include "MainDlg.h"
#include "afxdialogex.h"
#include "RegDlg.h"

// MainDlg �Ի���

IMPLEMENT_DYNAMIC(MainDlg, CDialogEx)

MainDlg::MainDlg(CWnd* pParent /*=NULL*/)
	: CDialogEx(MainDlg::IDD, pParent)
	, all_line(0)
	, chinese(0)
	, chinese_line(0)
	, english(0)
	, english_line(0)
	, major(0)
	, major_line(0)
	, math(0)
	, math_line(0)
	, name(_T(""))
{

}

MainDlg::MainDlg(string uname, CWnd* pParent /*=NULL*/)
: CDialogEx(MainDlg::IDD, pParent)
{
	_uname = uname;
}

MainDlg::~MainDlg()
{
}



void MainDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_BUTTON_DOWNLOAD, download);
	DDX_Control(pDX, IDC_BUTTON_IMPORT, import);
	DDX_Control(pDX, IDC_BUTTON_INPUT, input);
	DDX_Control(pDX, IDC_BUTTON_SETLINE, setLine);
	DDX_Text(pDX, IDC_EDIT_ALL_LINE, all_line);
	DDV_MinMaxInt(pDX, all_line, 0, 500);
	DDX_Text(pDX, IDC_EDIT_CHINESE, chinese);
	DDV_MinMaxInt(pDX, chinese, 0, 100);
	DDX_Text(pDX, IDC_EDIT_CHINESE_LINE, chinese_line);
	DDV_MinMaxInt(pDX, chinese_line, 0, 100);
	DDX_Text(pDX, IDC_EDIT_ENGLISH, english);
	DDV_MinMaxInt(pDX, english, 0, 100);
	DDX_Text(pDX, IDC_EDIT_ENGLISH_LINE, english_line);
	DDV_MinMaxInt(pDX, english_line, 0, 100);
	DDX_Text(pDX, IDC_EDIT_MAJOR, major);
	DDV_MinMaxInt(pDX, major, 0, 150);
	DDX_Text(pDX, IDC_EDIT_MAJOR_LINE, major_line);
	DDV_MinMaxInt(pDX, major_line, 0, 150);
	DDX_Text(pDX, IDC_EDIT_MATH, math);
	DDV_MinMaxInt(pDX, math, 0, 150);
	DDX_Text(pDX, IDC_EDIT_MATH_LINE, math_line);
	DDV_MinMaxInt(pDX, math_line, 0, 150);
	DDX_Text(pDX, IDC_EDIT_NAME, name);
	DDX_Control(pDX, IDC_LIST_NEW, new_list);
	DDX_Control(pDX, IDC_LIST_OLD, old_list);
	DDX_Control(pDX, IDC_BUTTON_FIND, findBtn);
}



BEGIN_MESSAGE_MAP(MainDlg, CDialogEx)
	ON_BN_CLICKED(IDC_BUTTON_INPUT, &MainDlg::OnBnClickedButtonInput)
	ON_BN_CLICKED(IDC_BUTTON_DOWNLOAD, &MainDlg::OnBnClickedButtonDownload)
	ON_BN_CLICKED(IDC_BUTTON_REGISTER, &MainDlg::OnBnClickedButtonRegister)
	ON_BN_CLICKED(IDC_BUTTON_OUTPUT, &MainDlg::OnBnClickedButtonOutput)
	ON_BN_CLICKED(IDC_BUTTON_SETLINE, &MainDlg::OnBnClickedButtonSetline)
	ON_BN_CLICKED(IDC_BUTTON_DELETE, &MainDlg::OnBnClickedButtonDelete)
	ON_BN_CLICKED(IDC_BUTTON_IMPORT, &MainDlg::OnBnClickedButtonImport)
	ON_BN_CLICKED(IDC_BUTTON_FIND, &MainDlg::OnBnClickedButtonFind)
END_MESSAGE_MAP()


// MainDlg ��Ϣ�������

//�ַ����ֶκ���
vector<string> split(const string& s, const string& c){
	vector<string> v;
	int pos1 = 0, pos2;
	while ((pos2 = s.find(c, pos1)) != -1){
		v.push_back(s.substr(pos1, pos2 - pos1));
		pos1 = pos2 + c.size();
	}
	if (pos1 != s.length())
		v.push_back(s.substr(pos1));
	return v;
}

//��ʼ������
BOOL MainDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	//��Ⱦ ���� List Control �б���
	old_list.InsertColumn(0, _T("����"), LVCFMT_LEFT, 60);
	old_list.InsertColumn(1, _T("��ѧ"), LVCFMT_LEFT, 44);
	old_list.InsertColumn(2, _T("����"), LVCFMT_LEFT, 44);
	old_list.InsertColumn(3, _T("Ӣ��"), LVCFMT_LEFT, 44);
	old_list.InsertColumn(4, _T("רҵ��"), LVCFMT_LEFT, 60);
	new_list.InsertColumn(0, _T("����"), LVCFMT_LEFT, 60);
	new_list.InsertColumn(1, _T("��ѧ"), LVCFMT_LEFT, 44);
	new_list.InsertColumn(2, _T("����"), LVCFMT_LEFT, 44);
	new_list.InsertColumn(3, _T("Ӣ��"), LVCFMT_LEFT, 44);
	new_list.InsertColumn(4, _T("רҵ��"), LVCFMT_LEFT, 60);
	CString temp(_uname.c_str());
	SetDlgItemText(IDC_EDIT_WEL, _T("��ӭ����") + temp);
	old_list.SetExtendedStyle(LVS_EX_FULLROWSELECT | LVS_EX_GRIDLINES);
	new_list.SetExtendedStyle(LVS_EX_FULLROWSELECT | LVS_EX_GRIDLINES);
	return TRUE;
}

//�ֶ�����
void MainDlg::OnBnClickedButtonInput()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	CString n,ma,c,e,mj;
	GetDlgItemText(IDC_EDIT_NAME, n);
	GetDlgItemText(IDC_EDIT_MATH, ma);
	GetDlgItemText(IDC_EDIT_CHINESE, c);
	GetDlgItemText(IDC_EDIT_ENGLISH, e);
	GetDlgItemText(IDC_EDIT_MAJOR, mj);
	string name = CT2A(n.GetBuffer());
	if (n == ""){
		MessageBox(_T("��������Ϊ��"));
		return;
	}
	int count = old_list.GetItemCount();
	old_list.InsertItem(count, n);
	old_list.SetItemText(count, 1, ma);
	old_list.SetItemText(count, 2, c);
	old_list.SetItemText(count, 3, e);
	old_list.SetItemText(count, 4, mj);
	SetDlgItemText(IDC_EDIT_NAME, _T(""));
	SetDlgItemText(IDC_EDIT_MATH, _T("0"));
	SetDlgItemText(IDC_EDIT_CHINESE, _T("0"));
	SetDlgItemText(IDC_EDIT_ENGLISH, _T("0"));
	SetDlgItemText(IDC_EDIT_MAJOR, _T("0"));
}

//�ļ�����
void MainDlg::OnBnClickedButtonImport()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	CFileDialog OpenDlg = CFileDialog(TRUE, _T("txt"), _T(""), OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT, _T("Text File(*.txt)|*.txt\0"), NULL);
	OpenDlg.m_ofn.lpstrTitle = _T("Open File");
	if (IDOK == OpenDlg.DoModal())
	{
		CFile File;
		CFileException e;
		if (!File.Open(OpenDlg.GetPathName(), CFile::modeRead, &e))
		{
			CString strErr;
			strErr.Format(_T("File could not be opened %d\n"), e.m_cause);
			MessageBox(strErr);
		}
		//����ָ����С��Buffer
		DWORD  dwFileLenth = (DWORD)File.GetLength();
		//��ʼ��buffer�� ����һ��/0�ռ�
		char *pBuf = new char[dwFileLenth + 1];
		memset(pBuf, 0, dwFileLenth + 1);
		if (pBuf != NULL)
		{
			//��ȡ�ļ�����
			File.Read(pBuf, dwFileLenth);
			File.Close();
			string s(pBuf);

			vector<string> temp;
			temp = split(s, "\r\n");
			delete[] pBuf;
			pBuf = NULL;
			for (string str : temp){
				string name = str.substr(0, str.find_first_of(":"));
				vector<string> t = split(str.substr(str.find_first_of(":") + 1), ",");
				string math = t[0];
				string chinese = t[1];
				string english = t[2];
				string major = t[3];
				int count = old_list.GetItemCount();
				old_list.InsertItem(count, (CString)name.c_str());
				old_list.SetItemText(count, 1, (CString)math.c_str());
				old_list.SetItemText(count, 2, (CString)chinese.c_str());
				old_list.SetItemText(count, 3, (CString)english.c_str());
				old_list.SetItemText(count, 4, (CString)major.c_str());
			}
		}
	}

}

//����������
void MainDlg::OnBnClickedButtonSetline()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	CString a_line, ma_line, ch_line, en_line, mj_line;
	GetDlgItemText(IDC_EDIT_ALL_LINE, a_line);
	GetDlgItemText(IDC_EDIT_MATH_LINE, ma_line);
	GetDlgItemText(IDC_EDIT_CHINESE_LINE, ch_line);
	GetDlgItemText(IDC_EDIT_ENGLISH_LINE, en_line);
	GetDlgItemText(IDC_EDIT_MAJOR_LINE, mj_line);
	all_line = atoi(CT2A(a_line.GetBuffer()));
	math_line = atoi(CT2A(ma_line.GetBuffer()));
	chinese_line = atoi(CT2A(ch_line.GetBuffer()));
	english_line = atoi(CT2A(en_line.GetBuffer()));
	major_line = atoi(CT2A(mj_line.GetBuffer()));
	line_flag = true;
	MessageBox(_T("���������óɹ�"));
}

//���б���ɾ��
void MainDlg::OnBnClickedButtonDelete()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	POSITION ps;
	ps = old_list.GetFirstSelectedItemPosition();
	old_list.DeleteItem(old_list.GetNextSelectedItem(ps));
}

//���µ�List control������ɸѡ�������
void MainDlg::OnBnClickedButtonOutput()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	if (!line_flag){
		MessageBox(_T("�������÷�����"));
		return;
	}
	new_list.DeleteAllItems();
	int i = old_list.GetItemCount();
	for (int n = 0; n<i; n++){
		CString name = old_list.GetItemText(n, 0);
		CString ma = old_list.GetItemText(n, 1);
		CString c = old_list.GetItemText(n, 2);
		CString e = old_list.GetItemText(n, 3);
		CString mj = old_list.GetItemText(n, 4);
		if (check(ma, c, e, mj)){
			int count = new_list.GetItemCount();
			new_list.InsertItem(count, name);
			new_list.SetItemText(count, 1, ma);
			new_list.SetItemText(count, 2, c);
			new_list.SetItemText(count, 3, e);
			new_list.SetItemText(count, 4, mj);
		}
	}
	MessageBox(_T("���ɳɹ�"));
	download.ShowWindow(SW_SHOW);
}

//���������.txt�ļ�
void MainDlg::OnBnClickedButtonDownload()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	CFileDialog OpenDlg = CFileDialog(FALSE, _T("txt"), _T("���Խ��"), OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT, NULL, NULL);
	OpenDlg.m_ofn.lpstrTitle = _T("Save File");
	string defname("���Խ��");
	CString defName = (CString)defname.c_str();
	OpenDlg.m_ofn.lpstrFile = defName.GetBuffer(MAX_PATH);
	OpenDlg.m_ofn.nMaxFile = MAX_PATH;

	if (IDOK == OpenDlg.DoModal())
	{
		CFile File;
		CFileException e;
		if (!File.Open(OpenDlg.GetPathName(), CFile::modeCreate, &e))
		{
			CString strErr;
			strErr.Format(_T("File could not be opened %d\n"), e.m_cause);
			MessageBox(strErr);
			return;
		}
		CString path = File.GetFilePath();
		File.Close();
		ofstream fout(CT2A(path.GetBuffer()), ios::app);
		int i = new_list.GetItemCount();
		for (int n = 0; n<i; n++){
			string temp;
			string name = CT2A(new_list.GetItemText(n, 0));
			string ma = CT2A(new_list.GetItemText(n, 1));
			string c = CT2A(new_list.GetItemText(n, 2));
			string e = CT2A(new_list.GetItemText(n, 3));
			string mj = CT2A(new_list.GetItemText(n, 4));
			temp = name + ":" + ma + "," + c + "," + e + "," + mj + "\n";
			fout << temp.c_str();
		}
		fout.close();
		defName.ReleaseBuffer();
		MessageBox(_T("�����ɹ���"));
	}
}

//������û�
void MainDlg::OnBnClickedButtonRegister()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	RegDlg r;
	r.DoModal();
}

//���ݷ����߽���˧ѡ
bool MainDlg::check(CString ma, CString c, CString e, CString mj){
	int math = atoi(CT2A(ma.GetBuffer()));
	int chinese = atoi(CT2A(c.GetBuffer()));
	int english = atoi(CT2A(e.GetBuffer()));
	int major = atoi(CT2A(mj.GetBuffer()));
	if (math >= math_line && chinese >= chinese_line && english >= english_line && major >= major_line
		&& (math + chinese + english + major) >= all_line
		){
		return true;
	}
	return false;
}

//�����������ҳɼ�
void MainDlg::OnBnClickedButtonFind()
{
	// TODO:  �ڴ���ӿؼ�֪ͨ����������
	CString key;
	GetDlgItemText(IDC_EDIT_FINDKEY, key);
	new_list.DeleteAllItems();
	std::string name1 = CT2A(key.GetBuffer());
	int i = old_list.GetItemCount();
	for (int n=0; n<i; n++){
		CString s = old_list.GetItemText(n, 0);
		std::string name2 = CT2A(s.GetBuffer());
		if (name1==name2){
			int count = new_list.GetItemCount();
			new_list.InsertItem(count, s);
			new_list.SetItemText(count, 1, old_list.GetItemText(n, 1));
			new_list.SetItemText(count, 2, old_list.GetItemText(n, 2));
			new_list.SetItemText(count, 3, old_list.GetItemText(n, 3));
			new_list.SetItemText(count, 4, old_list.GetItemText(n, 4));
		}
	}
}
