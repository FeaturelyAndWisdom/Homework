using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
/// <summary>
/// UserDao 的摘要说明
/// </summary>
public class UserDao
{
    private DbHeaper dbHeaper;

    public UserDao()
    {
        dbHeaper = new DbHeaper();
    }

    public Boolean save(BookUser us)
    {
        String sql = "insert into bookUser(uname,pwd) values('"+us.Uname+"','"+us.Pwd+"')";
        int count = dbHeaper.executeUpdate(sql);
        if (count > 0)
        {
            return true;
        }
        return false;
    }

    public Boolean checkPwd(BookUser us)
    {
        String sql = "select * from bookUser where uname='"+us.Uname+"' and pwd='"+us.Pwd+"'";
        SqlDataReader rs = dbHeaper.executeQuery(sql);
        if (rs.Read())
        {
            return true;
        }
        return false;
    }

    public Boolean changePwd(BookUser us)
    {
        String sql = "update set bookUser uname="+us.Uname+",pwd='"+us.Pwd+"' where uid="+us.Uid+"";
        int count = dbHeaper.executeUpdate(sql);
        if (count > 0)
        {
            return true;
        }
        return false;
    }

    public Boolean delByUid(int uid)
    {
        String sql = "update bookUser set isDel=1 where uid="+uid+"";
        int count = dbHeaper.executeUpdate(sql);
        if (count > 0)
        {
            return true;
        }
        return false;
    }

    public BookUser login(String uname,String pwd)
    {
        String sql = "select * from bookUser where uname='" + uname + "' and pwd='" + pwd + "'";
        SqlDataReader rs = dbHeaper.executeQuery(sql);
        BookUser user = null;
        if (rs.Read())
        {
            user = new BookUser(rs.GetInt32(0),rs.GetString(1), rs.GetString(2), rs.GetString(3), rs.GetDateTime(4)+"", rs.GetString(5), rs.GetString(6), rs.GetString(7), rs.GetString(8),rs.GetString(9));
        }
        return user;
    }

    public Boolean update(BookUser us) {
        String sql = "update bookUser set uname='"+us.Uname+"',realname='"+us.Realname+"',sex='"+us.Sex+"',birthday='"+us.Birthday+"',address='"+us.Address+"',email='"+us.Email+"',tel='"+us.Tel+"',oldhome='"+us.Oldhome+"' where uid=" + us.Uid + "";
        int count = dbHeaper.executeUpdate(sql);
        if (count > 0)
        {
            return true;
        }
        return false;
    }
    
    public BookUser findById(int uid)
    {
        String sql = "select * from bookUser where uid=" + uid;
        SqlDataReader rs = dbHeaper.executeQuery(sql);
        BookUser user = null;
        if (rs.Read()) {
            user = new BookUser(rs.GetInt32(0), rs.GetString(1), rs.GetString(2), rs.GetString(3), rs.GetDateTime(4) + "", rs.GetString(5), rs.GetString(6), rs.GetString(7), rs.GetString(8), rs.GetString(9));
        }
        return user;
    }
}