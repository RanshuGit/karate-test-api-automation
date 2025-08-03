function fn() {
    var env = karate.env;
    karate.log("Running on Environment: "+env);
    karate.configure('retry', { count: 2, interval: 3000 });
    if(!env) {
    env = 'qa';
    }
    var config = {
    env: env,
    baseUrl: 'https://restful-booker.herokuapp.com/booking'
    };
    var result = karate.callSingle("classpath:feature/createToken.feature", config);
    config.authToken = result.token;
    if(env == 'qa') {
        config.text = "qaText";
    } else if(env == 'stage') {
        config.text = "stageText";
    }
    return config;
}