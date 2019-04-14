using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;


/// <summary>
/// DbHeaper 的摘要说明
/// </summary>
public class DbHeaper
{
    private SqlConnection conn;
    private SqlCommand cmd;
    private SqlDataReader rs;
    
	public DbHeaper()
	{
        this.conn = new SqlConnection();
        string str = "Data Source=DESKTOP-T9I15RN;Initial Catalog=mydb2;Persist Security Info=True;User ID=sa;Password=sa";
        this.conn.ConnectionString = str;
        this.conn.Open();
	}
    

    public void close()
    {
        try
        {
            if (this.rs != null)
            {
                this.rs.Close();
            }
            if (this.conn != null)
            {
                this.conn.Close();
            }
        }
        catch { }
        
        
    }

    public int executeUpdate(String sql)
    {
        if (!conn.State.ToString().Equals("Close"))
        {
            conn.Close();
            conn.Open();
        }
        int count = -1;
        this.cmd = new SqlCommand(sql,this.conn);
        try
        {
            count = this.cmd.ExecuteNonQuery();
        }
        catch { }
        finally
        {
            this.close();
        }
        return count;
    }

    public SqlDataReader executeQuery(String sql)
    {
        if (this.rs != null)
        {
            this.rs.Close();
        }
        if (!conn.State.ToString().Equals("Close"))
        {
            conn.Close();
            conn.Open();
        }
        this.cmd = new SqlCommand(sql, this.conn);
        this.rs = this.cmd.ExecuteReader();
        return this.rs;
    }

    public Boolean executeTransactionUpdate(String[] sqls)
    {
        //if (this.rs != null)
        //{
        //    this.rs.Close();
        //}
        this.cmd = new SqlCommand();
        this.cmd.Connection = this.conn;
        SqlTransaction st = this.conn.BeginTransaction();
        this.cmd.Transaction = st;
        try
        {
            for(int i = 0; i < sqls.Length; i++)
            {
                this.cmd.CommandText = sqls[i];
                this.cmd.ExecuteNonQuery();
            }
            st.Commit();
            return true;
        }
        catch (Exception ex) { st.Rollback(); }
        finally
        {
            this.close();
        }
        return false;
    }
}