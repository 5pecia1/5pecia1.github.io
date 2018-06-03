---
title: 부산 블록체인 이더리움 연구 스터디 1, 2, 3회 정리
tags: ethereum, blockchain, dapp, solidity
---

> 부산 블록체인 이더리움 연구 스터디 [1회][1회], [2회][2회], [3회][3회]에서 나왔던 내용을 정리하는 글 입니다.  
> 스터디 대부분의 사람들이 윈도우를 사용해서 스터디에서는 윈도우 기준으로 설명을 하였습니다.  
> 저는 윈도우에서 **WSL**(Windows Subsystem for Linux)을 사용하여 개발하기 때문에 여기선 제가 설정한 환경을 기준으로 설명합니다.  
> 윈도우에서 사용하는 방법은 필요시 간단하게 언급하겠습니다.


## 사전에 알아야 할 것

### Solidity

### Node.js

### 


## 이더리움 개발 환경 설정


### [node.js & npm](https://nodejs.org/en/)

환경이 섞여서 버전관리가 안되는 상황을 피하기 위해 WSL내에서 **NVM**(Node Version Manager)을 설치해 Nodejs를 설치하였다.

1. [nvm github](https://github.com/creationix/nvm#installation)에 들어가서 먼저 NVM을 설치
2. 최신 nodejs 설치

    ```bash
    $ nvm install node
    ```
3. 확인(버전은 달라질 수 있다)

    ```bash
    $ npm -v
    5.6.0
    ```

**윈도우 사용자**는 [nodejs](https://nodejs.org/en/)에 들어가서 바로 설치하면 된다.


### [truffle](http://truffleframework.com/)

이더리움 개발 프레임워크

위에서 **npm**을 설치하였으면 **truffle**을 설치하는데 문제는 없다.  

> 가끔 `-g`로 설치하기 위해서 WSL을 **관리자 모드**로 열어야 할 때도 있다.

1. truffle을 명령어로 설치

    ```bash
    $ npm install -g truffle
    ```


### ganache

블록체인 테스트 네트워크를 만들어 주는 프로그램

UI를 이용해 쉽게 사용하기 위해서 윈도우 버전으로 설치 하였다.

> 커멘드 라인에서 사용 가능한 **ganache-cli**도 있다.

1. [ganache](http://truffleframework.com/ganache/)에 들어가서 다운로드 후 설치


### Visual Studio Code

코드 작성 프로그램

1. [Visual Studio Code](https://code.visualstudio.com/)에서 설치


<!-- TODO: #### WSL을 VS code 에서 사용하기 -->

#### 필수 확장 툴

아래 툴들을 `Ctrl + Shift + x`를 눌러서 설치해 준다

* Prettier
* solidity 


### MetaMask

이더리움을 브라우저에서 사용할수 있게 해주는 크롬 확장 프로그램

1. 크롬에서 [MetaMask](https://chrome.google.com/webstore/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn)에 들어가서 설치




[1회]: https://www.meetup.com/ko-KR/GDG-Busan/events/250677478
[2회]: https://www.meetup.com/ko-KR/GDG-Busan/events/250835484
[3회]: https://www.meetup.com/ko-KR/GDG-Busan/events/npwvspyxhbnc/
