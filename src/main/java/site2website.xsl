<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/site">

    <website>
      <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
      <xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
      <description><xsl:value-of select="@description"/></description>
      <xsl:apply-templates select="/site/views/view"/>

    </website>

  </xsl:template>

  <xsl:template match="view">
    <page>
<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
      <xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
      <description><xsl:value-of select="description"/></description>
      <xsl:for-each select="component">

       <xsl:variable name="x" select="@ref"></xsl:variable>
          <xsl:apply-templates select ="/site/components/component[@id = $x]"/>


      </xsl:for-each>

    </page>
  </xsl:template>

  <xsl:template match="component[@id]">
    <widget>
      <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
      <xsl:attribute name="type"><xsl:value-of select="@type"/></xsl:attribute>
      <xsl:if test="(@type = 'TEXT')">
        <text>
          <xsl:value-of select="text"/>
        </text>
      </xsl:if>
      <xsl:if test="(@type = 'IMG')">
        <xsl:attribute name="src"><xsl:value-of select="@src"/></xsl:attribute>
      </xsl:if>

    <xsl:if test="(@type = 'YOUTUBE')">
<xsl:attribute name="url"><xsl:value-of select="@url"/></xsl:attribute>
    </xsl:if>

  <xsl:if test="(@type = 'BUTTON')">
<xsl:attribute name="label"><xsl:value-of select="@label"/></xsl:attribute>
  </xsl:if>


    </widget>
    </xsl:template>

</xsl:stylesheet>