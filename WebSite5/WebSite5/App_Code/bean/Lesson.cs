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
    private DateTime starttime;
    private DateTime endtime;
    private String type;
    private int lesTime;
    private int lesGrade;
    private int state;

    public Lesson()
    {
    }

    public Lesson(int lid, string lname, DateTime starttime, DateTime endtime, string type, int lesTime, int lesGrade, int state)
    {
        this.Lid = lid;
        this.Lname = lname;
        this.Starttime = starttime;
        this.Endtime = endtime;
        this.Type = type;
        this.LesTime = lesTime;
        this.LesGrade = lesGrade;
        this.State = state;
    }

    public int Lid { get => lid; set => lid = value; }
    public string Lname { get => lname; set => lname = value; }
    public DateTime Starttime { get => starttime; set => starttime = value; }
    public DateTime Endtime { get => endtime; set => endtime = value; }
    public string Type { get => type; set => type = value; }
    public int LesTime { get => lesTime; set => lesTime = value; }
    public int LesGrade { get => lesGrade; set => lesGrade = value; }
    public int State { get => state; set => state = value; }
}