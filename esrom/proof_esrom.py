#by Kopeicev

from winpcapy import *
from ctypes import *
import string

LINE_LEN = 16
last_time = 0
symbols = []
current_symbol = []
morse = {
    "01":"A",
    "1000":"B",
    "1010":"C",
    "100":"D",
    "0":"E",
    "0010":"F",
    "110":"G",
    "0000":"H",
    "00":"I",
    "0111":"J",
    "101":"K",
    "0100":"L",
    "11":"M",
    "10":"N",
    "111":"O",
    "0110":"P",
    "1101":"Q",
    "010":"R",
    "000":"S",
    "1":"T",
    "001":"U",
    "0001":"V",
    "011":"W",
    "1001":"X",
    "1011":"Y",
    "1100":"Z",
    "01111":"1",
    "00111":"2",
    "00011":"3",
    "00001":"4",
    "00000":"5",
    "10000":"6",
    "11000":"7",
    "11100":"8",
    "11110":"9",
    "11111":"0",
    "000000":".",
    "010101":",",
    "111000":":",
    "101010":";",
    "110011":"!",
    "001100":"?",
    "10001":"=",
    "010010":"",
    "101101":"(",
    "011110":"'",
    "10010":"/",
    "100001":"-",
    "001101":"_",
    "011010":"@"
}

def got_packet(temp1,header,pkt_data):
    global last_time
    global symbols
    global current_symbol

    data = ""
    time = 0
    for i in range(header.contents.len):
        data += chr(pkt_data[i])

    if "secret spy script" not in data:
        return

    time = float(header.contents.ts.tv_sec)
    time += float("0." + str(header.contents.ts.tv_usec))

    if "/startSignal" in data:
        if (last_time != 0) and ((time - last_time) > 1):
            symbols.append(str(current_symbol).replace(',', '').replace(' ', '')[1:-1])
            current_symbol = []
    else:
        if (last_time != 0) and ((time - last_time) > 1):
            current_symbol.append(1)
        else:
            current_symbol.append(0)

    last_time = time


DHAND=CFUNCTYPE(None,POINTER(c_ubyte),POINTER(pcap_pkthdr),POINTER(c_ubyte))
_got_packet=DHAND(got_packet)

errbuf= create_string_buffer(PCAP_ERRBUF_SIZE)
file = create_string_buffer(b"C:\\Users\\Lenovo\\Desktop\\esrom.pcap", 35)
pcap=pcap_t
pcap = pcap_open_offline(file, errbuf)
pcap.filter = 'http'
pcap_loop(pcap, 0, _got_packet, None)
pcap_close(pcap)
symbols.append(str(current_symbol).replace(',', '').replace(' ', '')[1:-1])
flag = ""
for i in symbols:
    if i not in morse:
        print("Undefited symbol: " + i)
        exit(0)

    flag += morse[i]

print(flag)