#!/usr/bin/python

import sys
import socket
import struct
import urllib
import string
import urllib2
import json as simplejson
from time import strftime
from ZabbixSender import ZabbixSender

class RunDeck():
    def OpenUrl(self, usrname, passd):
        self.username = usrname
        self.password = passd
        opener = urllib2.build_opener(urllib2.HTTPCookieProcessor)
        urllib2.install_opener(opener)
        urllib2.urlopen('https://rundeck.bazaarss.com:4443/user/login')
        urllib2.urlopen('https://rundeck.bazaarss.com:4443/user/j_security_check',
        data=urllib.urlencode({'j_username': usrname,'j_password':passd}))
        return urllib2.urlopen("https://rundeck.bazaarss.com:4443/api/1/system/info").read()

if __name__ == "__main__":

    rd_obj = RunDeck()
    rd_xml = rd_obj.OpenUrl("ostet","ostet")

    zb_items_list = [['TotalMemory','total'],
                    ['MaxMemory','max'],
                    ['FreeMemory','free'],
                    ['ActiveThreads','active']]
    i=0
    for zbitem in zb_items_list:
        rd_key = zbitem[0]
        rd_val = zbitem[1]
        i=i+1
        host = "rundeck.bazaarss.com"
        from xml.etree import ElementTree as ET
        parsed = ET.fromstring(rd_xml)
        for node in parsed.getiterator():
            if node.tag == rd_val :
                parsed_value = int(node.text)
                sender = ZabbixSender("zabbix",10051)
                sender.AddData("rundeck.bazaarss.com","rundeck["+rd_key+"]",parsed_value)
                for num in range(0,2):          
                    sender.AddData(u'Zabbix server', u'test', u'sent data' + str(num))
                res = sender.Send()
                print sender.send_data
                print res
    print "Script ran: " + strftime("%H:%M:%S %m/%d/%Y ")

