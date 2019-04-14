using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
/// <summary>
/// StuDao 的摘要说明
/// </summary>
public class StuDao
{
    DbHeaper dbHeaper;

    public StuDao()
    {
        dbHeaper = new DbHeaper();
    }

    public Student logBySid(Student s)
    {
        String sql = "select * from student where sid='"+s.Sid+"' and pwd='"+s.Pwd+"'";
        SqlDataReader rs = dbHeaper.executeQuery(sql);
        Student stu = null;
        if (rs.Read())
        {
            stu = new Student(rs.GetString(0), rs.GetString(1), rs.GetString(2), rs.GetDateTime(3)+"", rs.GetString(4), rs.GetString(5), rs.GetString(6), rs.GetString(7), rs.GetString(8), rs.GetString(9));
        }
        return stu;
    }

    public Boolean changePwd(Student s)
    {
        String sql = "update student set pwd='"+s.Pwd+"' where sid='" + s.Sid + "'";
        int count = dbHeaper.executeUpdate(sql);
        if (count > 0)
        {
            return true;
        }
        return false;
    }

    public Boolean checkPwd(Student s)
    {
        String sql = "select * from student where sid='"+s.Sid+"' and pwd='"+s.Pwd+"'";
        SqlDataReader rs = dbHeaper.executeQuery(sql);
        if (rs.Read())
        {
            return true;
        }
        return false;
    }

    public Student findById(String sid)
    {
        String sql = "select * from student where sid='" + sid+"'";
        SqlDataReader rs = dbHeaper.executeQuery(sql);
        Student stu = null;
        if (rs.Read())
        {
            stu = new Student(rs.GetString(0), rs.GetString(1), rs.GetString(2), rs.GetDateTime(3) + "", rs.GetString(4), rs.GetString(5), rs.GetString(6), rs.GetString(7), rs.GetString(8), rs.GetString(9));
        }
        return stu;
    }
   
    public Boolean update(Student s)
    {
        String sql = "update student set sname='"+s.Sname+ "',sex='" + s.Sex + "',birthday='" + s.Birthday + "',academy='" + s.Academy + "',major='" + s.Major + "',clazz='" + s.Clazz + "',email='" + s.Email + "',tel='" + s.Tel + "',address='" + s.Address+ "' where sid='" + s.Sid+ "'";
        int count = dbHeaper.executeUpdate(sql);
        if (count > 0)
        {
            return true;
        }
        return false;
    }
}