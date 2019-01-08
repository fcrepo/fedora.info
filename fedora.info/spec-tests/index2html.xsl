<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:owl="http://www.w3.org/2002/07/owl#"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema#"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <xsl:output method="html"/>
  <xsl:template match="/index">
    <html>
      <head>
        <title><xsl:value-of select="pages/@title"/></title>
        <style>
          body { width: 80%; margin: 0 auto; }
          body { font-family: sans-serif; background: url(assets/cream_pixels.png);}
          header { text-align: center; }
          h1 { font-size: large; }
          table { border-collapse: collapse; }
          th, td {
            border: 2px solid black;
            padding: 10px;
            text-align: left;
          }
        </style>
      </head>
      <body>
        <header>
          <img src="assets/fedora_logo.png"/>
        </header>
        <xsl:for-each select="reports">
          <h1><xsl:value-of select="@title"/></h1>
          <table>
            <thead>
              <th>Fedora Implementation and Version</th>
              <th>Test Suite Version</th>
              <th>Pass</th>
              <th>Fail</th>
              <th>Skip</th>
            </thead>
            <tbody>
            <xsl:for-each select="report">
              <xsl:variable name="report_url" select="@url"/>
              <tr>
                <td>
                  <a href="{$report_url}"><xsl:value-of select="@implementation"/>&#160;<xsl:value-of select="@fedoraversion"/></a>
                </td>
                <td><xsl:value-of select="@testsuiteversion"/></td>
                <td><xsl:value-of select="@pass"/></td>
                <td><xsl:value-of select="@fail"/></td>
                <td><xsl:value-of select="@skip"/></td>
              </tr>
            </xsl:for-each>
          </tbody>
          </table>
        </xsl:for-each>

        <xsl:for-each select="items/item">
          <xsl:variable name="item_url" select="@url"/>
          <h1><a href="{$item_url}"><xsl:value-of select="@id"/></a></h1>
        </xsl:for-each>

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
