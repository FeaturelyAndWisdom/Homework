using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// BookInfo 的摘要说明
/// </summary>
public class BookInfo
{
    private int bookId;
    private String bookName;
    private String booktypeName;
    private String author;
    private String pbName;
    private String context;
    private double price;
    private String pbdate;
    private String state;
    private int num;
    private int count;

    public BookInfo()
    {
    }

    public BookInfo(string bookName, string booktypeName, string author, string pbName, string context, double price, string pbdate, string state, int num)
    {
        this.bookName = bookName;
        this.booktypeName = booktypeName;
        this.author = author;
        this.pbName = pbName;
        this.context = context;
        this.pbdate = pbdate;
        this.price = price;
        this.state = state;
        this.num = num;
    }

    public BookInfo(int bookId, string bookName, string booktypeName, string author, string pbName, string context, double price, string pbdate, string state, int num, int count)
    {
        this.bookId = bookId;
        this.bookName = bookName;
        this.booktypeName = booktypeName;
        this.author = author;
        this.pbName = pbName;
        this.context = context;
        this.pbdate = pbdate;
        this.price = price;
        this.state = state;
        this.num = num;
        this.count = count;
    }

    public int BookId { get => bookId; set => bookId = value; }
    public string BookName { get => bookName; set => bookName = value; }
    public string BooktypeName { get => booktypeName; set => booktypeName = value; }
    public string Author { get => author; set => author = value; }
    public string PbName { get => pbName; set => pbName = value; }
    public string Context { get => context; set => context = value; }
    public string Pbdate { get => pbdate; set => pbdate = value; }
    public double Price { get => price; set => price = value; }
    public string State { get => state; set => state = value; }
    public int Num { get => num; set => num = value; }
    public int Count { get => count; set => count = value; }
}