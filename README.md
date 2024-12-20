# Tuist-Demo
# 프로젝트 구동 방법
1. Project Clone
2. Project의 경로에서 아래 명령어 입력 (Makefile에 의한 자동 명령어 flow 진행)

```bash
make project
```
<br>

Makefile Content(make project 명령어 입력하면 실행되는 명령어들)
```bash
project:
	tuist clean
	tuist install
	tuist generate --no-open
#	pod install
	open Tuist-Demo.xcworkspace
g:
	tuist generate --no-open
#	pod install
e:
	tuist edit
o:
	tuist generate --no-open
#	pod install
	open Tuist-Demo.xcworkspace
```

3. Project Open

