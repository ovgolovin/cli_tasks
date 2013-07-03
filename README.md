Some bash scripts for training
=========

##### Task1
Interactive script which lists files and displays first 10 lines of chosen file

##### Task 2
Script for text document html-fication

> a) Insert "&lt;html&gt;&lt;body&gt;" at the first line.

> b) All lines starting with "Part" surround with "&lt;H2&gt;" and "&lt;/H2&gt;".

> с) End all other lines with "&lt;br&gt;".

> d) End the last line with "&lt;/body&gt;&lt;/html&gt;"

> e) Escape all special characters.

##### Task 3

There is log in this format:

```
2013-01-18 12:20:21,345 info GET  12345 /resume?id=1&rss=0 200
321.00ms
2013-01-18 12:20:22,345 info GET  12245 /resume?rss=0&id=1 200
333.00ms
2013-01-18 12:21:34,002 warn GET 11345 /vacancyerror 500  123.09ms
2013-01-18 12:22:11,932 error POST 15345 /user 200  444.44ms
....
```

format:
```
date time log_level request_type user_id url  response_code response_time
```


> a) Calculate the overall time of successful queries to the url /resume
within 12 and 1 P.M. Calculate median value, 95% quantile, 99% quantile
of resonse time on specified url.

> b) Calculate the avarage value and median by the response time of resume with
id=43 for the day specified.

> c) Plot the chart of 95%-quantile of resonse time during the day for 
3 urls: /resume /vacancy /user . Each url should have different color.
(you may use timeplot for making charts)


##### Task 4

Script for making periodic screenshots.

> Write script and init-script, which make screnshots on specified time intervals.
Screenshot frequency should be set in config file, specific for each user.
Also, config should contan default interval value.
You are free to use any program for making screenshots.

Config file example:
```
STORAGE="/var/screendumps" #path to put screenshots to
USERS=( user1 user2 user3 ) #user names
DUMP_INTEVAL=10 #default dump interval
user1_INTERVAL=15 #spesific dump interval for user1
```
