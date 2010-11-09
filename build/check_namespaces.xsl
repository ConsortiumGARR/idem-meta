<?xml version="1.0" encoding="UTF-8"?>
<!--
	
	check_namespaces.xsl
	
	Metadata checking ruleset that ensures that all namespaces used in a metadata file
	are known to us, by flagging those which are not.
	
	Author: Ian A. Young <ian@iay.org.uk>
	
-->
<xsl:stylesheet version="1.0"
	xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
	xmlns:elab="http://eduserv.org.uk/labels"
	xmlns:idpdisc="urn:oasis:names:tc:SAML:profiles:SSO:idp-discovery-protocol"
	xmlns:md="urn:oasis:names:tc:SAML:2.0:metadata"
	xmlns:mdui="urn:oasis:names:tc:SAML:metadata:ui"
	xmlns:shibmd="urn:mace:shibboleth:metadata:1.0"
	xmlns:ukfedlabel="http://ukfederation.org.uk/2006/11/label"
	xmlns:wayf="http://sdss.ac.uk/2006/06/WAYF"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="urn:oasis:names:tc:SAML:2.0:metadata">
	
	<!--
		Common support functions.
	-->
	<xsl:import href="check_framework.xsl"/>
	
	<!--
		Explicitly accept elements in namespaces which we know about.
	-->
	
	<xsl:template match="ds:*">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="elab:*">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="idpdisc:*">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="md:*">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="mdui:*">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="shibmd:*">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="wayf:*">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="ukfedlabel:*">
		<xsl:apply-templates/>
	</xsl:template>
	
	<!--
		Reject elements in all other namespaces.
	-->
	
	<xsl:template match="*">
		<xsl:call-template name="fatal">
			<xsl:with-param name="m">
				<xsl:text>Unknown namespace: </xsl:text>
				<xsl:value-of select="namespace-uri()"/>
				<xsl:text> on element </xsl:text>
				<xsl:value-of select="name()"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
</xsl:stylesheet>