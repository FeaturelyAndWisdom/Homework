using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// LesDao 的摘要说明
/// </summary>
public class LesDao
{
    private DbHeaper dbHeaper;

    public LesDao()
    {
        dbHeaper = new DbHeaper();
    }

    public Boolean overLes(string lid)
    {
        String sql = "update lesson set state=1 where lid=" + lid;
        int count = dbHeaper.executeUpdate(sql);
        if (count > 0)
        {
            return true;
        }
        return false;
    }

    public Boolean grade(string sid,string tid,string lid,string grade)
    {
        String sql = "insert into stuandles(sid,lid,tid,grade) values('"+sid+"',"+lid+",'"+tid+"',"+grade+")";
        int count = dbHeaper.executeUpdate(sql);
        if (count > 0)
        {
            return true;
        }
        return false;
    }
}