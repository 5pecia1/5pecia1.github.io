---
title: git alias for hakyll
---

HAKYLLL 공식 TUTORIAL에 있는 [TUTORIAL: USING HAKYLL WITH GITHUB PAGES](https://jaspervdj.be/hakyll/tutorials/github-pages-tutorial.html)내용을 간간하게 요약해 보자면 github pages를 만들기위해 **develop**와 **master** 두가지의 branch를 만듭니다.  
빌드의 결과가 나오는 **\_site/**와 그 외의 다른 몇몇 디렉토리들을 **.gitignore**파일에 추가 시킵니다.
그리고 **develop**에서 빌드를 하고 **master**에서 **\_site/**디렉토리를 `cp -a _site/. .`명령으를 이용해 메인 디렉토리로 복사를 합니다.  
해당 **master** 커밋하고 **<자신의 아이디>.github.io**로 시작하는 github repository에 올리면 github pages를 만들 수 있다고 나와 있습니다.

저는 **develop**도 올리는 것으로 해서 조금 다른 방법으로 하기 때문에 **develop**에 commit하고 다시 **master**에 같은 내용으로 커밋하는 것이 번거로워 다음과 같은 **git alias**를 만들어 봤습니다.

<script src="https://gist.github.com/5pecia1/193901ef79b5f452e7e5cb8b7f92d0d8.js"></script>

> 위의 내용을 `.git/config`파일에 넣으시면 사용하실 수 있습니다.

