using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Major 的摘要说明
/// </summary>
public class Major
{
    private int mid;
    private String mname;
    private int aid;
    private String acadname;

    public Major(){}

    public Major(string mname, int aid)
    {
        this.mname = mname;
        this.aid = aid;
    }

    public Major(int mid, string mname, int aid, string acadname)
    {
        this.mid = mid;
        this.mname = mname;
        this.aid = aid;
        this.acadname = acadname;
    }

    public int Mid
    {
        get
        {
            return mid;
        }

        set
        {
            mid = value;
        }
    }

    public string Mname
    {
        get
        {
            return mname;
        }

        set
        {
            mname = value;
        }
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

    public string Acadname
    {
        get
        {
            return acadname;
        }

        set
        {
            acadname = value;
        }
    }
}