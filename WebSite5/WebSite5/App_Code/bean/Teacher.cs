using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Teacher 的摘要说明
/// </summary>
public class Teacher
{
    private String tid;
    private String tname;
    private String sex;
    private DateTime birthday;
    private String email;
    private String tel;
    private String academy;
    private String stuDeep;
    private String address;
    private String pwd;

    public Teacher(){}

    public Teacher(string tid, string tname, string sex, DateTime birthday, string email, string tel, string academy, string stuDeep, string address)
    {
        this.tid = tid;
        this.tname = tname;
        this.sex = sex;
        this.birthday = birthday;
        this.email = email;
        this.tel = tel;
        this.academy = academy;
        this.stuDeep = stuDeep;
        this.address = address;
    }

    public Teacher(string tid, string pwd)
    {
        this.tid = tid;
        this.pwd = pwd;
    }

    public string Tid
    {
        get
        {
            return tid;
        }

        set
        {
            tid = value;
        }
    }

    public string Tname
    {
        get
        {
            return tname;
        }

        set
        {
            tname = value;
        }
    }

    public string Sex
    {
        get
        {
            return sex;
        }

        set
        {
            sex = value;
        }
    }

    public DateTime Birthday
    {
        get
        {
            return birthday;
        }

        set
        {
            birthday = value;
        }
    }

    public string Email
    {
        get
        {
            return email;
        }

        set
        {
            email = value;
        }
    }

    public string Tel
    {
        get
        {
            return tel;
        }

        set
        {
            tel = value;
        }
    }

    public string Academy
    {
        get
        {
            return academy;
        }

        set
        {
            academy = value;
        }
    }

    public string StuDeep
    {
        get
        {
            return stuDeep;
        }

        set
        {
            stuDeep = value;
        }
    }

    public string Address
    {
        get
        {
            return address;
        }

        set
        {
            address = value;
        }
    }

    public string Pwd
    {
        get
        {
            return pwd;
        }

        set
        {
            pwd = value;
        }
    }
}