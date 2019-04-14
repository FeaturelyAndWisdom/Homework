using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data.SqlClient;
/// <summary>
/// StuDao 的摘要说明
/// </summary>
public class StuDao
{
    private DbHeaper dbHeaper;

    public StuDao(){
        
    }

    public Boolean save(Student s)
    {
        this.dbHeaper = new DbHeaper();
        UserDao udao = new UserDao();
        String sql2 = "insert into user(account,pwd,roleId) values('" + s.Sid + "','" + s.Pwd + "','" + 1 + "')";
        String sql = "insert into user(sid,sname,sex,birthday,academy,major,clazz,email,tel,inTime,stuYear,address) " +
                        "values('"+s.Sid+"','"+s.Sname+"','"+s.Sex+"','"+s.Birthday+"','"+s.Academy+"','"+s.Major+ "','"+s.Clazz+"'," +
                        "'"+s.Email+"','"+s.Tel+"','"+s.Address+"')";
        String[] sqls = new string[2];
        sqls[0] = sql;
        sqls[1] = sql2;
        Boolean flag = dbHeaper.executeTransactionUpdate(sqls);
        return flag;
    }

    public Boolean update(Student s)
    {
        this.dbHeaper = new DbHeaper();
        String sql = "update student set sname='"+s.Sname+ "',sex='" + s.Sex + "',birthday='" + s.Birthday + "',academy='" + s.Academy + "'," +
                     "major='" + s.Major  + "',clazz='" + s.Clazz  + "',email='" + s.Email + "',tel='" + s.Tel + "'," +
                     "address='" + s.Address  + "' where sid='" + s.Sid + "'";
        int count = this.dbHeaper.executeUpdate(sql);
        if (count > 0)
        {
            return true;
        }
        return false;
    }

    public Boolean del(string sid)
    {
        this.dbHeaper = new DbHeaper();
        UserDao udao = new UserDao();
        if (udao.delById(sid))
        {
            string sql = "update student set isDel=1 where sid='" + sid + "'";
            int count = this.dbHeaper.executeUpdate(sql);
            if (count > 0)
            {
                return true;
            }
        }
        return false;
    }

    public Student findById(string sid)
    {
        this.dbHeaper = new DbHeaper();
        String sql = "select * from student where sid='" + sid + "'";
        SqlDataReader rs = dbHeaper.executeQuery(sql);
        Student s = null;
        if (rs.Read())
        {
            s = new Student(rs.GetString(0), rs.GetString(1), rs.GetString(2), rs.GetDateTime(3), rs.GetString(4), rs.GetString(5), rs.GetString(6), rs.GetString(7), rs.GetString(8), rs.GetString(9));
        }
        return s;
    }

    public List<Student> findAll()
    {
        return null;
    }

    public List<Student> findByKey(string key)
    {
        this.dbHeaper = new DbHeaper();
        List<Student> lst = new List<Student>();
        Student s = null;
        string sql = "select sid,name,sex,major,grade from student where isDel='0' and grade like '%" + key + "%' or major like '%" + key + "%'";
        SqlDataReader rs = this.dbHeaper.executeQuery(sql);
        while (rs.Read())
        {
            s = new Student(rs.GetString(0), rs.GetString(1), rs.GetString(2), rs.GetDateTime(3), rs.GetString(4), rs.GetString(5), rs.GetString(6), rs.GetString(7), rs.GetString(8), rs.GetString(9));
            lst.Add(s);
        }
        dbHeaper.close();
        return lst;
    }
}