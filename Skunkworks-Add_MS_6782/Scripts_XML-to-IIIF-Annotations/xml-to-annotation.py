#!/usr/bin/env python

# Convert an ECHO XML file into a list of annotation JSON blobs.
#
# usage: ./xml-to-annotation.py <filename.xml>

import xml.etree.ElementTree as ET
import json
import sys

ns = {
        "xsl": "http://www.w3.org/1999/XSL/Transform",
        "xs": "http://www.w3.org/2001/XMLSchema",
        "echo": "http://www.mpiwg-berlin.mpg.de/ns/echo/1.0/"
}

data = ET.parse(sys.argv[1]).getroot()

result = {
        "@context": "http://iiif.io/api/presentation/3/context.json",
        "id": "https://github.com/azimmern/IIIF-Tests/blob/main/annotations/harriot6782-annotationspage",
        "type": "AnnotationPage",
        "items": []
        }

pages = data.findall(".//echo:div[@type='page']", ns)

for page in pages:
    pb = page.find('echo:pb', ns)
    #user = page.find('./echo:c/@user', ns)
    comment = page.findtext('.//echo:s', '', ns)
    comment = comment.strip()
    comment = comment.replace('\n', ' ')

    canvas_id = "https://iiif-cds.library.nd.edu/iiif/canvas/harriot_6782/" + pb.get('o')

    result["items"].append({
        "id": canvas_id,
        "type": "Annotation",
        "motivation": "commenting",
        "body": {
            "type": "TextualBody",
            "format": "text/plain",
            "chars": comment
        },
        "target": canvas_id
    })


print(json.dumps(result))

