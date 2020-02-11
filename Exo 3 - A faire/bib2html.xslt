<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
            </head>
            <body>
                <h1 align="left">Domaines</h1>
                <xsl:for-each select="//domain">
                    <h2>
                        <xsl:variable name="title" select="title" />
                        <a href="#{$title}"><xsl:value-of select="title" /></a>
                    </h2>
                </xsl:for-each>
                <xsl:apply-templates select="//domain" />
            </body>
        </html>
    </xsl:template>

    <xsl:template match="domain">
        <xsl:variable name="title" select="title" />
        <hr />
        <hr />
        <table border="1" width="100%">
            <tbody>
                <tr>
                    <td bgcolor="#c0c0c0" width="100%">
                        <h2>
                            <a name="{$title}">
                                <xsl:value-of select="title" />
                            </a>
                        </h2>
                    </td>
                </tr>
            </tbody>
        </table>
        <xsl:for-each select="bib_ref">
            <xsl:variable name="link" select="weblink" />
            <hr />
            <h3>
                Titre : <xsl:value-of select="title" />
            </h3>
            Auteur : <xsl:value-of select="author" /><br />
            Année : <xsl:value-of select="year" /><br />
            Lien : <a href="{$link}"><xsl:value-of select="weblink" /></a><br />
            <xsl:if test="comments">
                <xsl:for-each select="comments/child::*"> - <xsl:value-of select="." /> <br /></xsl:for-each>
            </xsl:if>
        </xsl:for-each>
        <br />
        <br />
    </xsl:template>
</xsl:stylesheet>