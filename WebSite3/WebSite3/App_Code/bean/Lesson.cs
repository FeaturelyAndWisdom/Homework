using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Lesson 的摘要说明
/// </summary>
public class Lesson
{
    private int lid;
    private String lname;
    private String source;
    private String doout;
    private int mid;
    private String mname;
    private String type;
    private String hard;
    private String sumwork;
    private String context;
    private int state;
    private String tid;
    private String tname;

    public Lesson()
    {
    }

    public Lesson(string lname, string source, string doout, int mid, string type, string hard, string sumwork, string context,string tid)
    {
        this.Lname = lname;
        this.Source = source;
        this.Doout = doout;
        this.Mid = mid;
        this.Type = type;
        this.Hard = hard;
        this.Sumwork = sumwork;
        this.Context = context;
        this.tid = tid;
    }

    public Lesson(int lid, string lname, string source, string doout, int mid, string type, string hard, string sumwork, string context, int state, string tid, string tname, string mname)
    {
        this.Lid = lid;
        this.Lname = lname;
        this.Source = source;
        this.Doout = doout;
        this.Mid = mid;
        this.Mname = mname;
        this.Type = type;
        this.Hard = hard;
        this.Sumwork = sumwork;
        this.Context = context;
        this.state = state;
        this.tid = tid;
        this.tname = tname;
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

    public string Source
    {
        get
        {
            return source;
        }

        set
        {
            source = value;
        }
    }

    public string Doout
    {
        get
        {
            return doout;
        }

        set
        {
            doout = value;
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

    public string Type
    {
        get
        {
            return type;
        }

        set
        {
            type = value;
        }
    }

    public string Hard
    {
        get
        {
            return hard;
        }

        set
        {
            hard = value;
        }
    }

    public string Sumwork
    {
        get
        {
            return sumwork;
        }

        set
        {
            sumwork = value;
        }
    }

    public string Context
    {
        get
        {
            return context;
        }

        set
        {
            context = value;
        }
    }

    public int State
    {
        get
        {
            return state;
        }

        set
        {
            state = value;
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