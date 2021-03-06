# fn start -d
fn start > out.log 2>&1 &

cd /opt
rm -rf gofn

fn use context default
fn update context registry fndemouser

fn init --runtime go --trigger http gofn
cd gofn

# start fn server if dial tcp error
fn create app goapp
fn --verbose deploy --app goapp --local
fn invoke goapp gofn
