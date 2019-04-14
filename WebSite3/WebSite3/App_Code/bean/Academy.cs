using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Academy 的摘要说明
/// </summary>
public class Academy
{
    private int aid;
    private String aname;
    private String tid;
    private String tname;

    public Academy(){}

    public Academy(string aname, string tid)
    {
        this.aname = aname;
        this.tid = tid;
    }

    public Academy(int aid, string aname, string tid, string tname)
    {
        this.aid = aid;
        this.aname = aname;
        this.tid = tid;
        this.tname = tname;
    }

    public int Aid
    {
        get
        {
            return aid;
        }

        set
        {
            aid = value;
        }
    }

    public string Aname
    {
        get
        {
            return aname;
        }

        set
        {
            aname = value;
        }
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
}