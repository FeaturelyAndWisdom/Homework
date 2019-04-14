using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
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

    public Boolean save(Lesson les)
    {
        String sql = "insert into lesson(lname,source,doout,mid,[type],hard,sumwork,context,tid) values('"+les.Lname+"','"+les.Source+ "','" + les.Doout + "','" + les.Mid + "','" + les.Type + "','" + les.Hard + "','" + les.Sumwork + "','" + les.Context + "','"+les.Tid+"')";
        int count = dbHeaper.executeUpdate(sql);
        if (count > 0)
        {
            return true;
        }
        return false;
    }

    public Boolean delByLid(int lid)
    {
        String sql = "delete lesson where lid="+lid+"";
        int count = dbHeaper.executeUpdate(sql);
        if (count > 0)
        {
            return true;
        }
        return false;
    }

    public Boolean delBySid(string sid)
    {
        String sql = "delete grade where sid='" + sid + "'";
        int count = dbHeaper.executeUpdate(sql);
        if (count > 0)
        {
            return true;
        }
        return false;
    }

    public Boolean update(Lesson les)
    {
        String sql = "update lesson set lname='"+les.Lname+ "',source='" + les.Source + "',doout='" + les.Doout + "',mid='" + les.Mid + "',[type]='" + les.Type + "',hard='" + les.Hard + "',sumwork='" + les.Sumwork + "',context='" + les.Context + "' where lid='" + les.Lid + "'";
        int count = dbHeaper.executeUpdate(sql);
        if (count > 0)
        {
            return true;
        }
        return false;
    }

    public Lesson findById(int lid)
    {
        String sql = "select * from teales where lid=" + lid + "";
        Lesson les = null;
        SqlDataReader rs = dbHeaper.executeQuery(sql);
        if (rs.Read())
        {
            les = new Lesson(rs.GetInt32(0),rs.GetString(1), rs.GetString(2), rs.GetString(3), rs.GetInt32(4), rs.GetString(5), rs.GetString(6), rs.GetString(7), rs.GetString(8), rs.GetInt32(9), rs.GetString(10),rs.GetString(11), rs.GetString(12));
        }
        return les;
    }

    public List<Lesson> findByKey(string key)
    {
        String sql = "select * from teales where lname like '%" + key + "%' or tname like '%" + key + "%' or tid like '%" + key + "%'";
        List<Lesson> lst = new List<Lesson>();
        Lesson les = null;
        SqlDataReader rs = dbHeaper.executeQuery(sql);
        while(rs.Read())
        {
            les = new Lesson(rs.GetInt32(0), rs.GetString(1), rs.GetString(2), rs.GetString(3), rs.GetInt32(4), rs.GetString(5), rs.GetString(6), rs.GetString(7), rs.GetString(8), rs.GetInt32(10), rs.GetString(9), rs.GetString(11), rs.GetString(12));
            lst.Add(les);
        }
        return lst;
    }

    public Boolean passLes(int lid)
    {
        String sql = "update lesson set state=1 where lid=" + lid;
        int count = dbHeaper.executeUpdate(sql);
        if (count > 0)
        {
            return true;
        }
        return false;
    }

    public Boolean chooseLes(String sid,int lid)
    {
        String sql = "insert into grade(lid,sid) values(" + lid + ",'" + sid + "')";
        int count = dbHeaper.executeUpdate(sql);
        if (count > 0)
        {
            return true;
        }
        return false;
    }
}