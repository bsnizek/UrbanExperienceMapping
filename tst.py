__author__ = 'besn'

import urllib
import httplib
from xml.dom.minidom import parse, parseString
target_url = "http://TestLocation&pagesize=50"
xml_request = """

<?xml version='1.0' encoding='UTF-8' ?>
      <<criteria>
    <includeFilterSets>
        <filterSet>
            Test
        <filterSet>"""