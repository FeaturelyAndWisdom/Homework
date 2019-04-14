using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// bookType 的摘要说明
/// </summary>
public class bookType
{
    private String typeName;
    private String parTypeName;
    private String context;
    public bookType()
    {}

    public bookType(string typeName, string parTypeName, string context)
    {
        this.typeName = typeName;
        this.parTypeName = parTypeName;
        this.context = context;
    }

    public string TypeName { get => typeName; set => typeName = value; }
    public string ParTypeName { get => parTypeName; set => parTypeName = value; }
    public string Context { get => context; set => context = value; }
}