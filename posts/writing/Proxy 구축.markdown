# 🥄VMware에 CentOS 7 설치하고 (Forward/Reverse)Proxy Server 구축하기

_리눅스 조금 알고 네트워크는 전혀 모릅니다._
_저와 비슷한 분들을 위해 삽질을 공유합니다._

## 환경

* VMware : 12.0.0
* CentOS : 7.2.1511 (Core)
* Squid : 3.3.8

## Proxy Server 란?

[프록시 서버 - 위키피디아](https://ko.wikipedia.org/wiki/%ED%94%84%EB%A1%9D%EC%8B%9C_%EC%84%9C%EB%B2%84)

> **프록시 서버**(영어: proxy server 프락시 서버)는 클라이언트가 자신을 통해서 다른 네트워크 서비스에 간접적으로 접속할 수 있게 해 주는 컴퓨터나 응용 프로그램을 가리킨다. 서버와 클라이언트 사이에서 중계기로서 대리로 통신을 수행하는 기능을 가리켜 '프록시', 그 중계 기능을 하는 것을 프록시 서버라고 부른다

캐시 저장 기능, 제한 기능 등 많은 기능을 가지고 있습니다.

## 구축 과정

### VMware, CentOS 7 설치

설치는 그렇게 어렵지 않습니다.
인터넷에 검색해 보세요. ^^

저는 **CentOS-7-x86_64-DVD-1511.iso** 파일을 이용했습니다.
**Create a New Virtual Machine**을 선택한 다음에 **Install form**을 선택하는 부분에서는 

```
I will install the operating system later.
The virtual machine will be created with a blank hard disk.
```

을 선택했습니다.


#### Bridge 설정

현재 가상머신을 외부에 노출하기 위해 Bridge로 설정합니다.

1. **Virtual Machine Settings**에 들어갑니다.
2. **Network Adapter**에서 **Custom**을 선택합니다.
3. **VMnet0**을 선택하고 **OK**를 누릅니다.

### Squid 설치

#### Squid 란?

Unix용 공개 웹 프록시 서버 프로그램.
[squid-cache.org](http://www.squid-cache.org/)

#### 설치

```bash
# yum -y update

...

Complete!
# yum -y install squid
# squid -v
Squid Cache: Version 3.3.8
configure options:  '--build=x86_64-redhat-linux-gnu' '--host=x86_64-redhat-linux-gnu' '--program-prefix=' '--prefix=/usr' '--exec-prefix=/usr' '--bindir=/usr/bin' '--sbindir=/usr/sbin' '--sysconfdir=/etc' '--datadir=/usr/share' '--includedir=/usr/include' '--libdir=/usr/lib64' '--libexecdir=/usr/libexec' '--sharedstatedir=/var/lib' '--mandir=/usr/share/man' '--infodir=/usr/share/info' '--disable-strict-error-checking' '--exec_prefix=/usr' '--libexecdir=/usr/lib64/squid' '--localstatedir=/var' '--datadir=/usr/share/squid' '--sysconfdir=/etc/squid' '--with-logdir=$(localstatedir)/log/squid' '--with-pidfile=$(localstatedir)/run/squid.pid' '--disable-dependency-tracking' '--enable-eui' '--enable-follow-x-forwarded-for' '--enable-auth' '--enable-auth-basic=DB,LDAP,MSNT,MSNT-multi-domain,NCSA,NIS,PAM,POP3,RADIUS,SASL,SMB,getpwnam' '--enable-auth-ntlm=smb_lm,fake' '--enable-auth-digest=file,LDAP,eDirectory' '--enable-auth-negotiate=kerberos' '--enable-external-acl-helpers=file_userip,LDAP_group,time_quota,session,unix_group,wbinfo_group' '--enable-cache-digests' '--enable-cachemgr-hostname=localhost' '--enable-delay-pools' '--enable-epoll' '--enable-icap-client' '--enable-ident-lookups' '--enable-linux-netfilter' '--enable-removal-policies=heap,lru' '--enable-snmp' '--enable-ssl' '--enable-ssl-crtd' '--enable-storeio=aufs,diskd,ufs' '--enable-wccpv2' '--enable-esi' '--enable-ecap' '--with-aio' '--with-default-user=squid' '--with-filedescriptors=16384' '--with-dl' '--with-openssl' '--with-pthreads' 'build_alias=x86_64-redhat-linux-gnu' 'host_alias=x86_64-redhat-linux-gnu' 'CFLAGS=-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches   -m64 -mtune=generic -fpie' 'LDFLAGS=-Wl,-z,relro  -pie -Wl,-z,relro -Wl,-z,now' 'CXXFLAGS=-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches   -m64 -mtune=generic -fpie' 'PKG_CONFIG_PATH=:/usr/lib64/pkgconfig:/usr/share/pkgconfig'
```

### 설정

#### Squid 관련 경로

* squid 설정 파일 : `/etc/squid/squid.conf`
* access.log, cache.log, squid.out : `/var/log/squid/`
* 캐쉬 정보 : `/var/spool/squid/`

먼저 설정을 하기전에 자신이 애용하는 텍스트 에디터를 다운받습니다.
_저는 **vim**을 사용합니다._

```bash
# yum -y install vim
```

에디터를 이용하여 `squid.conf`파일을 엽니다.

```bash
# vim /etc/squid/squid.conf
```

#### squid.conf 정보



> 자세한 사항은 [Squid configuration directives
> ](http://www.squid-cache.org/Doc/config/)을 참고하세요

#### Forward Proxy 설정

> 프록시 서버가 클라이언트로 부터 타킷 서버에 대한 요청을 받고 그 결과를 클라이언트에 전달해준다.


#### Reverse Proxy 설정

> 클라이언트는 프록시 서버에 요청을 하면 프록시 서버는 가지고 있는 타킷 서버의 결과를 전달해준다.

Squid 공식 홈페이지의 [Reverse Proxy Mode](http://wiki.squid-cache.org/SquidFaq/ReverseProxy)를 참고하여 설정하였습니다. 
그리고 [Configuring a Basic Reverse Proxy (Website Accelerator)](http://wiki.squid-cache.org/ConfigExamples/Reverse/BasicAccelerator)이것을 그대로 따라하시면 설정 하실 수 있습니다.

예시

* **8080** 포트로 접속하면 **www.naver.com**에 연결하는 코드

    _**squid.conf** 파일에 작성합니다._

    ```
  http_port 8080 accel defaultsite=www.naver.com vhost
  cache_peer www.naver.com parent 80 0 no-query originserver name=naver # 80은 접속할 도메인의 port.
  acl naver_sites dstdomain www.naver.com
  http_access allow naver_sites
  cache_peer_access naver allow naver_sites
  cache_peer_access naver deny all
```

* 도메인이 아닌 **IP**와 **Port**로 naver 메인페이지에 연결하는 코드

    _**squid.conf** 파일에 작성합니다._

    **www.naver.com**

    * **IP** 125.209.222.141
    * **Port** 80

  ```
http_port 8080 accel defaultsite=125.209.222.141:80 vhost
cache_peer 125.209.222,.141 parent 80 0 no-query originserver name=naver
acl naver_sites dst 125.209.222.141 # 다른 port는 'ip-address/mask'형식이지만 80번은 mask를 붙이지 않음.
http_access allow naver_sites
cache_peer_access naver allow naver_sites
cache_peer_access naver deny all
```

#### 포트 허용 및 부팅시에도 시작되게 설정

방화벽에서 **8080** 포트를 허용해주고 squid 시작 및 부팅시에도 시작되게 설정

```bash
# firewall-cmd --permanent --zone=public --add-port=8080/tcp
success
# firewall-cmd --reload
success
# systemctl start squid
# systemctl enable squid
Created symlink from /etc/systemd/system/multi-user.target.wants/squid.service to /usr/lib/systemd/system/squid.service.
```

---

## 참고

* VMware, CentOS
* Squid
  * [CentOS 7.2 Squid 프록시 서버 설치](http://blog.ivps.kr/25)
* Forward/Reverse Proxy
  * [Proxy 서버 구축하기](http://www.joinc.co.kr/w/Site/System_management/Proxy)
  * [포워드 프록시(forward proxy) 리버스 프록시(reverse proxy) 의 차이](https://www.lesstif.com/pages/viewpage.action?pageId=21430345)
  * [Configure Squid Proxy Server Mac Address Based Filtering](http://tecadmin.net/configure-squid-proxy-server-mac-address-based-filtering/)
* Iptraf
