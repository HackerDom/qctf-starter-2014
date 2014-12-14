#by Kopeicev

import urllib.request
from re import findall
from time import time
import http.cookiejar

answers = []
counter = 0

cookies = http.cookiejar.CookieJar()
opener = urllib.request.build_opener(urllib.request.HTTPCookieProcessor(cookies))

start = time()
handle = opener.open("http://juicy-media.ru/ctfs/quiz/")
page = handle.read().decode('utf8', errors='ignore')
while ("./index.php?answer=" in page):
    print("Level: " + str(counter))
    if counter == len(answers):
        answers.append(findall('<label>(.*?)</label>', page))

    handle = opener.open("http://juicy-media.ru/ctfs/quiz/index.php?answer=" +
                                    str(str(answers[counter][0]).encode())[2:-1].replace("\\x", "%").replace(" ", "%20"))
    new_page = handle.read().decode('utf8', errors='ignore')

    if ">1 / 100" in new_page:
        answers[counter] = answers[counter][1:]
        counter = 0
    else:
        counter += 1

    page = new_page

print(time()-start)
print(findall('Your flag is (.*?)</div>', page)[0])