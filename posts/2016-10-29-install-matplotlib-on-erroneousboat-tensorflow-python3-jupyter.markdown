---
title: erroneousboat/tensorflow-python3-jupyter에서 matplotlib 설치 방법
---

Docker 환경에서 [erroneousboat/tensorflow-python3-jupyter][docker-image] 이미지를 이용해서 [모두를 위한 머신러닝/딥러닝 강의][lecture-list]에 있는 [ML lab 03 - Linear Regression 의 cost 최소화의 TensorFlow 구현][lab-video]를 공부하던 중 [matplotlib][matplotlib]을 사용하는 부분이 나와 설치를 했습니다.  
간단하지만 설치법을 공유합니다.

**erroneousboat/tensorflow-python3-jupyter** 이미지는 Dockerfile에  `CMD ["/run_jupyter.sh"]` 명령어가 있어서 컨테이너를 시작하면 셀 없이 바로 Jupyter가 실행이 됩니다.  
그렇기 때문에 `docker exec`명령어를 이용해서 라이브러리를 설치했습니다.

## 설치 방법

1. Docker container를 실행시킵니다.  
   저의 경우에는
    ```bash
    $ docker start tf
    ```
2. **apt-get**을 update 합니다.
    ```bash
    $ docker exec tf apt-get update
    ```
3. **matplotlib**을 설치합니다.
    ```bash
    $ docker exec tf apt-get install -y python-matplotlib
    ```

---

## 참고한 자료

* [강의 댓글][lab-comment]

</br></br>
_좋은 강의를 만들어 주신 [Sung Kim](https://github.com/hunkim) 교수님께 감사를 드리며..._

[docker-image]: https://hub.docker.com/r/erroneousboat/tensorflow-python3-jupyter/
[lecture-list]: http://hunkim.github.io/ml/
[lab-video]: https://www.youtube.com/watch?v=pHPmzTQ_e2o
[matplotlib]: http://matplotlib.org/
[lab-comment]: https://www.youtube.com/watch?v=pHPmzTQ_e2o&lc=z12yh114uvmszhuah04ch5gyuvqafb4iri4
