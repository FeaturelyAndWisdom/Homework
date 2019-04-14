using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Clazz 的摘要说明
/// </summary>
public class Clazz
{
    private int cid;
    private String cname;
    private int mid;
    private String mname;

    public Clazz(){}

    public Clazz(string cname, int mid)
    {
        this.cname = cname;
        this.mid = mid;
    }

    public Clazz(int cid, string cname, int mid, string mname)
    {
        this.cid = cid;
        this.cname = cname;
        this.mid = mid;
        this.mname = mname;
    }

    public int Cid
    {
        get
        {
            return cid;
        }

        set
        {
            cid = value;
        }
    }

    public string Cname
    {
        get
        {
            return cname;
        }

        set
        {
            cname = value;
        }
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
}