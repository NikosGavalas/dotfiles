#!/usr/bin/python3

import urllib.request
from sys import exit
import smtplib

gmail_user = 'yourmail@gmail.com'
gmail_password = 'yourpass'

cache_file = '/home/nik/check_ip_change/last_used_ip.txt'

def notify(new_ip):
	global gmail_user
	global gmail_password

	mail_to_notify = 'mail_to_notify@whatever.com'

	email_text = "From: %s\r\nTo: %s\r\nSubject: %s\r\n\r\n%s%s" % (gmail_user, mail_to_notify, "Your Server's IP has changed!", "New IP is: ", new_ip)

	server = smtplib.SMTP_SSL('smtp.gmail.com', 465)
	server.ehlo()
	server.login(gmail_user, gmail_password)
	server.sendmail(gmail_user, mail_to_notify, email_text)
	server.close()

with urllib.request.urlopen('https://api.ipify.org/') as response:
	current_ip = response.read().decode()

with open(cache_file, 'r') as f:
	last_used_ip = f.readlines()[0]

if (last_used_ip != current_ip):
	with open(cache_file, 'w') as f:
		f.write(current_ip)
	notify(current_ip)

	
