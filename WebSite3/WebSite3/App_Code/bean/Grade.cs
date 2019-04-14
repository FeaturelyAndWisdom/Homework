using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Grade 的摘要说明
/// </summary>
public class Grade
{
    private int gid;
    private int lid;
    private String lname;
    private int sid;
    private String sname;
    private float result;
    private int tid;
    private String tname;
    private int state;

    public Grade(){}

    public Grade(int lid, int sid, float result)
    {
        this.lid = lid;
        this.sid = sid;
        this.result = result;
    }

    public Grade(int gid, int lid, string lname, int sid, string sname, float result,int tid,String tname,int state)
    {
        this.gid = gid;
        this.lid = lid;
        this.lname = lname;
        this.sid = sid;
        this.sname = sname;
        this.result = result;
        this.tid = tid;
        this.tname = tname;
        this.state = state;
    }

    public int Gid
    {
        get
        {
            return gid;
        }

        set
        {
            gid = value;
        }
    }

    public int Lid
    {
        get
        {
            return lid;
        }

        set
        {
            lid = value;
        }
    }

    public string Lname
    {
        get
        {
            return lname;
        }

        set
        {
            lname = value;
        }
    }

    public int Sid
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

    public float Result
    {
        get
        {
            return result;
        }

        set
        {
            result = value;
        }
    }

    public int Tid
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