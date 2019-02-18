cd /u02/app
rm -rf gofn

fn use context default
fn update context registry fndemouser

fn init --runtime go --trigger http gofn
cd gofn
fn create app goapp
fn --verbose deploy --app goapp --local
fn invoke goapp gofn
