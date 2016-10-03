<!-- 
   Carriage Return ==> <xsl:text>&#10;</xsl:text>
   Tab             ==> <xsl:text>&#x09;</xsl:text>
   -->
<xsl:stylesheet version="1.0"
                xmlns:md="urn:oasis:names:tc:SAML:2.0:metadata"
                xmlns="urn:oasis:names:tc:SAML:2.0:metadata"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="md">

   <xsl:output method="xml" omit-xml-declaration="no" encoding="UTF-8" indent="no"/>

   <!--By default, copy text blocks, comments and attributes unchanged.-->
   <xsl:template match="text()|comment()|@*">
      <xsl:copy/>
   </xsl:template>

   <!--By default, copy all elements from the input to the output, along with their attributes and contents.-->
   <xsl:template match="*">
      <xsl:copy>
         <xsl:apply-templates select="node()|@*"/>
      </xsl:copy>
   </xsl:template>

   <xsl:template match="md:EntityDescriptor">
      <xsl:text>&#10;&#x09;</xsl:text>
      <xsl:comment>
         <xsl:text>&#10;</xsl:text>
         <xsl:text>&#x09;&#x09;Organization: </xsl:text> <xsl:value-of select="md:Organization/md:OrganizationDisplayName[@xml:lang='en'] | md:Organization/md:OrganizationDisplayName[@xml:lang='it']" />
         <xsl:text>&#10;</xsl:text>
         <xsl:text>&#x09;&#x09;EntityID: </xsl:text><xsl:value-of select="@entityID"/>
         <xsl:text>&#10;</xsl:text>
         <xsl:text>&#x09;&#x09;Technical Contact: </xsl:text> <xsl:value-of select="md:ContactPerson[@contactType='technical']/md:EmailAddress" />
         <xsl:text>&#10;&#x09;</xsl:text>
      </xsl:comment>
      <xsl:text>&#10;  </xsl:text>
      <EntityDescriptor>
         <xsl:if test="@ID != ''">
            <xsl:attribute name="ID">
               <xsl:value-of select="@ID"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:attribute name="entityID">
            <xsl:value-of select="@entityID"/>
         </xsl:attribute>
         <xsl:apply-templates />
      </EntityDescriptor>
   </xsl:template>

</xsl:stylesheet>
