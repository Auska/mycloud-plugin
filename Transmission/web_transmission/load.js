/**
 * Created by vincent on 2017/3/4.
 */
// For any third party dependencies, like jQuery, place them in the lib folder.

// Configure loading modules from the lib directory,
// except for 'app' ones, which are in a sibling
// directory.
requirejs.config({
    baseUrl: 'libs',
    waitSeconds : 30,
    paths: {
        "jquery": 'jquery/dist/jquery.min',
        "angular":'angular/angular.min',
        "angularAMD":'angularAMD/angularAMD.min',
        "angular-route":"angular/angular-route.min",
        "angular-touch":"angular/angular-touch.min",
        "lodash":"lodash/dist/lodash.min",
        "echarts":"echarts/echarts.min",
        "perfectScroll":"perfect-scrollbar/perfect-scrollbar.jquery.min",
        "jQueryScrollbar":"jQuery-Scrollbar/jquery.scrollbar.min",
        "mnTouch":"mn-touch/dist/mn-touch.min",
        "iscroll":"iscroll/build/iscroll-lite",
        "transmission":"../dist/js/transmission.min",
        "localData":"../dist/js/localdata.min",
        "init":"../dist/js/initConfig.min"
    },
    shim:{
        "angular":{
            exports:"angular"
        },
        "mnTouch":["angular"],
        "angularAMD": ["angular"],
        "angular-route":["angular"],
        "angular-touch":["angular"]
    },
    deps:["init"]
});

// Start loading the main app file. Put all of
// your application logic in there.
// requirejs(['init']);