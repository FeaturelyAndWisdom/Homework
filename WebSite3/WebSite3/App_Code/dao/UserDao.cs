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

    public User check(User us)
    {
        User user = null;
        String sql = "select * from [user] where account='"+us.Account+"' and pwd='"+us.Pwd+"'";
        SqlDataReader rs = dbHeaper.executeQuery(sql);
        if (rs.Read())
        {
            user = new User(rs.GetString(0), rs.GetString(1), rs.GetString(2));
        }
        return user;
    }

    public Student findStuBySid(User us)
    {
        Student stu = null;
        String sql = "select * from student where sid='" + us.Account + "'";
        SqlDataReader rs = dbHeaper.executeQuery(sql);
        if (rs.Read())
        {
            stu = new Student(rs.GetString(0), rs.GetString(1), rs.GetString(2), rs.GetDateTime(3), rs.GetString(4), rs.GetString(5), rs.GetString(6), rs.GetString(7), rs.GetString(8), rs.GetString(9));
        }
        return stu;
    }

    public Teacher findTeaBySid(User us)
    {
        Teacher tea = null;
        String sql = "select * from teacher where tid='" + us.Account + "'";
        SqlDataReader rs = dbHeaper.executeQuery(sql);
        if (rs.Read())
        {
            tea = new Teacher(rs.GetString(0), rs.GetString(1), rs.GetString(2), rs.GetDateTime(3), rs.GetString(4), rs.GetString(5), rs.GetString(6), rs.GetString(7), rs.GetString(8));
        }
        return tea;
    }

    public Boolean save(User us)
    {
        String sql = "insert into user(account,pwd,roleId) values('"+us.Account+"','"+us.Pwd+"','"+us.RoleId+"')";
        int count = dbHeaper.executeUpdate(sql);
        if (count > 0)
        {
            return true;
        }
        return false;
    }

    public Boolean checkPwd(User us)
    {
        String sql = "select * from [user] where account='" + us.Account + "' and pwd='" + us.Pwd+"'";
        SqlDataReader rs = dbHeaper.executeQuery(sql);
        User user = null;
        if (rs.Read())
        {
            return true;
        }
        return false;
    }

    public Boolean changePwd(User us)
    {
        String sql = "update [user] set pwd='"+us.Pwd+"' where account='"+us.Account+"'";
        int count = dbHeaper.executeUpdate(sql);
        if (count > 0)
        {
            return true;
        }
        return false;
    }

    public Boolean delById(String id)
    {
        String sql = "delete from user where account='" + id + "'";
        int count = dbHeaper.executeUpdate(sql);
        if (count > 0)
        {
            return true;
        }
        return false;
    }
}