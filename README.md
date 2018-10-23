# statik embeded static resource for golang application

## How  to Run(local)

* install statik

```code
go get github.com/rakyll/statik
```

* generate code

```code
 statik -src=./ui

 or:

 go generate

```

* build

```code
go build -o webui .
```

## With docker

* build

```code
docker-compose build
```

* run

```code
dokcer-compose up -d
```
