using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// BookUser 的摘要说明
/// </summary>
public class BookUser
{
    private int uid;
    private String uname;
    private String realname;
    private String sex;
    private String birthday;
    private String address;
    private String email;
    private String tel;
    private String oldhome;
    private String pwd;


    public BookUser()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    public BookUser(int uid, string uname, string realname, string sex, string birthday, string address, string email, string tel, string oldhome)
    {
        this.uid = uid;
        this.uname = uname;
        this.realname = realname;
        this.sex = sex;
        this.birthday = birthday;
        this.address = address;
        this.email = email;
        this.tel = tel;
        this.oldhome = oldhome;
    }

    public BookUser(int uid, string uname, string realname, string sex, string birthday, string address, string email, string tel, string oldhome, string pwd)
    {
        this.uid = uid;
        this.uname = uname;
        this.realname = realname;
        this.sex = sex;
        this.birthday = birthday;
        this.address = address;
        this.email = email;
        this.tel = tel;
        this.oldhome = oldhome;
        this.pwd = pwd;
    }

    public BookUser(string uname, string pwd)
    {
        this.uname = uname;
        this.pwd = pwd;
    }

    public int Uid { get => uid; set => uid = value; }
    public string Uname { get => uname; set => uname = value; }
    public string Pwd { get => pwd; set => pwd = value; }
    public string Realname { get => realname; set => realname = value; }
    public string Sex { get => sex; set => sex = value; }
    public string Birthday { get => birthday; set => birthday = value; }
    public string Address { get => address; set => address = value; }
    public string Email { get => email; set => email = value; }
    public string Tel { get => tel; set => tel = value; }
    public string Oldhome { get => oldhome; set => oldhome = value; }
}