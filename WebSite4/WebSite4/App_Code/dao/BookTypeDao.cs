using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// BookTypeDao 的摘要说明
/// </summary>
public class BookTypeDao
{
    private DbHeaper dbHeaper;

    public BookTypeDao()
    {
        dbHeaper = new DbHeaper();
    }

    public Boolean save(bookType bt)
    {
        String sql = "insert into booktype(typename,parTypename,context) values('" + bt.TypeName + "','" + bt.ParTypeName + "','" + bt.Context + "')";
        int count = dbHeaper.executeUpdate(sql);
        if (count > 0)
        {
            return true;
        }
        return false;
    }

    public Boolean del(String name)
    {
        String sql = "update bookType set isdel=1 where typename='" + name + "'";
        int count = dbHeaper.executeUpdate(sql);
        if (count > 0)
        {
            return true;
        }
        return false;
    }
}