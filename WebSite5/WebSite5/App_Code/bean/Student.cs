using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Student 的摘要说明
/// </summary>
public class Student
{
    private string sid;
    private string sname;
    private string sex;
    private string birthday;
    private string academy;
    private string major;
    private string clazz;
    private string email;
    private string tel;
    private string address;
    private string pwd;

    public Student() { }

    public Student(string sid, string sname, string sex, string birthday, string academy, string major, string clazz, string email, string tel, string address)
    {
        this.sid = sid;
        this.sname = sname;
        this.sex = sex;
        this.birthday = birthday;
        this.academy = academy;
        this.major = major;
        this.clazz = clazz;
        this.email = email;
        this.tel = tel;
        this.address = address;
    }

    public Student(string sid, string pwd)
    {
        this.sid = sid;
        this.pwd = pwd;
    }

    public string Sid
    {
        get
        {
            return sid;
        }

        set
        {
            sid = value;
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

    public string Sname
    {
        get
        {
            return sname;
        }

        set
        {
            sname = value;
        }
    }

    public string Birthday
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

    public string Major
    {
        get
        {
            return major;
        }

        set
        {
            major = value;
        }
    }

    public string Clazz
    {
        get
        {
            return clazz;
        }

        set
        {
            clazz = value;
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