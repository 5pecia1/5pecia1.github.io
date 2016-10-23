---
title: Windows 환경에서 Python3-Tensorflow-Jupyter 설치 및 Pycharm 연동 방법
---

지금부터 설명하는 방법으로 설치하면  Python3-Tensorflow-Jupyter-PyCharm을 다 사용하실 수 있습니다. ~~아마도~~

# 설치 순서

1. [윈도우(Windows) 환경에서 Docker를 이용해서 Tensorflow설치하기](http://solarisailab.com/archives/384) 여기에 들어가셔서 **Step 2**까지 진행합니다. (docker 설치 완료 까지)

2. **Docker Quickstart Terminal**을 켭니다.

3. **erroneousboat/tensorflow-python3-jupyter** 이미지를 다운 받습니다.
```bash
$ docker pull erroneousboat/tensorflow-python3-jupyter
```
를 입력합니다. 

4. 그리고  **tf**라는 이름으로 컨테이너를 생성합니다.(이름은 마음대로 바꿔도 상관 없어요)
```bash
$ docker run -p 8888:8888 -p 6006:6006 --name tf  \
-v {공유하고자 하는 폴더 경로}:/notebooks \
-it erroneousboat/tensorflow-python3-jupyter
```
를 입력합니다.

> _**참고**_
> {공유하고자 하는 폴더 경로} 값 설정 방법
>
> * [Windows Docker Toolbox에서 Host PC와 폴더 공유하기](http://bryan7.tistory.com/797)
>
> 각 옵션들의 역할
>
> * http://pyrasis.com/Docker/Docker-HOWTO#docker
> * https://docs.docker.com/engine/reference/run/
>
> 각 옵션들의 의미
>
> * 8888:8888 
>     jupyter
> * 6006:6006
>    tensorboard

5. 현재 사용중인 도커 머신의 ip 값을 얻습니다.
다른 docker 입력창을 띄워서 
```bash
$ docker-machine ip
```
를 입력합니다.

6. jupyter를 사용합니다.
인터넷 주소창에 
```
http://{출력된 ip 값}:8888
```
 을 입력합니다. 

7. PyCharm과 연동합니다.
  [PyCharm Professional 버전에서 Docker로 Remote Debugging](http://bryan7.tistory.com/864)

8. 실행중인 컨테이너를 종료합니다
    1. `Ctrl + c`
    2. `y` + `Enter`
9. 컨테이너를 시작합니다.
```
$ docker start -a tf
```
10. 컨테이너를 종료합니다.
아마  `Ctrl + c`를 누르면 컨테이너를 종료하지 않고 그냥 커맨드창으로 나가질 것입니다.
그럴경우 
```bash
$ docker attach tf
```
를 입력하고  `8 번`작업을 진행합니다. 

## 파악되지 않은 것 들

* Tensorboard

---
# 참고한 자료

_위의 내용에 있는 링크는 제외_

* erroneousboat/tensorflow-python3-jupyter
    * https://hub.docker.com/r/erroneousboat/tensorflow-python3-jupyter/
    * https://github.com/erroneousboat/tensorflow-python3-jupyter
    * https://github.com/erroneousboat/tensorflow-python3-jupyter/blob/master/Dockerfile
* Tensorboard
    * http://dsmoon.tistory.com/entry/TensorBoard-Visualizing-Learning
* Windows: Using Tensorflow with Python 3 instead of Python 2 (Docker)
    * http://stackoverflow.com/questions/38411049/windows-using-tensorflow-with-python-3-instead-of-python-2-docker
* Docker
    * https://trello.com/c/MWlg7ctv/19-docker
    * https://docs.docker.com/engine/reference
* Python
    * [점프 투 파이썬](https://wikidocs.net/book/1)
* Jupyter
    * https://www.youtube.com/watch?v=VbbXUKigVfs&index=8&list=LLpuUPGyyxFEsKAAFfaLKJKA
    * http://haanjack.github.io/jupyter/ipython/2016/03/08/jupyter.html
