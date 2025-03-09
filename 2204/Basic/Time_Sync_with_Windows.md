# Modify time form (UTC to Local)
```(bash)
timedatectl set-local-rtc 1 --adjust-system-clock
```

# Check 'RTC in local TZ: yes'
```(bash)
timedatectl
```

## Done!
```(bash)
$ timedatectl 
               Local time: Sat 2024-10-12 10:34:15 KST
           Universal time: Sat 2024-10-12 01:34:15 UTC
                 RTC time: Sat 2024-10-12 01:34:15    
                Time zone: Asia/Seoul (KST, +0900)    
System clock synchronized: yes                        
              NTP service: active                     
          RTC in local TZ: yes                        

Warning: The system is configured to read the RTC time in the local time zone.
         This mode cannot be fully supported. It will create various problems
         with time zone changes and daylight saving time adjustments. The RTC
         time is never updated, it relies on external facilities to maintain it.
         If at all possible, use RTC in UTC by calling
         'timedatectl set-local-rtc 0'.
```