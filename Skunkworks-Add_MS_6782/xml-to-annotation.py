#!/usr/bin/env python3

# Convert an ECHO XML file into a list of annotation JSON blobs.
#
# usage: ./xml-to-annotation.py <filename.xml>

import xml.etree.ElementTree as ET
import json
import sys

# concat_all_texts takes an ElementTree element and returns all the text()
# sections in it and its subelements as one big string.
def concat_all_texts(element):
    return "".join(element.itertext())


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

    # Not every page has an <s></s> section. and some have more than one.
    # So get all the <s> sections on this page. If there are none, make
    # an empty annotation. If there is more than one, smush them all together
    # into one annotation.
    echo_all_s = page.findall('.//echo:s', ns)
    comment = ""
    if len(echo_all_s) > 0:
        # smush all the s sections together
        comment = " ".join([concat_all_texts(s) for s in echo_all_s])
    # fix the text up so there is no leading or trailing whitespace and remove
    # the newlines, which are not important for IIIF annotations.
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

