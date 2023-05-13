export PATH="/usr/local/opt/lua@5.3/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/lua@5.3/lib"
export CPPFLAGS="-I/usr/local/opt/lua@5.3/include"

export MySQLROOT=/usr/local/mysql
export PATH=$MySQLROOT/bin:$PATH

#export GOROOT=$(go1.18.10 env GOROOT)
export GOROOT=/usr/local/go
export GOPATH=/Users/bytedance/Workspace/Go
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
#export GOPRIVATE=""
export GOPROXY="https://goproxy.byted.org|https://goproxy.cn|direct"
export GOSUMDB="sum.golang.google.cn"

alias gocode='cd $GOPATH/src/'
alias code='cd $GOPATH/src/github.com/wenruo95'
alias gitcode='cd $GOPATH/src/github.com/wenruo95'
#alias golint='golangci-lint run'
alias golint='golangci-lint --timeout=10m run'
alias gitlog='git log --oneline --graph --decorate'
alias gotest='go test -failfast -parallel 1 -p 1 -gcflags "all=-N -l" -v -timeout 20m -coverprofile=coverage.out -coverpkg=./... ./...'
alias gotest2='go test -gcflags="all=-l -N"'
alias novim='vim -u NONE -N'

function use_bash() {
    chsh -s /bin/bash
}

function use_zsh() {
    chsh -s /bin/zsh
}

function use_go18() {
    export GOROOT=$(go1.18.10 env GOROOT)
    export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
}

function use_go19() {
    export GOROOT=/usr/local/go
    export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
}
