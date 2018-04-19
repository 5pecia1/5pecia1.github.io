---
title: (Vim, Visual Studio Code, Git) 윈도우에서 줄바꿈을 Line Feed(LF, \n)문자로 하기
tags: git, vim, vscode, windows
---

>_이번 글에서는 CRLF(\r\n)으로 되어 있는 모든 파일을 LF(\n)으로 한번에 변환하는 작업은 다루지 않습니다._  
>_좋은 방법을 아시면 공유 부탁 드립니다._

대부분의 윈도우에서 작업한 text의 새줄 문자(newline, 개행 문자, 줄바꿈 문자, eol)는 Carriage Return(CR)과 Line Feed(LF)값입니다. 그리고 유닉스에서는 LF값 입니다.

그렇지만 윈도우에서 작업한 결과를 유닉스 환경에서 사용하기 위해 LF값만 사용해야 될 때가 있습니다. 

저같은 경우 작업은 윈도우에서 작성하고 하고 빌드를 Docker에서 하니 새줄 문자가 달라서 이상한 결과가 출력되었습니다. 이런 현상을 해결한 방법을 공유하고자 글을 씁니다.

## Vim

Vim은 간단하게 변환할 수 있습니다.

1. 적용할 파일을 vim으로 엽니다

2. 명령 모드에서 

    ```
    :set ff=unix
    ```

    위와 같이 작성하고 엔터를 누릅니다.
    엔터를 누르더라도 별다른 반응은 보이지 않습니다만, CRLF값을 LF로 바꿔줍니다.  
    그리고 그 이후에 작성한 결과도 LF 값으로 작성이 됩니다.

3. 저장합니다.

<br/>
**반대로**

```
:set ff=dos
```

도 가능합니다.

## Visual Studio Code

VSCode에서는 Extension을 설치하면 모르겠지만 기본 기능중에서 변환 기능은 없는것 같습니다.  
다만 작성할 때 LF로 저장이 가능하게 작성하는 방법을 소개하겠습니다.

1. **파일** -> **기본 설정** -> **사용자 영역 설정** 또는 **작업 영역 설정**을 선택합니다.
    * **사용자 영역 설정** 전역으로 모든 작업에서 적용 가능하게 설정 하는 방법입니다.  
    * **작업 영역 설정** 현재 작업하고 있는 폴더에서만 적용 가능하게 설정 하는 방법입니다.  

    > 일반적으로 윈도우에서 특정 프로젝트만 LF로 작업하기 때문에 **작업 영역 설정**을 선택하는것을 추천 합니다.

2. `settings.json`파일에 

    ```
    "files.eol": "\n"
    ```

    값을 추가하고 저장합니다.
    최종적으로 작업 디렉토리에 `.vscode/settings.json` 파일이 생길 것입니다.

## Git

열심히 LF로 새줄 문자가 나오게 설정을 하고 Git으로 커밋을 했지만, 윈도우에서 Git 기본 설정일 경우 `git checkout`같은 파일에 변화를 주는 명령을 사용하면 CRLF로 변환이 됩니다. Docker에서 사용하면 LF값 그대로 checkout됩니다.

이런 결과는 Git의 윈도우와 유닉스의 환경 호환을 위한 기능 때문에 일어납니다.  

> **참고** 
>
> [Git맞춤 - Git 설정하기#Formatting and Whitespace](https://git-scm.com/book/ko/v2/Git%EB%A7%9E%EC%B6%A4-Git-%EC%84%A4%EC%A0%95%ED%95%98%EA%B8%B0#Formatting-and-Whitespace)
>
>> Git은 커밋할 때 자동으로 CRLF를 LF로 변환해주고 반대로 Checkout 할 때 LF를 CRLF로 변환해 주는 기능이 있다. core.autocrlf 설정으로 이 기능을 켤 수 있다. 윈도에서 이 값을 true로 설정하면 Checkout 할 때 LF 문자가 CRLR 문자로 변환된다.

그렇기 때문에 Git을 사용한다면 이런 기능을 꺼주는 설정을 해야 합니다.

명령 프롬프트나 Git Bash 등에서 작성합니다.  
LF를 새줄 문자로 사용하는 설정 입니다.

> 아래의 명령에는 `--global` 옵션이 들어가 있는데 일반적으로 윈도우에서 특정 프로젝트만 LF로 작업하기 때문에 빼주는 것이 좋습니다.

```bash
git config --global core.eol lf
git config --global core.autocrlf input
``` 

이제 commit 및 checkout할 때 LF값을 사용할것 입니다. 

## 변환 결과를 확인하는 간단한 방법

Vim이나 VSCode는 CRLF이던지 LF이던지 상관없이 출력이 잘 되기 때문에 바뀌었는지 안바뀌었는지 알 수가 없습니다.  
결과를 확인하고 싶으시면 윈도우의 메모장(Notepad)를 사용하면 됩니다.

![CRLF일 경우](../images/2016-11-22-crlf.png)

<br/>

![LF일 경우](../images/2016-11-22-lf.png)

---
## 참고한 자료

_위의 내용에 있는 링크는 제외_

* [새줄 문자](https://ko.wikipedia.org/wiki/%EC%83%88%EC%A4%84_%EB%AC%B8%EC%9E%90)
* [git 에서 CRLF 개행 문자 차이로 인한 문제 해결하기](https://www.lesstif.com/pages/viewpage.action?pageId=20776404)
* [How do I force git to use LF instead of CR+LF under windows?](http://stackoverflow.com/questions/2517190/how-do-i-force-git-to-use-lf-instead-of-crlf-under-windows)
* [Vim Vi, 도스 텍스트를 유닉스 텍스트로 개행문자 변환; DOS CR-LF to Unix Newline](http://mwultong.blogspot.com/2007/05/vim-vi-dos-cr-lf-to-unix-newline.html)
