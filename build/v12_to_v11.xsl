<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:shibb10="urn:mace:shibboleth:1.0" xmlns:trust10="urn:mace:shibboleth:trust:1.0" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" exclude-result-prefixes="shibb10 trust10">
	<!--Force UTF-8 encoding for the output.-->
	<xsl:output omit-xml-declaration="no" method="xml" encoding="UTF-8" indent="yes"/>
	<!--trust10:Trust is the root element for the trust file.  Process it by changing the default namespace used and recursing.-->
	<xsl:template match="trust10:Trust">
		<xsl:element name="Trust" namespace="urn:mace:shibboleth:1.0">
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<!--trust10:KeyAuthority appears in the trust file, and needs its namespace changing.  After that, we need to reorder its nested elements a little.-->
	<xsl:template match="trust10:KeyAuthority">
		<xsl:element name="KeyAuthority" namespace="urn:mace:shibboleth:1.0">
			<xsl:apply-templates select="ds:KeyInfo"/>
			<xsl:element name="Subject" namespace="urn:mace:shibboleth:1.0">
				<xsl:value-of select="ds:KeyName"/>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<!--shibb10:SiteGroup is the root element for the sites file.  Process it by copying across everything except DestinationSite elements.-->
	<xsl:template match="shibb10:SiteGroup">
		<xsl:copy>
			<xsl:apply-templates select="@*|text()|comment()|shibb10:OriginSite"/>
		</xsl:copy>
	</xsl:template>
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
</xsl:stylesheet>
