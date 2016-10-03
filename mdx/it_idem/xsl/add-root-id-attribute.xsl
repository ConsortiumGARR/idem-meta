<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:md="urn:oasis:names:tc:SAML:2.0:metadata"
    xmlns:date="http://exslt.org/dates-and-times"
    xmlns:mdxDates="xalan://uk.ac.sdss.xalan.md.Dates"
    extension-element-prefixes="date mdxDates">

   <xsl:variable name="now" select="date:date-time()"/>
   <xsl:variable name="normalisedNow" select="mdxDates:dateAdd($now, 0)"/>
<!--
    Add attribute 'ID' to root element (EntitiesDescriptor).
    The value of this attribute has the form ID="SWITCHaai-yyyymmddhhiiss"
    where the last component is a time stamp of the current time.
     
    This value is generated from a normalised version of the aggregation instant,
    transformed so that it can be used as an XML ID value.
     
    Strict conformance to the SAML 2.0 metadata specification (section 3.1.2) requires
    that the signature explicitly references an identifier attribute in the element
    being signed, in this case the document element.
-->

   <xsl:param name="prefix">interfederation</xsl:param>
   <xsl:variable name="documentID" select="concat($prefix, '-', translate($normalisedNow, ':-', ''))"/>
   <!--<xsl:variable name="documentID" select="concat($prefix, '-', translate(substring-before(date:date-time(),'+'),'-T:',''))"/>-->
    <!-- Add the attribute 'ID' -->
    <xsl:template match="/md:EntitiesDescriptor">
        <xsl:copy>
            <xsl:attribute name="ID">
                <xsl:value-of select="$documentID"/>
            </xsl:attribute>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
     
    <!-- Identity template for copying everything else -->
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" /> 
        </xsl:copy>
    </xsl:template>
 
</xsl:stylesheet>
