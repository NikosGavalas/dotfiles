#!/usr/bin/python3

import urllib.request
from sys import exit
import smtplib

GMAIL_USER = 'yourmail@gmail.com'
GMAIL_PASSWORD = 'yourpass'
MAIL_TO_NOTIFY = 'mail_to_notify@whatever.com'

CACHE_FILE = '/path/to/cache.txt'


def notify(user, password, dest, new_ip):
    email_text = "From: {}\r\nTo: {}\r\nSubject: {}\r\n\r\n{}{}".format(
        user, dest, "Your Server's IP has changed!", "New IP is: ", new_ip)
    server = smtplib.SMTP_SSL('smtp.gmail.com', 465)
    server.ehlo()
    server.login(user, password)
    server.sendmail(user, dest, email_text)
    server.close()


with urllib.request.urlopen('https://api.ipify.org/') as response:
    current_ip = response.read().decode()

with open(CACHE_FILE, 'r') as f:
    last_used_ip = f.readlines()[0]

if (last_used_ip != current_ip):
    with open(CACHE_FILE, 'w') as f:
        f.write(current_ip)
    notify(GMAIL_USER, GMAIL_PASSWORD, MAIL_TO_NOTIFY, current_ip)
