<?xml version="1.0" encoding="UTF-8"?>
<!--

	check_misc.xsl
	
	Checking ruleset containing generally applicable rules not falling into any
	other category.
	
	Author: Ian A. Young <ian@iay.org.uk>

-->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
	xmlns:md="urn:oasis:names:tc:SAML:2.0:metadata"
	xmlns:shibmd="urn:mace:shibboleth:metadata:1.0"
	xmlns="urn:oasis:names:tc:SAML:2.0:metadata">

	<!--
		Common support functions.
	-->
	<xsl:import href="check_framework.xsl"/>

	
	<!--
		Check for role descriptors with missing KeyDescriptor elements.
	-->
	
	<xsl:template match="md:IDPSSODescriptor[not(md:KeyDescriptor)]">
		<xsl:call-template name="error">
			<xsl:with-param name="m">IdP SSO Descriptor lacking KeyDescriptor</xsl:with-param>
		</xsl:call-template>    
	</xsl:template>
	
	<xsl:template match="md:SPSSODescriptor[not(md:KeyDescriptor)]">
		<xsl:call-template name="error">
			<xsl:with-param name="m">SP SSO Descriptor lacking KeyDescriptor</xsl:with-param>
		</xsl:call-template>    
	</xsl:template>
	
	<xsl:template match="md:AttributeAuthorityDescriptor[not(md:KeyDescriptor)]">
		<xsl:call-template name="error">
			<xsl:with-param name="m">IdP AA Descriptor lacking KeyDescriptor</xsl:with-param>
		</xsl:call-template>    
	</xsl:template>
	
	
	<!--
		Entity IDs should not contain space characters.
	-->
	<xsl:template match="md:EntityDescriptor[contains(@entityID, ' ')]">
		<xsl:call-template name="error">
			<xsl:with-param name="m">entity ID contains space character</xsl:with-param>
		</xsl:call-template>
	</xsl:template>


	<!--
		Entity IDs should start with one of "http://", "https://" or "urn:mace:".
	-->
	<xsl:template match="md:EntityDescriptor[not(starts-with(@entityID, 'urn:mace:'))]
		[not(starts-with(@entityID, 'http://'))]
		[not(starts-with(@entityID, 'https://'))]">
		<xsl:call-template name="error">
			<xsl:with-param name="m">entity ID <xsl:value-of select="@entityID"/> does not start with acceptable prefix</xsl:with-param>
		</xsl:call-template>
	</xsl:template>


	<!--
		Check for OrganizationDisplayName elements containing line breaks.
	-->
	<xsl:template match="md:OrganizationDisplayName[contains(., '&#10;')]">
		<xsl:call-template name="error">
			<xsl:with-param name="m">OrganizationDisplayName contains line break</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	
	<!--
		@Location attributes should not contain space characters.
		
		This may be a little strict, and might be better confined to md:* elements.
		At present, however, this produces no false positives.
	-->
	<xsl:template match="*[contains(@Location, ' ')]">
		<xsl:call-template name="error">
			<xsl:with-param name="m"><xsl:value-of select='local-name()'/> Location contains space character</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	
	<!--
		Check for Locations that don't start with https://
		
		This may be a little strict, and might be better confined to md:* elements.
		In addition, we might at some point require more complex rules: whitelisting certain
		entities, or permitting http:// to Locations associated with certain bindngs.
		
		At present, however, this simpler rule produces no false positives.
	-->
	<xsl:template match="*[@Location and not(starts-with(@Location,'https://'))]">
		<xsl:call-template name="error">
			<xsl:with-param name="m"><xsl:value-of select='local-name()'/> Location does not start with https://</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	
	<!--
		@Binding attributes should not contain space characters.
		
		This may be a little strict, and might be better confined to md:* elements.
		At present, however, this produces no false positives.
	-->
	<xsl:template match="*[contains(@Binding, ' ')]">
		<xsl:call-template name="error">
			<xsl:with-param name="m"><xsl:value-of select='local-name()'/> Binding contains space character</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	
	<!--
		Check for empty xml:lang elements, automatically generated by OIOSAML.
		
		This is not schema-valid so would be caught further down the line anyway,
		but it's nice to have a clear error message earlier in the process.
	-->
	<xsl:template match="@xml:lang[.='']">
		<xsl:call-template name="error">
			<xsl:with-param name="m">empty xml:lang attribute</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	
	<!--
		A Shibboleth scope shouldn't be just "ac.uk".
	-->
	<xsl:template match="shibmd:Scope[.='ac.uk']">
		<xsl:call-template name="error">
			<xsl:with-param name="m">bare 'ac.uk' scope not permitted</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<!--
        Look for SAML 2.0 IdPs whose metadata includes pure PKIX KeyDescriptor elements.
        
        This causes problems for some OpenAthens SP products.
    -->
	<xsl:template match="md:IDPSSODescriptor
		[contains(@protocolSupportEnumeration, 'urn:oasis:names:tc:SAML:2.0:protocol')]
		[md:KeyDescriptor[not(descendant::ds:X509Data)]]">
		<xsl:call-template name="error">
			<xsl:with-param name="m">SAML 2.0 IdP has KeyDescriptor without embedded key</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="md:AttributeAuthorityDescriptor
		[contains(@protocolSupportEnumeration, 'urn:oasis:names:tc:SAML:2.0:protocol')]
		[md:KeyDescriptor[not(descendant::ds:X509Data)]]">
		<xsl:call-template name="error">
			<xsl:with-param name="m">SAML 2.0 AttributeAuthority has KeyDescriptor without embedded key</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
</xsl:stylesheet>
