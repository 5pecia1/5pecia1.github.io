---
title: 크립토 좀비 레슨 1
tags: ethereum, solidity, blockchain, crypto-zombies
---

> [크립토 좀비](cryptozombies.io)를 공부하며 정리한 글입니다.  


## Version Pragma

* 컴파일러에게 버전을 알려준다

```solidity
pragma solidity ^0.4.19
```



## Contract

* 기본적인 구성 요소

```solidity
contract HelloWorld {
}
```



## Statet Variable 

* 컨트랙트 저장소에 영구적으로 저장됨  
* DB를 사용하는 것과 동일


### Unsigned Integers


#### uint

* 부호없는 정수
* 값이 음수가 아니어야 한다
* 솔리디티에서 `uint`는 실제로 `uint256`의 256비트 부호없는 정수의 다른 표현이다.
* `uint8`, `uint16` 도 있지만 보통 `uint`를 사용


#### int

* 부호가 있는 정수

```solidity
contract HelloWrold{
    unit undisngedInteger = 100;
}
```



## Math Operations

* 대부분의 프로그래밍 기본 연산과 동일
* `**`를 이용한 지수 연산 지원



## Structs

* 더 복잡한 자료형을 필요로 할 때 사용

```solidity
struct Person {
    uint year;
    string name;
}

Person sol = Person(123, "sol");
```

* 참고로 `string`은 임의의 길이를 가진 UTF-8 데이터



## Arrays

* 솔리디티에는 **동적**, **정적** 배열이 있다
* 동적배열을 생성하면 마치 DB처럼 컨트랙트에 구조화된 데이터 저장하는데 유용

```solidity
uint[3] fixed;

uint[] dynamic;

Person[] dynamicStructArray;

dynamic.push(12);
```


### Public Arrays

* `getter`메소드를 자동적으로 생성
* 다른 컨트랙트들이 읽을 수 있게 됨
  * 공개 데이터 저장에 유용

```solidity
Person[] public people;
```



## Function Declarations

```solidity
function eatHambugers(string _name, uint _amount) {
}

eatHambugers("sol", 100);
```

* `eatHamburgers`라는 함수로, `string`과 `uint` 2개의 인자를 전달받고 있다.
* 함수의 인자명을 `_`로 시작해서 전역변수와 구별하는 것이 관례



## Private / Public function

* 솔리디티에서 기본적으로 함수는 `public`
* `private`키워를 함수명 다음에 적어주면 된다
* `_`로 시작하는 것이 관례

```solidity
function _addToArray(uint _arr) private {
}
```



## More on Functions


### Return Valuese

* 솔리디티에서는 반환값 종류를 포함한다

```solidity
string greeting = "Hi";

function sayHi() public returns (string) {
    return greeting;
}
```

### Function modifiers

* 함수가 상태를 변화시키지 않으면 `view`함수로 선언

```solidity
function sayHi() public view returns (string) {
```

* 함수가 앱에서 어떤 데이터도 접근하지 않으면 `pure`함수로 선언

```solidity
function _mul(uint a, uint b) private pure returns (uint) {
    return a * b;
}
```



## Keccak256

* SHA3의 한 버전인 `keccak256`을 내장 해시 함수로 가지고 있음
* 256비트 16진수로 매핑함
* 난수 발생기로도 이용 가능

```solidity
keccak256("abcd");
keccak256("abce");
```

> 블록체인에서 안전한 의사 난수 발생기는 매우 어려운 문제이다



## Typecasting

```solidity
uint8 a = 5;
uint b = 6;

uint8 c = a * b; //error

uint8 c = a * uint8(b)
```



## Events

* 블록체인 상에서 앱의 사용자 단에서 무언가 액션이 발생했을 때 의사소통 하는 방법
* 컨트랙트는 특정 이벤트가 일어나면 행동을 취한다

```solidity
event IntegersAdded(uint x, uint y, uint result);

function add(uint _x, uint _y) public {
    uint result = _x + _y;
    // add 함수가 실행되었다는 것을 알린다
    IntegersAdded(_x, _y, _result);
    return result;
}
```
