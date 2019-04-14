using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
/// <summary>
/// TeaDao 的摘要说明
/// </summary>
public class TeaDao
{
    DbHeaper dbHeaper;
    public TeaDao()
    {
        dbHeaper = new DbHeaper();
    }

    public Teacher logByTid(Teacher t)
    {
        String sql = "select * from teacher where tid='" + t.Tid + "' and pwd='" + t.Pwd + "'";
        SqlDataReader rs = dbHeaper.executeQuery(sql);
        Teacher tea = null;
        if (rs.Read())
        {
            tea = new Teacher(rs.GetString(0), rs.GetString(1), rs.GetString(2), rs.GetDateTime(3), rs.GetString(4), rs.GetString(5), rs.GetString(6), rs.GetString(7), rs.GetString(8));
        }
        return tea;
    }

    public Boolean changePwd(Teacher t)
    {
        String sql = "update teacher set pwd='" + t.Pwd + "' where tid='" + t.Tid + "'";
        int count = dbHeaper.executeUpdate(sql);
        if (count > 0)
        {
            return true;
        }
        return false;
    }

    public Boolean checkPwd(Teacher t)
    {
        String sql = "select * from teacher where tid='" + t.Tid + "' and pwd='" + t.Pwd+ "'";
        SqlDataReader rs = dbHeaper.executeQuery(sql);
        if (rs.Read())
        {
            return true;
        }
        return false;
    }
}