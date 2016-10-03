<!-- 
   Carriage Return ==> <xsl:text>&#10;</xsl:text>
   Tab             ==> <xsl:text>&#x09;</xsl:text>
   -->
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
                xmlns:hoksso="urn:oasis:names:tc:SAML:2.0:profiles:holder-of-key:SSO:browser"
                xmlns:idpdisc="urn:oasis:names:tc:SAML:profiles:SSO:idp-discovery-protocol"
                xmlns:init="urn:oasis:names:tc:SAML:profiles:SSO:request-init"
                xmlns:md="urn:oasis:names:tc:SAML:2.0:metadata"
                xmlns:saml="urn:oasis:names:tc:SAML:2.0:assertion" 
                xmlns:mdui="urn:oasis:names:tc:SAML:metadata:ui" 
                xmlns:mdrpi="urn:oasis:names:tc:SAML:metadata:rpi"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:xenc="http://www.w3.org/2001/04/xmlenc#"
                xmlns:shibmd="urn:mace:shibboleth:metadata:1.0"
                xmlns:saml1md="urn:mace:shibboleth:metadata:1.0">

   <xsl:output method="xml" omit-xml-declaration="no" encoding="UTF-8" indent="yes"/>

   <xsl:template match="*">
      <xsl:copy>
         <xsl:for-each select="@*">
            <xsl:attribute name="{name()}">
               <xsl:value-of select="normalize-space()"/>
            </xsl:attribute>
         </xsl:for-each>
         <xsl:apply-templates select="child::node()"/>
      </xsl:copy>
   </xsl:template> 

   <xsl:template match="text()">
      <xsl:value-of select="normalize-space()"/>
   </xsl:template>

   <xsl:template match="md:EntitiesDescriptor">
      <md:EntitiesDescriptor>
         <xsl:if test="@ID != ''">
            <xsl:attribute name="ID">
               <xsl:value-of select="@ID"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:if test="@Name != ''">
            <xsl:attribute name="Name">
               <xsl:value-of select="@Name"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:if test="@validUntil != ''">
            <xsl:attribute name="validUntil">
               <xsl:value-of select="@validUntil"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:if test="@xsi:schemaLocation != ''">
            <xsl:attribute name="xsi:schemaLocation">
               <xsl:value-of select="@xsi:schemaLocation"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="child::node()"/>
      </md:EntitiesDescriptor>
   </xsl:template>

    <xsl:template match="ds:Signature">
      <xsl:text>&#10;&#x09;</xsl:text>
      <ds:Signature>
         <xsl:apply-templates select="child::node()"/>
         <xsl:text>&#10;&#x09;</xsl:text>
      </ds:Signature>
    </xsl:template>

    <xsl:template match="ds:Signature//ds:KeyInfo">
      <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      <ds:KeyInfo>
         <xsl:apply-templates select="child::node()"/>
         <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      </ds:KeyInfo>
    </xsl:template>

    <xsl:template match="ds:Signature//ds:X509Data">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <ds:X509Data>
         <xsl:apply-templates select="child::node()"/>
         <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      </ds:X509Data>
    </xsl:template>

    <xsl:template match="ds:Signature//ds:X509Certificate">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <ds:X509Certificate>
         <xsl:apply-templates select="child::node()"/>
      </ds:X509Certificate>
    </xsl:template>

    <xsl:template match="ds:SignedInfo">
      <xsl:text>&#10;&#x09;&#x09;</xsl:text>
      <ds:SignedInfo>
         <xsl:apply-templates select="child::node()"/>
         <xsl:text>&#10;&#x09;&#x09;</xsl:text>
      </ds:SignedInfo>
    </xsl:template>

    <xsl:template match="ds:CanonicalizationMethod">
      <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      <ds:CanonicalizationMethod>
         <xsl:attribute name="Algorithm">
            <xsl:value-of select="@Algorithm"/>
         </xsl:attribute>
      </ds:CanonicalizationMethod>
    </xsl:template>

    <xsl:template match="ds:SignatureMethod">
      <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      <ds:SignatureMethod>
         <xsl:attribute name="Algorithm">
            <xsl:value-of select="@Algorithm"/>
         </xsl:attribute>
      </ds:SignatureMethod>
    </xsl:template>

    <xsl:template match="ds:Reference">
      <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      <ds:Reference>
         <xsl:attribute name="URI">
            <xsl:value-of select="@URI"/>
         </xsl:attribute>
         <xsl:apply-templates select="child::node()"/>
         <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      </ds:Reference>
    </xsl:template>

    <xsl:template match="ds:Transforms">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <ds:Transforms>
         <xsl:apply-templates select="child::node()"/>
         <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      </ds:Transforms>
    </xsl:template>

    <xsl:template match="ds:Transform">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <ds:Transform>
         <xsl:attribute name="Algorithm">
            <xsl:value-of select="@Algorithm"/>
         </xsl:attribute>
      </ds:Transform>
    </xsl:template>

    <xsl:template match="ds:DigestMethod">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <ds:DigestMethod>
         <xsl:attribute name="Algorithm">
            <xsl:value-of select="@Algorithm"/>
         </xsl:attribute>
      </ds:DigestMethod>
    </xsl:template>

    <xsl:template match="ds:DigestValue">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <ds:DigestValue>
         <xsl:value-of select="node()"/>
      </ds:DigestValue>
    </xsl:template>

    <xsl:template match="ds:SignatureValue">
      <xsl:text>&#10;&#x09;&#x09;</xsl:text>
      <ds:SignatureValue>
         <xsl:value-of select="translate(translate(translate(.,'&#x09;',''),'&#10;',''),' ','')"/> <!-- Rimuovo tutti gli spazi e i ritorno a capo -->
      </ds:SignatureValue>
    </xsl:template>

    <!-- Qualunque shibmd:KeyAuthority che ha come antenato(ancestor) un md:Extensions -->
    <xsl:template match="md:Extensions//shibmd:KeyAuthority">
      <xsl:text>&#10;&#x09;&#x09;</xsl:text>
      <shibmd:KeyAuthority>
         <xsl:attribute name="VerifyDepth">
            <xsl:value-of select="@VerifyDepth"/>
         </xsl:attribute>
         <xsl:apply-templates select="child::node()"/>
         <xsl:text>&#10;&#x09;&#x09;</xsl:text>
      </shibmd:KeyAuthority>
   </xsl:template>

   <xsl:template match="md:EntityDescriptor">
      <xsl:text>&#10;&#x09;</xsl:text>
      <xsl:comment>
         <xsl:text>&#10;</xsl:text>
         <xsl:text>&#x09;&#x09;Organization: </xsl:text> <xsl:value-of select="md:Organization/md:OrganizationDisplayName[@xml:lang='en'] | md:Organization/md:OrganizationDisplayName[@xml:lang='it']" />
         <xsl:text>&#10;</xsl:text>
         <xsl:text>&#x09;&#x09;EntityID: </xsl:text><xsl:value-of select="@entityID"/>
         <xsl:text>&#10;</xsl:text>
         <xsl:text>&#x09;&#x09;Contact: </xsl:text> <xsl:value-of select="md:ContactPerson[@contactType='technical']/md:EmailAddress" />
         <xsl:text>&#10;&#x09;</xsl:text>
      </xsl:comment>
      <xsl:text>&#10;&#x09;</xsl:text>
      <md:EntityDescriptor>
         <xsl:if test="@ID != ''">
            <xsl:attribute name="ID">
               <xsl:value-of select="@ID"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:attribute name="entityID">
            <xsl:value-of select="@entityID"/>
         </xsl:attribute>
         <xsl:apply-templates select="child::node()"/>
         <xsl:text>&#10;&#x09;</xsl:text>
      </md:EntityDescriptor>
      <xsl:text>&#10;</xsl:text>
   </xsl:template>

   <xsl:template match="md:EntityDescriptor/md:Extensions">
      <xsl:text>&#10;&#x09;&#x09;</xsl:text>
      <md:Extensions>
         <xsl:apply-templates select="child::node()"/>
         <xsl:text>&#10;&#x09;&#x09;</xsl:text>
      </md:Extensions>
   </xsl:template>

   <xsl:template match="md:EntitiesDescriptor/md:Extensions">
      <xsl:text>&#10;&#x09;</xsl:text>
      <md:Extensions>
         <xsl:apply-templates select="child::node()"/>
         <xsl:text>&#10;&#x09;</xsl:text>
      </md:Extensions>
      <xsl:text>&#10;</xsl:text>
   </xsl:template>

   <xsl:template match="md:EntityDescriptor/md:IDPSSODescriptor">
      <xsl:text>&#10;&#x09;&#x09;</xsl:text>
      <md:IDPSSODescriptor>
         <xsl:attribute name="protocolSupportEnumeration">
            <xsl:value-of select="@protocolSupportEnumeration"/>
         </xsl:attribute>
         <xsl:if test="@WantAuthnRequestsSigned != ''">
            <xsl:attribute name="WantAuthnRequestsSigned">
               <xsl:value-of select="@WantAuthnRequestsSigned"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="child::node()"/>
         <xsl:text>&#10;&#x09;&#x09;</xsl:text>
      </md:IDPSSODescriptor>
   </xsl:template>

   <xsl:template match="md:EntityDescriptor/md:SPSSODescriptor">
      <xsl:text>&#10;&#x09;&#x09;</xsl:text>
      <md:SPSSODescriptor>
         <xsl:attribute name="protocolSupportEnumeration">
            <xsl:value-of select="@protocolSupportEnumeration"/>
         </xsl:attribute>
         <xsl:if test="@WantAuthnRequestsSigned != ''">
            <xsl:attribute name="WantAuthnRequestsSigned">
               <xsl:value-of select="@WantAuthnRequestsSigned"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:if test="@AuthnRequestsSigned != ''">
            <xsl:attribute name="AuthnRequestsSigned">
               <xsl:value-of select="@AuthnRequestsSigned"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="child::node()"/>
         <xsl:text>&#10;&#x09;&#x09;</xsl:text>
      </md:SPSSODescriptor>
   </xsl:template>

   <xsl:template match="md:IDPSSODescriptor/md:Extensions | md:AttributeAuthorityDescriptor/md:Extensions">
      <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      <md:Extensions>
         <xsl:apply-templates select="child::node()"/>
         <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      </md:Extensions>
   </xsl:template>

   <xsl:template match="md:SPSSODescriptor/md:Extensions">
      <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      <md:Extensions>
         <xsl:apply-templates select="child::node()"/>
         <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      </md:Extensions>
   </xsl:template>

   <xsl:template match="md:AttributeAuthorityDescriptor">
      <xsl:text>&#10;&#x09;&#x09;</xsl:text>
      <md:AttributeAuthorityDescriptor>
         <xsl:attribute name="protocolSupportEnumeration">
            <xsl:value-of select="@protocolSupportEnumeration"/>
         </xsl:attribute>
         <xsl:apply-templates select="child::node()"/>
         <xsl:text>&#10;&#x09;&#x09;</xsl:text>
      </md:AttributeAuthorityDescriptor>
   </xsl:template>

   <xsl:template match="md:Organization | Organization">
      <xsl:text>&#10;&#x09;&#x09;</xsl:text>
      <md:Organization>
         <xsl:apply-templates select="child::node()"/>
         <xsl:text>&#10;&#x09;&#x09;</xsl:text>
      </md:Organization>
   </xsl:template>

   <xsl:template match="md:ContactPerson">
      <xsl:text>&#10;&#x09;&#x09;</xsl:text>
      <md:ContactPerson>
         <xsl:attribute name="contactType">
            <xsl:value-of select="@contactType"/>
         </xsl:attribute>
         <xsl:apply-templates select="child::node()"/>
         <xsl:text>&#10;&#x09;&#x09;</xsl:text>
      </md:ContactPerson>
   </xsl:template>

   <xsl:template match="mdrpi:RegistrationInfo">
      <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      <mdrpi:RegistrationInfo>
         <xsl:attribute name="registrationAuthority">
            <xsl:value-of select="@registrationAuthority"/>
         </xsl:attribute>
         <xsl:attribute name="registrationInstant">
            <xsl:value-of select="@registrationInstant"/>
         </xsl:attribute>
         <xsl:apply-templates select="child::node()"/>
         <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      </mdrpi:RegistrationInfo>
   </xsl:template>

   <xsl:template match="mdrpi:RegistrationPolicy">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <mdrpi:RegistrationPolicy>
         <xsl:attribute name="xml:lang">
            <xsl:value-of select="@xml:lang"/>
         </xsl:attribute>
         <xsl:value-of select="."/>
      </mdrpi:RegistrationPolicy>
   </xsl:template>

   <xsl:template match="shibmd:Scope | saml1md:Scope">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <shibmd:Scope>
         <xsl:attribute name="regexp">
            <xsl:value-of select="@regexp"/>
         </xsl:attribute>
         <xsl:apply-templates select="child::node()"/>
      </shibmd:Scope>
   </xsl:template>
   
   <xsl:template match="mdui:UIInfo">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <mdui:UIInfo>
         <xsl:apply-templates select="child::node()"/>
         <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      </mdui:UIInfo>
   </xsl:template>
   
   <xsl:template match="mdui:DisplayName">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <mdui:DisplayName>
         <xsl:attribute name="xml:lang">
            <xsl:value-of select="@xml:lang"/>
         </xsl:attribute>
         <xsl:apply-templates select="child::node()"/>
      </mdui:DisplayName>
   </xsl:template>

   <xsl:template match="mdui:Description">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <mdui:Description>
         <xsl:attribute name="xml:lang">
            <xsl:value-of select="@xml:lang"/>
         </xsl:attribute>
         <xsl:apply-templates select="child::node()"/>
      </mdui:Description>
   </xsl:template>

   <xsl:template match="mdui:InformationURL | InformationURL">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <mdui:InformationURL>
         <xsl:attribute name="xml:lang">
            <xsl:value-of select="@xml:lang"/>
         </xsl:attribute>
         <xsl:apply-templates select="child::node()"/>
      </mdui:InformationURL>
   </xsl:template>

   <xsl:template match="mdui:PrivacyStatementURL">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <mdui:PrivacyStatementURL>
         <xsl:attribute name="xml:lang">
            <xsl:value-of select="@xml:lang"/>
         </xsl:attribute>
         <xsl:apply-templates select="child::node()"/>
      </mdui:PrivacyStatementURL>
   </xsl:template>

   <xsl:template match="mdui:Logo">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <mdui:Logo>
         <xsl:attribute name="height">
            <xsl:value-of select="@height"/>
         </xsl:attribute>

         <xsl:attribute name="width">
            <xsl:value-of select="@width"/>
         </xsl:attribute>

         <xsl:if test="@xml:lang!=''">
            <xsl:attribute name="xml:lang">
               <xsl:value-of select="@xml:lang"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:apply-templates select="child::node()"/>
      </mdui:Logo>
   </xsl:template>

   <xsl:template match="mdui:Keywords">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <mdui:Keywords>
         <xsl:attribute name="xml:lang">
            <xsl:value-of select="@xml:lang"/>
         </xsl:attribute>
         <xsl:apply-templates select="child::node()"/>
      </mdui:Keywords>
   </xsl:template>

   <xsl:template match="mdui:DiscoHints">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <mdui:DiscoHints>
         <xsl:apply-templates select="child::node()"/>
         <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      </mdui:DiscoHints>
   </xsl:template>

   <xsl:template match="mdui:DomainHint">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <mdui:DomainHint>
         <xsl:apply-templates select="child::node()"/>
      </mdui:DomainHint>
   </xsl:template>

   <xsl:template match="mdui:GeolocationHint">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <mdui:GeolocationHint>
         <xsl:apply-templates select="child::node()"/>
      </mdui:GeolocationHint>
   </xsl:template>

   <xsl:template match="mdui:IPHint">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <mdui:IPHint>
         <xsl:apply-templates select="child::node()"/>
      </mdui:IPHint>
   </xsl:template>

   <xsl:template match="md:KeyDescriptor">
      <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      <md:KeyDescriptor>
         <xsl:if test="@use!=''">
            <xsl:attribute name="use">
               <xsl:value-of select="@use"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="child::node()"/>
         <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      </md:KeyDescriptor>
   </xsl:template>

   <xsl:template match="md:EncryptionMethod">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <md:EncryptionMethod>
         <xsl:attribute name="Algorithm">
            <xsl:value-of select="@Algorithm"/>
         </xsl:attribute>
         <xsl:apply-templates select="child::node()"/>
         <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      </md:EncryptionMethod>
   </xsl:template>

   <xsl:template match="xenc:KeySize">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <xenc:KeySize>
         <xsl:apply-templates select="child::node()"/>
      </xenc:KeySize>
   </xsl:template>

   <xsl:template match="ds:KeyInfo">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <ds:KeyInfo>
         <xsl:apply-templates select="child::node()"/>
         <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      </ds:KeyInfo>
   </xsl:template>

    <xsl:template match="shibmd:KeyAuthority/ds:KeyInfo">
      <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      <ds:KeyInfo>
         <xsl:if test="comment() != ''">
            <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;</xsl:text>
            <xsl:copy-of select="comment()"/>
         </xsl:if>
         <xsl:apply-templates select="child::node()"/>
         <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      </ds:KeyInfo>
   </xsl:template>

   <xsl:template match="ds:KeyName">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <ds:KeyName>
         <xsl:apply-templates select="child::node()"/>
      </ds:KeyName>
   </xsl:template>

    <xsl:template match="shibmd:KeyAuthority/ds:KeyInfo/ds:KeyName">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <ds:KeyName>
         <xsl:apply-templates select="child::node()"/>
      </ds:KeyName>
   </xsl:template>

   <xsl:template match="ds:X509Data">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <ds:X509Data>
         <xsl:apply-templates select="child::node()"/>
         <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      </ds:X509Data>
   </xsl:template>

   <xsl:template match="ds:X509SubjectName">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <ds:X509SubjectName>
         <xsl:apply-templates select="child::node()"/>
      </ds:X509SubjectName>
   </xsl:template>

   <xsl:template match="ds:X509IssuerSerial">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <ds:X509IssuerSerial>
         <xsl:apply-templates select="child::node()"/>
         <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      </ds:X509IssuerSerial>
   </xsl:template>

   <xsl:template match="ds:X509IssuerName">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <ds:X509IssuerName>
         <xsl:apply-templates select="child::node()"/>
      </ds:X509IssuerName>
   </xsl:template>

   <xsl:template match="ds:X509SerialNumber">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <ds:X509SerialNumber>
         <xsl:apply-templates select="child::node()"/>
      </ds:X509SerialNumber>
   </xsl:template>

    <xsl:template match="shibmd:KeyAuthority/ds:KeyInfo/ds:X509Data">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <ds:X509Data>
         <xsl:apply-templates select="child::node()"/>
         <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      </ds:X509Data>
   </xsl:template>

   <xsl:template match="ds:X509Certificate">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <ds:X509Certificate>
         <xsl:value-of select="translate(translate(translate(.,'&#x09;',''),'&#10;',''),' ','')"/>
      </ds:X509Certificate>
   </xsl:template>

    <xsl:template match="shibmd:KeyAuthority/ds:KeyInfo/ds:X509Data/ds:X509Certificate">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <ds:X509Certificate>
         <xsl:value-of select="translate(translate(translate(.,'&#x09;',''),'&#10;',''),' ','')"/>
      </ds:X509Certificate>
   </xsl:template>

   <xsl:template match="md:ArtifactResolutionService">
      <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      <md:ArtifactResolutionService>
         <xsl:attribute name="Binding">
            <xsl:value-of select="@Binding"/>
         </xsl:attribute>

         <xsl:attribute name="Location">
            <xsl:value-of select="@Location"/>
         </xsl:attribute>

         <xsl:attribute name="index">
            <xsl:value-of select="@index"/>
         </xsl:attribute>
      </md:ArtifactResolutionService>
   </xsl:template>

   <xsl:template match="md:NameIDFormat">
      <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      <md:NameIDFormat>
         <xsl:apply-templates select="child::node()"/>
      </md:NameIDFormat>
   </xsl:template>

   <xsl:template match="md:SingleSignOnService">
      <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      <md:SingleSignOnService>
         <xsl:attribute name="Binding">
            <xsl:value-of select="@Binding"/>
         </xsl:attribute>

         <xsl:attribute name="Location">
            <xsl:value-of select="@Location"/>
         </xsl:attribute>
      </md:SingleSignOnService>
   </xsl:template>

   <xsl:template match="md:SingleLogoutService">
      <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      <md:SingleLogoutService>
         <xsl:attribute name="Binding">
            <xsl:value-of select="@Binding"/>
         </xsl:attribute>

         <xsl:attribute name="Location">
            <xsl:value-of select="@Location"/>
         </xsl:attribute>
      </md:SingleLogoutService>
   </xsl:template>

   <xsl:template match="md:NameIDMappingService">
      <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      <md:NameIDMappingService>
         <xsl:attribute name="Binding">
            <xsl:value-of select="@Binding"/>
         </xsl:attribute>

         <xsl:attribute name="Location">
            <xsl:value-of select="@Location"/>
         </xsl:attribute>
      </md:NameIDMappingService>
   </xsl:template>

   <xsl:template match="md:AssertionIDRequestService">
      <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      <md:AssertionIDRequestService>
         <xsl:attribute name="Binding">
            <xsl:value-of select="@Binding"/>
         </xsl:attribute>

         <xsl:attribute name="Location">
            <xsl:value-of select="@Location"/>
         </xsl:attribute>
      </md:AssertionIDRequestService>
   </xsl:template>


   <xsl:template match="md:ManageNameIDService">
      <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      <md:ManageNameIDService>
         <xsl:attribute name="Binding">
            <xsl:value-of select="@Binding"/>
         </xsl:attribute>

         <xsl:attribute name="Location">
            <xsl:value-of select="@Location"/>
         </xsl:attribute>
      </md:ManageNameIDService>
   </xsl:template>

   <xsl:template match="md:AssertionConsumerService">
      <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      <md:AssertionConsumerService>
         <xsl:attribute name="Binding">
            <xsl:value-of select="@Binding"/>
         </xsl:attribute>

         <xsl:attribute name="Location">
            <xsl:value-of select="@Location"/>
         </xsl:attribute>

         <xsl:if test="@hoksso:ProtocolBinding != ''">
            <xsl:attribute name="hoksso:ProtocolBinding">
               <xsl:value-of select="@hoksso:ProtocolBinding"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="@index != ''">
            <xsl:attribute name="index">
               <xsl:value-of select="@index"/>
            </xsl:attribute>
         </xsl:if>
      </md:AssertionConsumerService>
   </xsl:template>
   
   <xsl:template match="md:AttributeConsumingService">
      <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      <md:AttributeConsumingService>
         <xsl:if test="@index != ''">
            <xsl:attribute name="index">
               <xsl:value-of select="@index"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="child::node()"/>
         <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      </md:AttributeConsumingService>
   </xsl:template>

   <xsl:template match="md:ServiceName">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <md:ServiceName>
         <xsl:attribute name="xml:lang">
            <xsl:value-of select="@xml:lang"/>
         </xsl:attribute>
         <xsl:apply-templates select="child::node()"/>
      </md:ServiceName>
   </xsl:template>

   <xsl:template match="md:ServiceDescription">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <md:ServiceDescription>
         <xsl:attribute name="xml:lang">
            <xsl:value-of select="@xml:lang"/>
         </xsl:attribute>
         <xsl:apply-templates select="child::node()"/>
      </md:ServiceDescription>
   </xsl:template>

   <xsl:template match="md:RequestedAttribute">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <md:RequestedAttribute>
         <xsl:attribute name="FriendlyName">
            <xsl:value-of select="@FriendlyName"/>
         </xsl:attribute>

         <xsl:attribute name="Name">
            <xsl:value-of select="@Name"/>
         </xsl:attribute>

         <xsl:attribute name="NameFormat">
            <xsl:value-of select="@NameFormat"/>
         </xsl:attribute>

         <xsl:if test="@isRequired != ''">
            <xsl:attribute name="isRequired">
               <xsl:value-of select="@isRequired"/>
            </xsl:attribute>
         </xsl:if>
      </md:RequestedAttribute>
   </xsl:template>

   <xsl:template match="idpdisc:DiscoveryResponse">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <idpdisc:DiscoveryResponse>
         <xsl:attribute name="Binding">
            <xsl:value-of select="@Binding"/>
         </xsl:attribute>

         <xsl:attribute name="Location">
            <xsl:value-of select="@Location"/>
         </xsl:attribute>

         <xsl:attribute name="index">
            <xsl:value-of select="@index"/>
         </xsl:attribute>
      </idpdisc:DiscoveryResponse>
   </xsl:template>

   <xsl:template match="init:RequestInitiator">
      <xsl:text>&#10;&#x09;&#x09;&#x09;&#x09;</xsl:text>
      <init:RequestInitiator>
         <xsl:attribute name="Binding">
            <xsl:value-of select="@Binding"/>
         </xsl:attribute>

         <xsl:attribute name="Location">
            <xsl:value-of select="@Location"/>
         </xsl:attribute>
      </init:RequestInitiator>
   </xsl:template>

   <xsl:template match="md:AttributeService">
      <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      <md:AttributeService>
         <xsl:attribute name="Binding">
            <xsl:value-of select="@Binding"/>
         </xsl:attribute>

         <xsl:attribute name="Location">
            <xsl:value-of select="@Location"/>
         </xsl:attribute>
      </md:AttributeService>
   </xsl:template>

   <xsl:template match="md:OrganizationName">
      <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      <md:OrganizationName>
         <xsl:attribute name="xml:lang">
            <xsl:value-of select="@xml:lang"/>
         </xsl:attribute>
         <xsl:apply-templates select="child::node()"/>
      </md:OrganizationName>
   </xsl:template>

   <xsl:template match="md:OrganizationDisplayName">
      <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      <md:OrganizationDisplayName>
         <xsl:attribute name="xml:lang">
            <xsl:value-of select="@xml:lang"/>
         </xsl:attribute>
         <xsl:apply-templates select="child::node()"/>
      </md:OrganizationDisplayName>
   </xsl:template>

   <xsl:template match="md:OrganizationURL">
      <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      <md:OrganizationURL>
         <xsl:attribute name="xml:lang">
            <xsl:value-of select="@xml:lang"/>
         </xsl:attribute>
         <xsl:apply-templates select="child::node()"/>
      </md:OrganizationURL>
   </xsl:template>

   <xsl:template match="md:GivenName">
      <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      <md:GivenName>
         <xsl:apply-templates select="child::node()"/>
      </md:GivenName>
   </xsl:template>

   <xsl:template match="md:SurName">
      <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      <md:SurName>
         <xsl:apply-templates select="child::node()"/>
      </md:SurName>
   </xsl:template>

   <xsl:template match="md:EmailAddress">
      <xsl:text>&#10;&#x09;&#x09;&#x09;</xsl:text>
      <md:EmailAddress>
         <xsl:apply-templates select="child::node()"/>
      </md:EmailAddress>
   </xsl:template>
</xsl:stylesheet>
