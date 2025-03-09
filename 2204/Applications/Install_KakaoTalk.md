# Install KakaoTalk (Wine Required)

## 0.Requirements
1. Wine (Must installed on your Ubuntu)
2. KakaoTalk Installation file (.exe)
    - You can download installation executable from [here](https://kakaotalk.new-version.download/#download).
---
## Installation
1. Open the terminal and move to the directory that you download the installation executable.
    ```(bash)
    cd ~/Download
    ```

2. Change the locale and run the executable.
    ```(bash)
    LANG="ko_KR.UTF-8" wine KakaoTalk_Setup.exe
    ```