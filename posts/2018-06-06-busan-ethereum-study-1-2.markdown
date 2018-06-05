---
title: 부산 블록체인 이더리움 연구 스터디 1, 2회 정리
tags: ethereum, blockchain, dapp, solidity
---

> 부산 블록체인 이더리움 연구 스터디 [1회][1회], [2회][2회]에서 나왔던 내용을 정리하는 글 입니다.

> 스터디 대부분의 사람들이 윈도우를 사용해서 스터디에서는 윈도우 기준으로 설명을 하였습니다.

> 저는 윈도우에서 **WSL**(Windows Subsystem for Linux), **Bash on Ubuntu 16.04 on Windows**을 사용하여 개발하기 때문에 여기선 제가 설정한 환경을 기준으로 설명합니다.  
> 윈도우에서 사용하는 방법은 필요시 간단하게 언급하겠습니다.



## 솔리디티 개발 환경 설정


### [node.js & npm](https://nodejs.org/en/)

Nodejs 환경이 섞여서 버전관리가 안되는 상황을 피하기 위해 WSL내에서 **NVM**(Node Version Manager)을 설치해 Nodejs를 설치하였다.

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

**윈도우 사용자**는 [nodejs](https://nodejs.org/en/)에 들어가서 바로 설치하고 [node windows build toools](https://www.npmjs.com/package/windows-build-tools)를 설치하면 된다


### [truffle](http://truffleframework.com/)

이더리움 개발 프레임워크

위에서 **npm** 최신버전을 설치하였으면 **truffle**을 설치하는데 문제는 없다.  

1. truffle을 명령어로 설치

    ```bash
    $ npm install -g truffle
    ```

    > 가끔 `-g`로 설치하기 위해서 **Ubuntu on Windows**를 **관리자 모드**로 열어야 할 때도 있다.


### ganache

블록체인 테스트 네트워크를 만들어 주는 프로그램

UI를 이용해 쉽게 사용하기 위해서 윈도우 버전으로 설치 하였다

> 커멘드 라인에서 사용 가능한 **ganache-cli**도 있다

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

### [Remix](https://remix.ethereum.org/)

온리안 상 solidity 개발 툴  

* 코드작성, 컴파일, 디버깅, 테스트 등이 가능하다  
* 별도의 설치가 필요 없다



## 사전에 알아야 할 것(공부 해올 것)


### Solidity

이더리움 스마트계약 코드를 작성하기 위한 언어

* [크립토좀비](https://cryptozombies.io/)
* [프로그래머스](https://programmers.co.kr/pages/blockchain)



## 실습


### Rinkeby 이더리움 사용 실습

1. [블록체인 클라우드 펀딩 사이트](https://crowfunding-c9eff.firebaseapp.com/)에 들어감
2. MetaMask에서 **Create Account**로 계정을 만들고 계정 주소 복사
3. [Rinkeby](https://faucet.rinkeby.io/)에서 SNS를 통해 이더를 얻음
4. MetaMask에서 Network를 **Rinkeby**로 바꿈
5. 사이트 탐색



### [pet-shop](http://truffleframework.com/boxes/pet-shop)

truffle의 box를 이용해서 실습해보는 이더리움 튜토리얼  



### [ERC20](https://eips.ethereum.org/EIPS/eip-20)

Ethereum Request for Comment의 20번째 내용인 스마트계약 토큰 표준

여기선 erc20으로 간단하게 토큰을 만들어 본다


1. ganache를 실행
  setting에서 server 부분을 잘 확인한다
2. truffle 또는 remix로 환경 초기화

    **truffle**

    ```bash
    $ mkdir erc20
    $ cd erc20
    $ turffle init
    ```

    **remix**  

    `+`를 눌러서 **파일이름.sol** 파일을 만든다
3. 환경 설정

    **truffle**

    * **truffle.js**와 **truffle-cnofig.js**를 [http://truffleframework.com/docs/advanced/configuration](http://truffleframework.com/docs/advanced/configuration) 참고하여 초기화
    * 초기화 시 ganache server 부분을 참고한다

    **remix**  

    1. MetaMask에서 **Network**를 **Custom RPC**로 바꾼다음 ganache server 부분을 참고하여 변경
    2. **Run** -> **Environment**를 **Injected Web3**로 설정

4. **ERC20** 코드 얻기
   
   * [스터디 리더님의 코드 및 정리를 참고][erc20 정리]
   * 또는 알아서 구해도 된다

5. 가져온 코드 붙이기

  * **truffle**: **contracts/CustomToken.sol**을 만들어 붙여 넣기
  * **remix**: 이전에 만든 파일에 붙여넣기

6. complie & deploy

    **truffle**

    ```bash
    $ truffle compile
    $ truffle migrate
    ```

    > 필요시 `$ truffle migrate --reset`을 한다

    **remix**

    1. **Compile** -> **Start Compile**
    2. **Run** -> **Deploy**위의 select에서 **CustomToken**선택
    3. **Deploy** 클릭
   
7. `generate`함수에 값을 넣어 토큰 만들고 여러 함수 만져보기  
   함수에 대한 것은 [스터디 리더님의 코드 및 정리를 참고][erc20 정리]



[1회]: https://www.meetup.com/ko-KR/GDG-Busan/events/250677478
[2회]: https://www.meetup.com/ko-KR/GDG-Busan/events/250835484
[erc20 정리]: https://github.com/bear2u/erc20_token_react/blob/master/contracts/CustomToken.sol
