<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"    
    xmlns:echo="http://www.mpiwg-berlin.mpg.de/ns/echo/1.0/"
    exclude-result-prefixes="xs"
    version="2.0">
    
    
    <xsl:output method="text" encoding="UTF-8"/>
    
    <xsl:template match="/">
        
        {
        "@context": "http://iiif.io/api/presentation/2/context.json",
        "@id": "https://iiif-cds.library.nd.edu/iiif/manifest/harriot_6782",
        "@type": "sc:Manifest",
        "label": "Harriot MS 6782",
        "metadata": [],
        "description": [
        {
        "@value": "Notes of Thomas Harriot. Images from the British Library.",
        "@language": "en"
        }
        ],
        "license": "https://creativecommons.org/licenses/by/3.0/",
        "sequences": [
        {
        "@id": "http://c0f719f6-601d-46d7-953e-4985d8c36f51",
        "@type": "sc:Sequence",
        "label": [
        {
        "@value": "Normal Sequence",
        "@language": "en"
        }
        ],
        "canvases": [
<!--        Start of the canvases-->
        
        <xsl:for-each select="/echo:echo/echo:text/echo:div[@type='page']">
            {
            "@id": "https://iiif-cds.library.nd.edu/iiif/canvas/harriot_6782/p<xsl:value-of select="./echo:pb/@o"/>",
            "@type": "sc:Canvas",
            "label":"<xsl:value-of select="./echo:pb/@n"/>,
            "height": ""
            "width" : ""
<!--            Don't forget to find a python-y way to add "height" and "width" of the canvas-->
            "images": [
                {
                    "@context":"http://iiif.io/api/presentation/2/context.json",
                    "@id": ""
<!--                  Don't forget to find a way to random-generate an "@id" -->
                    "@type":dctypes:Image",
                    "format": "image/jpeg",
                    "service": {
                        "@context": "http://iiif.io/api/image/2/context.json",
                        "@id": "https://iiif-cds.library.nd.edu/image/<xsl:value-of select="./echo:pb/@file"/>.jpg",
                        "profile": [
                        "http://iiif.io/api/image/2/level2.json"
                        ]
                    },
                    "height": "",
                    "width": ""
<!--                   Don't forget to use the same python-y method to add "height" and "width" of the image -->
                },
                "on": "https://iiif-cds.library.nd.edu/iiif/canvas/harriot_6782/p<xsl:value-of select="./echo:pb/@o"/>",
              }
              ],
              "related": ""   
         
        }
        
        
        ,
        </xsl:for-each>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
<!--        End of the Canvases             -->
        
        ],
        "structures": [],
        "viewingDirection": "left-to-right"
        }
        
    </xsl:template>
        
    
    
    
</xsl:stylesheet>