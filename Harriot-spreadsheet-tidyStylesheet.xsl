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
                            <td>FileID</td>
                            <td>FolioPage</td>
                            <td>SequentialPage</td>
                            <td>Author</td>
                            <td>CommentaryDate</td>

                            <td>CommentaryContent</td>
                            <!--                            There can be multiple "CommentaryContent" entries (i.e. multiple <s> within a single <c>);
                                at the moment, they all get concatenated into a single table-cell <td>;
                                is there a need and, if so, a way to separate them?-->
                            <td>Heading</td>
                            <td>HeadingTranslation</td>
                            <td>Transcription</td>
                            <td>TranscriptionTranslation</td>


                        </tr>


                        <xsl:for-each select="/echo:echo/echo:text/echo:div[@type = 'page']">

                            <xsl:variable name="current-fileID" select="./echo:pb/@file"/>
                            <xsl:variable name="current-folioPage" select="./echo:pb/@o"/>
                            <xsl:variable name="current-sequentialPage" select="./echo:pb/@n"/>
                            <xsl:variable name="current-author" select="./echo:c/@user"/>
                            <xsl:variable name="current-comm-date" select="./echo:c/@date"/>
                            <xsl:variable name="current-comm-content"
                                select="./echo:c/echo:p/echo:s"/>
                            <xsl:variable name="current-heading" select="./echo:head/text()"/>
                            <!--                            The <head> and child element <t> are both getting captured in this xPath; everything I'm finding suggests that *[not(self::t)-->

                            <xsl:variable name="current-heading-translation"
                                select="./echo:head/echo:t"/>

                            <tr>
                                <td class="fileID">
                                    <em>
                                        <xsl:value-of select="$current-fileID"/>
                                    </em>
                                </td>
                                <td class="folioPage">
                                    <em>
                                        <xsl:value-of select="$current-folioPage"/>
                                    </em>
                                </td>
                                <td class="sequentialPage">
                                    <em>
                                        <xsl:value-of select="$current-sequentialPage"/>
                                    </em>
                                </td>
                                <td class="author">
                                    <em>
                                        <xsl:value-of select="$current-author"/>
                                    </em>
                                </td>
                                <td class="commentaryDate">
                                    <em>
                                        <xsl:value-of select="$current-comm-date"/>
                                    </em>
                                </td>
                                <td class="commentaryContent">
                                    <em>
                                        <xsl:value-of select="$current-comm-content"/>
                                    </em>
                                </td>
                                <td class="heading">
                                    <em>
                                        <xsl:value-of select="$current-heading"/>
                                        <!--<xsl:value-of select="./echo:head"/>-->
                                    </em>
                                </td>
                                <td class="headingTranslation">
                                    <em>
                                        <xsl:value-of select="$current-heading-translation"/>
                                        <!--<xsl:apply-templates mode="t-template"/>-->
                                    </em>
                                </td>

                                <xsl:for-each select="./echo:p">

                                    <xsl:for-each select="./echo:s">
                                        <tr>
                                            
                                            <td class="fileID">
                                                <em>
                                                    <xsl:value-of select="$current-fileID"/>
                                                </em>
                                            </td>
                                            <td class="folioPage">
                                                <em>
                                                    <xsl:value-of select="$current-folioPage"/>
                                                </em>
                                            </td>
                                            <td class="sequentialPage">
                                                <em>
                                                    <xsl:value-of select="$current-sequentialPage"/>
                                                </em>
                                            </td>
                                            <td class="author">
                                                <em>
                                                    <xsl:value-of select="./echo:t/@user"/>
                                                </em>
                                            </td>
                                            <td class="commentaryDate">
                                                <em>
                                                    <xsl:value-of select="./echo:t/@date"/>
                                                </em>
                                            </td>
                                            <td class="commentaryContent">
                                                <em>
                                                    
                                                </em>
                                            </td>
                                            <td class="heading">
                                                <em>
                                                    <xsl:value-of select="$current-heading"/>
                                                    <!--<xsl:value-of select="./echo:head"/>-->
                                                </em>
                                            </td>
                                            <td class="headingTranslation">
                                                <em>
                                                    <xsl:value-of select="$current-heading-translation"/>
                                                    <!--<xsl:apply-templates mode="t-template"/>-->
                                                </em>
                                            </td>
                                            
                                            <td class="transcription">
                                                <em>
                                                  <xsl:value-of select="./text()"/>
                                                </em>
                                            </td>

                                            <td class="transcriptionTranslation">
                                                <em>
                                                  <xsl:value-of select="./echo:t"/>
                                                </em>
                                            </td>
                                        </tr>
                                    </xsl:for-each>
                                </xsl:for-each>







                            </tr>

                        </xsl:for-each>





                    </table>


                </BODY>
            </HEAD>
        </HTML>

    </xsl:template>

    <!--<xsl:template match="echo:t" mode="t-template">
        
        <xsl:text>HOWDY!!!</xsl:text>
    </xsl:template>-->


</xsl:stylesheet>
