<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" id="traverse-2-0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text"/>

  <xsl:strip-space elements="*"/>

  <xsl:param name="eol" select="'&#xA;'"/>

  <xsl:template match="*|@*">
    <xsl:value-of select="'Le nom est : ',name()" separator=""/>
    <xsl:text> c&apos;est-à-dire : </xsl:text>
    <xsl:value-of select="namespace-uri(),', puis ',local-name(),'.',$eol,
                          'Les noms disponibles sont : ',$eol"
                  separator=""/>
    <xsl:for-each select="namespace::*">
      <xsl:value-of select="name(),', qui vaut : ',.,$eol" separator=""/>
    </xsl:for-each>
    <xsl:value-of select="'**********',$eol" separator=""/>
    <xsl:apply-templates select="@*"/>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="text()"/>

</xsl:stylesheet>
