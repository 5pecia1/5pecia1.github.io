---
title: Git alias for hakyll
---

Hakyll 공식 Tutorial에 있는 [TUTORIAL: USING HAKYLL WITH GITHUB PAGES](https://jaspervdj.be/hakyll/tutorials/github-pages-tutorial.html)에는 **develop**에서 빌드를 하고 **master**에서 **\_site/**디렉토리를 `cp -a _site/ .`명령을 이용해 메인 디렉토리롤 복사를 합니다. 그리고 **master**만 github에 올리면 된다고 나와 있습니다.

저는 추가로 **develop**도 올리기 때문에 **develop**도 커밋하고 **master**에 같은 내용으로 커밋하는 것이 번거로워 다름과 같은 **git alias**를 만들어 봤습니다.

<script src="https://gist.github.com/5pecia1/193901ef79b5f452e7e5cb8b7f92d0d8.js"></script>

> 위의 내용을 `.git/config`파일에 붙여넣으시면 사용하실 수 있습니다. 

* **make-master**
    * **master**가 아닌 현재의 branch에서 **master**로 checkout하고 **\_site/** 디렉토리를 현재의 폴더에 복사하는 명령입니다.
* **commit-develop-and-master**
    * **master**가 아닌 현재의 branch에서 add된 파일들은 commit하고 커밋 메시지를 다 입력하면 **make-master**를 실행한 다음 모든 파일을 add하고 커밋하는 명령 입니다.
    * `-m` 옵션을 사용하면 **develop** branch와 **master** branch를 같은 커밋 메시지로 한번에 커밋이 가능합니다.