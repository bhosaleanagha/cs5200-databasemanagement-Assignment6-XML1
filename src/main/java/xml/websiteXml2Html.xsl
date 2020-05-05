<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/website">

    <h1>Website</h1>
    <h2>Pages</h2>
    <ol>
    <xsl:for-each select="page">
<!--      <xsl:apply-templates select="/website/page"/>-->
      <li><xsl:value-of select="@name"/> , <xsl:value-of select="description"/>
      </li>
    </xsl:for-each >
    </ol>

    <table>
      <thead>
        <tr>
          <th>id</th>
          <th>type</th>
          <th>text</th>
          <th>src</th>
          <th>url</th>
          <th>label</th>
        </tr>
      </thead>
      <tbody>

        <xsl:for-each-group group-by="@id" select="//page/widget">
<tr>
  <td><xsl:value-of select="@id"/></td>
  <td><xsl:value-of select="@type"/></td>
  <td>
  <xsl:if test="(@type = 'TEXT')">

      <xsl:value-of select="text"/>

  </xsl:if>
  </td>
  <td>
    <xsl:if test="(@type ='IMG')">
      <xsl:value-of select="@src"/>
    </xsl:if>
  </td>
  <td>
    <xsl:if test="(@type='YOUTUBE')">
      <xsl:value-of select="@url"/>
    </xsl:if>
  </td>
  <td>
    <xsl:if test="(@type='BUTTON')">
      <xsl:value-of select="@label"/>
    </xsl:if>
  </td>
</tr>

        </xsl:for-each-group>
      </tbody>
    </table>

  </xsl:template>

<!--  <xsl:template match="page">-->
<!--    -->
<!--  </xsl:template>-->

</xsl:stylesheet>