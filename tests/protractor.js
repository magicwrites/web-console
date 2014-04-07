var ScreenShotReporter = require('protractor-screenshot-reporter');
var cwd = process.cwd();

// An example configuration file.
exports.config = {
    // Do not start a Selenium Standalone sever - only run this using chrome.
    // chromeOnly: true,
    // chromeDriver: './node_modules/protractor/selenium/chromedriver',
    seleniumAddress: 'http://localhost:9515',

    // Capabilities to be passed to the webdriver instance.
    capabilities: {
        'browserName': 'phantomjs'
    },

    // Spec patterns are relative to the current working directly when
    // protractor is called.
    specs: ['**/*.spec.js'],

    // Options to be passed to Jasmine-node.
    jasmineNodeOpts: {
        showColors: true,
        defaultTimeoutInterval: 30000
    },

    onPrepare: function() {
        // Add a screenshot reporter and store screenshots to `/tmp/screnshots`:
        jasmine.getEnv().addReporter(new ScreenShotReporter({
            baseDirectory: './../tmp/screenshots'
        }));
    }
};