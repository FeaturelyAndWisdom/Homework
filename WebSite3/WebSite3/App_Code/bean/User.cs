using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// User 的摘要说明
/// </summary>
public class User
{
    private String account;
    private String pwd;
    private String roleId;

    public User()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    public User(string account, string pwd)
    {
        this.account = account;
        this.pwd = pwd;
    }

    public User(string account, string pwd, string roleId)
    {
        this.account = account;
        this.pwd = pwd;
        this.roleId = roleId;
    }

    public string Account
    {
        get
        {
            return account;
        }

        set
        {
            account = value;
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

    public string RoleId
    {
        get
        {
            return roleId;
        }

        set
        {
            roleId = value;
        }
    }
}