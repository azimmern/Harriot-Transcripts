<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"    
    xmlns:echo="http://www.mpiwg-berlin.mpg.de/ns/echo/1.0/"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text" encoding="UTF-8"/>
    
    <xsl:strip-space elements="*"/>
    
    
    
    <xsl:template match="/">
        
      
        
<!--        Build an Annotation List-->
    
    {
        "@context": "http://iiif.io/api/presentation/3/context.json",
        "id": "https://github.com/azimmern/IIIF-Tests/blob/main/annotations/harriot6782-annotationspage",
        "type": "AnnotationPage",
        
        "items": [ 
        <xsl:for-each select="/echo:echo/echo:text/echo:div[@type='page']">
            
            
                    {
                    "id": "https://iiif-cds.library.nd.edu/iiif/canvas/harriot_6782/<xsl:value-of select="./echo:pb/@o"/>",
                        "type": "Annotation",
                        "motivation": "commenting",
                        "body": {
                            "type": "TextualBody",
                            "format": "text/plain",
                            "chars": "<xsl:value-of select="./echo:c/echo:p/echo:s/text()"/>"
                
                            },
                            "target": "http://iiif-cds.library.nd.edu/iiif/canvas/harriot_6782/<xsl:value-of select="./echo:pb/@o"/>"
                    },
        </xsl:for-each>
        
    
    
             ]
}


        
        
    </xsl:template>    
    
    
    
    
    
    <!--    {
    "id": "http://localhost:8887/coin/list/1",
    "type": "Annotation",
    "motivation": "commenting",
    "body": {
        "type": "TextualBody",
        "format": "text/plain",
        "chars": "Zeus seated on stool-throne"
    },
    "target": "http://localhost:8887/coin/canvas#xywh=3706,208,522,522"
}-->
</xsl:stylesheet>