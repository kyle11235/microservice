# fn

http://fnproject.io/

## hello world

- https://github.com/CloudTestDrive/EventLabs/blob/master/AppDev/functions/function2_lab.md
- install docker
- install fn cli
- run

        ./start.sh
        curl http://localhost:8080/t/goapp/gofn
        ./stop.sh


## compile fn cli

- https://github.com/fnproject/cli/blob/master/CONTRIBUTING.md
- install go

        export GOPATH=/Users/kyle/go
        export PATH=$GOPATH/bin:$PATH
        source /etc/profile

- install dep

        sudo -i
        brew install dep

- install fn cli

        git clone https://github.com/fnproject/cli.git $GOPATH/src/github.com/fnproject/cli
        cd $GOPATH/src/github.com/fnproject/cli
        make dep
        make install

- test

        fn --version // fn version 0.5.74
        fn start -d (pull fn server image)
        ...
