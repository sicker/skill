<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                              xmlns:ns="http://your-namespace">
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="*">
    <xsl:element name="{concat('ns:', local-name())}" namespace="http://your-namespace">
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
