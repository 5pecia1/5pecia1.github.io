## Build

1. `stack build`
2. `stack exec site build`
## Error

### windows

```cmd
about.rst: hGetContents: invalid argument (invalid byte sequence
```

=>

```cmd
chcp 65001
```

참고 : [TUTORIAL: FAQ](https://jaspervdj.be/hakyll/tutorials/faq.html#hgetcontents-invalid-argument-or-commitbuffer-invalid-argument)