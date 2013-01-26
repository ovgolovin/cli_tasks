#!/usr/bin/python
# -*- coding: UTF-8 -*-
from __future__ import division

import random
import time
from datetime import datetime, timedelta


def generate_url_and_code():
    def resume():
        ps = ['id={}'.format(random.randrange(0,100)),
                'rss={}'.format(random.choice((0,1)))]
        random.shuffle(ps)            
        return '/resume?{}'.format('&'.join(ps)), '200'
    
    def vacancyerror():
        return '/vacancyerror', '500'
    
    def user():
        return '/user', '200'
    
    return random.choice((resume,vacancyerror,user))()


with open('log.txt','w') as f:
    time = datetime(year=2013, month=1, day=20, hour=12, minute=00) + timedelta(minutes=-1)
    timeend = time + timedelta(hours=1, minutes=2)
    while(True):
        time = time + timedelta(milliseconds = random.normalvariate(1000, 200))
        url, code = generate_url_and_code()
        out = '\t'.join([time.strftime('%Y-%m-%d\t%H:%M:%S') + ',' + '{:03.0f}'.format(time.microsecond / 1000),
                random.choice(('info', 'warn', 'error')),
                random.choice(('GET', 'POST')),
                '{}'.format(random.randrange(10000, 15000)),
                url,
                code,
                '{:0.2f}ms'.format(random.normalvariate(400, 60))
                ])
        f.write('{}\n'.format(out))
        if time >= timeend:
            break
		
		
