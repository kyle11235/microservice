# fn

http://fnproject.io/

## hello world

- https://github.com/CloudTestDrive/EventLabs/blob/master/AppDev/functions/function2_lab.md
- install fn cli
- run

        start docker
        ./start.sh
        curl http://localhost:8080/t/goapp/gofn
        ./stop.sh

## compile fn cli

- https://github.com/fnproject/cli/blob/master/CONTRIBUTING.md
- install go with GOPATH set
- install fn cli

        git clone https://github.com/fnproject/cli.git $GOPATH/src/github.com/fnproject/cli
        cd $GOPATH/src/github.com/fnproject/cli
        make
        make install

- run

        start docker
        fn --version // fn version 0.5.74
        ...
