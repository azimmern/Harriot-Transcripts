<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:echo="http://www.mpiwg-berlin.mpg.de/ns/echo/1.0/" exclude-result-prefixes="xs"
    version="2.0">

    <xsl:output method="html"/>

    <xsl:template match="/">
        <HTML>
            <HEAD>
                <BODY>
                    <h2>SPREADSHEET</h2>



                    <table>
                        <tr>
                            <td>CommentatorInitials</td>
                            <td>CommentDate</td>
                            <td>Commentary</td>


                        </tr>
                        <xsl:for-each select="/echo:echo/echo:text/echo:div/echo:c">
                            <xsl:variable name="current-c-user" select="@user"/>
                            <xsl:variable name="current-c-date" select="@date"/>
                            <xsl:variable name="current-c-content" select="./echo:p/echo:s"/>
                            
                            <tr>
                            <td>
                                <em>
                                    <xsl:value-of select="$current-c-user"/>
                                </em>
                            </td>
                            <td>
                                <em>
                                    <xsl:value-of select="$current-c-date"/>
                                </em>
                            </td>
                            <td>
                                <em>
                                    <xsl:value-of select="$current-c-content"/>
                                </em>
                            </td>
                            </tr>
                            
                            
                        </xsl:for-each>
                    </table>


                </BODY>
            </HEAD>
        </HTML>
    </xsl:template>
</xsl:stylesheet>
