using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
/// <summary>
/// BookDao 的摘要说明
/// </summary>
public class BookDao
{
    DbHeaper dbHeaper = null;
    public BookDao()
    {
        dbHeaper = new DbHeaper();
    }

    public Boolean save(BookInfo b)
    {
        String sql = "insert into bookInfo(bookName,booktypeId,author,pbName,context,price,pbdate,bookStates,num) values('" + b.BookName + "','" + b.BooktypeName + "','" + b.Author + "','" + b.PbName + "','" + b.Context + "'," + b.Price + ",'" + b.Pbdate + "','" + b.State + "'," + b.Num + ")";
        int count = dbHeaper.executeUpdate(sql);
        if (count > 0)
        {
            return true;
        }
        return false;
    }

    public Boolean update(BookInfo b)
    {
        String sql = "update bookInfo set bookName='"+b.BookName+"',booktypeId='"+b.BooktypeName+"',author='"+b.Author+"',pbName='"+b.PbName+"',context='"+b.Context+"',price="+b.Price+",pbdate='"+b.Pbdate+"',bookStates='"+b.State+"',num="+b.Num+" where bookId="+b.BookId+"";
        int count = dbHeaper.executeUpdate(sql);
        if (count > 0)
        {
            return true;
        }
        return false;
    }

    public Boolean del(String bookId)
    {
        String sql = "delete bookInfo where bookId=" + bookId;
        int count = dbHeaper.executeUpdate(sql);
        if (count > 0)
        {
            return true;
        }
        return false;
    }

    public BookInfo findById(String bookId)
    {
        String sql = "select * from bookInfo where bookId="+bookId;
        SqlDataReader rs = dbHeaper.executeQuery(sql);
        BookInfo b = null;
        if (rs.Read())
        {
            b = new BookInfo(rs.GetInt32(0), rs.GetString(1), rs.GetString(2), rs.GetString(3), rs.GetString(4), rs.GetString(5), double.Parse(rs.GetSqlMoney(6)+""), rs.GetDateTime(7)+"", rs.GetString(8), rs.GetInt32(9), rs.GetInt32(10));
        }
        return b;
    }
    

}