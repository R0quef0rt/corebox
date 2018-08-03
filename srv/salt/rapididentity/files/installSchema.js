var schemaFile = "schema.ldif";

// get root DSE object
var rootDSEObject = GetObject("LDAP://RootDSE");

// get dns name of server with root DSE
var dseServer = rootDSEObject.Get("dnsHostName");

// get the schema root DN
var schemaRootDN = rootDSEObject.Get("schemaNamingContext");

// get the schema root object
var schemaRootObject = GetObject("LDAP://" + dseServer + "/" + schemaRootDN);

// get the schema root master dn
var fsmoRoleOwnerDN = schemaRootObject.Get("fsmoRoleOwner");
var fsmoRoleOwnerParentDN = fsmoRoleOwnerDN.replace(/CN=NTDS Settings,\s*/i,"");

// get the schema master dns name
var fsmoRoleOwnerParentObject = GetObject("LDAP://" + dseServer + "/" + fsmoRoleOwnerParentDN);
var schemaMaster = fsmoRoleOwnerParentObject.Get("dnsHostName");


// get the directory of this script
var scriptDir = WScript.ScriptFullName.substring(0, WScript.ScriptFullName.length - WScript.ScriptName.length-1);

// ok, now we have what we need to run LDIFDE
var shell = new ActiveXObject("WScript.Shell");
var command = "LDIFDE -k -i -f \"" + scriptDir + "\\" + schemaFile + "\" -c CN=Schema,CN=Configuration,DC=example,DC=com " + schemaRootDN + " -s " + schemaMaster + " -j \"" + scriptDir + "\"";
//WScript.Echo(command);

var oExec = shell.Exec(command);

// let the user see what happened

function ReadAllFromAny(oExec)
{
    if (!oExec.StdOut.AtEndOfStream)
        return oExec.StdOut.ReadAll();

    if (!oExec.StdErr.AtEndOfStream)
        return "STDERR: " + oExec.StdErr.ReadAll();

    return -1;
}

var allInput = "";
var tryCount = 0;

while (true)
{
    var input = ReadAllFromAny(oExec);
    if (-1 == input)
    {
        if (tryCount++ > 10 && oExec.Status == 1)
            break;
        WScript.Sleep(100);
    }
    else
    {
        allInput += input;
        tryCount = 0;
    }
}

WScript.Echo(allInput);
