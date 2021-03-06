<?xml version="1.0" encoding="UTF-8"?>
<!--

	idemAddPubInfo.xsl

	Final tweaks required for IDEM federation aggregates.
	
-->
<xsl:stylesheet version="1.0"
	xmlns:md="urn:oasis:names:tc:SAML:2.0:metadata"
	xmlns:mdrpi="urn:oasis:names:tc:SAML:metadata:rpi"

	xmlns:date="http://exslt.org/dates-and-times"
	xmlns:mdxDates="xalan://uk.ac.sdss.xalan.md.Dates"
	extension-element-prefixes="date mdxDates"
	
	xmlns="urn:oasis:names:tc:SAML:2.0:metadata"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	exclude-result-prefixes="md">

	<!--Force UTF-8 encoding for the output.-->
	<xsl:output omit-xml-declaration="no" method="xml" encoding="UTF-8" indent="yes"/>

	<!--
		extraText
		
		This parameter, if present, provides additional text to be put in the
		document comment.
	-->
	<xsl:param name="extraText"/>
	
	<!--
        publisher
        
        This parameter, if present, prompts the generation of a PublicationInfo
        element on the EntitiesDescriptor.
    -->
	<xsl:param name="publisher"/>
	
	<!--
		validityDays
		
		This parameter determines the number of days between the aggregation instant and the
		end of validity of the signed metadata.
	-->
	<xsl:param name="validityDays" select="14"/>
	
	<xsl:variable name="now" select="date:date-time()"/>
	<xsl:variable name="validUntil" select="mdxDates:dateAdd($now, $validityDays)"/>
	
	<!--
		documentID
		
		This value is generated from a normalised version of the aggregation instant,
		transformed so that it can be used as an XML ID value.
		
		Strict conformance to the SAML 2.0 metadata specification (section 3.1.2) requires
		that the signature explicitly references an identifier attribute in the element
		being signed, in this case the document element.
	-->
	<xsl:variable name="normalisedNow" select="mdxDates:dateAdd($now, 0)"/>
	<xsl:variable name="documentID"
		select="concat('uk', translate($normalisedNow, ':-', ''))"/>

	<!--
		Document root.
	-->
	<xsl:template match="/">
<!--		<xsl:call-template name="document.comment"/> -->
		<xsl:apply-templates/>
	</xsl:template>
	
	<!--
		Document element.
	-->
	<xsl:template match="/md:EntitiesDescriptor">
		<EntitiesDescriptor>
<!--
			<xsl:attribute name="validUntil">
				<xsl:value-of select="$validUntil"/>
			</xsl:attribute>
			<xsl:attribute name="ID">
				<xsl:value-of select="$documentID"/>
			</xsl:attribute>
-->
			<xsl:apply-templates select="@*"/>
<!--		<xsl:call-template name="document.comment"/> -->
			
			<!--
                Add an Extensions element if there isn't one, but we need one
                so that we can put a PublicationInfo inside it.
            -->
			<xsl:if test="$publisher and not(md:Extensions)">
				<xsl:text>&#10;</xsl:text>
				<xsl:text>    </xsl:text>
				<xsl:element name="md:Extensions">
					<xsl:call-template name="generate.publicationInfo"/>
					<xsl:text>&#10;</xsl:text>
					<xsl:text>    </xsl:text>
				</xsl:element>
				<xsl:text>&#10;</xsl:text>
			</xsl:if>
			
			<xsl:apply-templates select="node()"/>
		</EntitiesDescriptor>
	</xsl:template>

	<!--
		Comment to be added to the top of the document, and just inside the document element.
	-->
	<xsl:template name="document.comment">
        <xsl:text>&#10;</xsl:text>
		<xsl:comment>
			<xsl:text>&#10;&#9;U K   F E D E R A T I O N   M E T A D A T A&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
			<xsl:if test="$extraText">
				<xsl:text>&#9;*** </xsl:text>
				<xsl:value-of select="$extraText"/>
				<xsl:text> ***&#10;</xsl:text>
				<xsl:text>&#10;</xsl:text>
			</xsl:if>
			<xsl:text>&#9;Aggregate built </xsl:text>
            <xsl:value-of select="$normalisedNow"/>
            <xsl:if test="string($normalisedNow) != string($now)">
                <xsl:text> (</xsl:text>
                <xsl:value-of select="$now"/>
                <xsl:text> local)</xsl:text>
            </xsl:if>
			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#9;Aggregate valid for </xsl:text>
			<xsl:value-of select="$validityDays"/>
			<xsl:text> days, until </xsl:text>
			<xsl:value-of select="$validUntil"/>
			<xsl:text>&#10;</xsl:text>
		</xsl:comment>
	</xsl:template>
	
	<!--
        Document element's Extensions.
        
        Insert a PublicationInfo at the top, if required.
    -->
	<xsl:template match="/EntitiesDescriptor/Extensions">
		<xsl:copy>
			<xsl:if test="$publisher">
				<xsl:call-template name="generate.publicationInfo"/>
			</xsl:if>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>
	
	<!--
        PublicationInfo generation.
        
        Assumption: called at the start of the document element's Extensions, at 4-space
        indentation, so the element itself requires 8-space indentation.
    -->
	<xsl:template name="generate.publicationInfo">
		<xsl:element name="mdrpi:PublicationInfo">
			<xsl:attribute name="publisher">
				<xsl:value-of select="$publisher"/>
			</xsl:attribute>
			<xsl:attribute name="creationInstant">
				<xsl:value-of select="$normalisedNow"/>
			</xsl:attribute>
         <xsl:element name="mdrpi:UsagePolicy">
            <xsl:attribute name="xml:lang">en</xsl:attribute>
            <xsl:text>http://www.edugain.org/policy/metadata-tou_1_0.txt</xsl:text>
         </xsl:element>
		</xsl:element>
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
