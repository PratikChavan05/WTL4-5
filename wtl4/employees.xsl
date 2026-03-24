<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" indent="yes"/>

<xsl:template match="/">

<html>
<head>

<title>Employee Information</title>

<style>
table{
border-collapse:collapse;
width:80%;
margin:auto;
font-family:Arial;
}

th{
background-color:#4CAF50;
color:white;
padding:10px;
}

td{
padding:8px;
text-align:center;
}

table,th,td{
border:1px solid black;
}

h2{
text-align:center;
}
</style>

</head>

<body>

<h2>Employee Information</h2>

<table>

<tr>
<th>Employee ID</th>
<th>Name</th>
<th>Department</th>
<th>Experience</th>
<th>Contact</th>
<th>Joining Date</th>
</tr>

<xsl:for-each select="organization/employee">

<xsl:sort select="department"/>
<xsl:sort select="experience" data-type="number"/>

<tr>

<td><xsl:value-of select="emp_id"/></td>

<td><xsl:value-of select="name"/></td>

<td><xsl:value-of select="department"/></td>

<td>

<xsl:choose>

<xsl:when test="experience &lt; 5">
<span style="color:red; font-weight:bold;">
<xsl:value-of select="experience"/> Years
</span>
</xsl:when>

<xsl:otherwise>
<span style="color:green; font-weight:bold;">
<xsl:value-of select="experience"/> Years
</span>
</xsl:otherwise>

</xsl:choose>

</td>

<td><xsl:value-of select="contact"/></td>

<td><xsl:value-of select="joining_date"/></td>

</tr>

</xsl:for-each>

</table>

</body>
</html>

</xsl:template>

</xsl:stylesheet>