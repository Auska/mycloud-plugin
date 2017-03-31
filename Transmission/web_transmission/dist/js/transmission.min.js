/**
 * Created by vincent on 2017/3/5.
 */
define(function () {
    "use strict";

    //解析对象是否为空对象
    var isEmptyObj = function (obj) {
        var p, c = true;
        for (p in obj) {
            if (p === undefined) {
                c = true;
                break;
            } else {
                c = false;
            }
        }
        return c;
    };

    //解析数据，保留小数点2位并转换为数字类型
    var parseZero = function (num) {
        return num === 0 ? 0 : parseFloat(num.toFixed(2));
    };

    //容量自动转换器
    var bytesConvert = function (op) {
        // op = {
        //     "data": number,需要转换单位的数据，数字类型
        //     "customUnit": "bits",自定义单位，转换后将会变成K+自定义单位，例如Kbits
        //     "band": 1024,转换单位时的整除数，默认是1000(可选参数)
        //     "minUnit": "K",最小单位，默认为K，当低于K时，需要显示正数时则设为minUnit:true，目前暂时只支持到最小到K和K以下(可选参数)
        //     "spliceUnit": true但你需要分开数字和单位时，则需要此参数。输出的数据则变为对象{num:number,unit:"string"}(可选参数)
        // }
        var num = "";
        var unit = "";
        var band = op.band ? op.band : 1000;

        op.minUnit = op.minUnit ? op.minUnit : "K";

        if (op.minUnit === true) {
            if (op.data < band) {
                num = op.data;
                unit = "B";
            }

            if (op.data >= band && op.data < Math.pow(band, 2)) {
                num = (op.data / Math.pow(band, 1));
                unit = "KB";
            }
        }

        if (op.minUnit === "K") {
            if (op.data < Math.pow(band, 2)) {
                num = (op.data / Math.pow(band, 1));
                unit = "KB";
            }
        }

        if (op.data >= Math.pow(band, 2) && op.data < Math.pow(band, 3)) {
            num = (op.data / Math.pow(band, 2));
            unit = "MB";
        }

        if (op.data >= Math.pow(1024, 3) && op.data < Math.pow(band, 4)) {
            num = (op.data / Math.pow(band, 3));
            unit = "GB";
        }

        if (op.data >= Math.pow(1024, 4)) {
            num = (op.data / Math.pow(band, 4));
            unit = "TB";
        }

        function isPositiveNum(s) {//是否为正整数
            var re = /^[0-9]*[1-9][0-9]*$/;
            return re.test(s);
        }

        if (num === 0) {
            num = 0;
        }

        if (num > 0) {
            if (isPositiveNum(num) === false) {
                num = num.toFixed(2);
            }
        }

        unit = op.customUnit !== undefined ? unit.replace("B", op.customUnit) : unit;

        return op.spliceUnit === true ? {num: num, unit: unit} : num + unit;
    };

    //流量自动转换器
    var flowConvert = function (op) {
        return bytesConvert(op);
    };

    //获取指定日期的时间戳，正整数为今天以后，负整数为今天以前，0为今天
    var getDay = function (op) {
        if (!op) {
            op = {};
        }
        if (op.type === undefined) {
            op.type = "YYYY/MM/DD";
        }

        var $fulldate = "";
        var date = new Date();
        var MS = (function () {
            return 1000 * 60 * 60 * 24 * (op.days !== undefined ? op.days : 1);
        })();

        var theDayObj = new Date();
        var theDayMS = date.getTime() + MS;

        theDayObj.setTime(theDayMS);

        //读取默认格式
        if (op.type === "YYYY/MM/DD") {
            $fulldate = theDayObj.getFullYear() + "/" + (theDayObj.getMonth() + 1) + "/" + theDayObj.getDate();
        }

        //是否以此时此刻开始计算
        if (op.now === true) {
            $fulldate += " " + theDayObj.getHours() + ":" + theDayObj.getMinutes() + ":" + theDayObj.getSeconds();
        } else {
            $fulldate += " 00:00:00";
        }

        //是否需要转换成毫秒
        if (op.needMS === true) {
            $fulldate = new Date($fulldate).getTime();
        }

        return $fulldate;
    };

    //转换时间中小时，分钟，秒小于10的时候拼接为00:00:00格式
    var parseDate = function (YY, MM, DD) {
        var $date = "";

        if (YY === 0 && MM === 0 && DD === 0) {
            $date = "";
        } else {
            if (YY < 10) {
                $date += "0" + YY;
            } else {
                $date += YY;
            }

            if (MM < 10) {
                $date += "-0" + MM;
            } else {
                $date += "-" + MM;
            }

            if (DD !== undefined) {
                if (DD < 10) {
                    $date += "-0" + DD;
                } else {
                    $date += "-" + DD;
                }
            }
        }
        return $date;
    };

    //转换时间中小时，分钟，秒小于10的时候拼接为00:00:00格式
    var parseTime = function (HH, MM, SS) {
        var $time = "";

        if (HH === 0 && MM === 0 && SS === 0) {
            $time = "";
        } else {
            if (HH < 10) {
                $time += "0" + HH;
            } else {
                $time += HH;
            }

            if (MM < 10) {
                $time += ":0" + MM;
            } else {
                $time += ":" + MM;
            }

            if (SS !== undefined) {
                if (SS < 10) {
                    $time += ":0" + SS;
                } else {
                    $time += ":" + SS;
                }
            }
        }
        return $time;
    };

    var parseFullDate = function (date, simple) {
        var $date = new Date(date);
        var fullDate = parseDate($date.getFullYear(), $date.getMonth() + 1, $date.getDate());
        var fullTime = parseTime($date.getHours(), $date.getMinutes(), $date.getSeconds());
        return simple !== true ? fullDate + " " + fullTime : fullDate;
    };

    var getFullTime = function(date){
        var $date = new Date(date);
        return parseTime($date.getHours(), $date.getMinutes(), $date.getSeconds());
    };

    var secondsToTime = function (second) {
        if (!second) {
            return 0;
        }
        var time = '';
        if(second >= 24 * 3600 * 365){
            time += parseInt(second / (24 * 3600 * 365)) + '年';
            second %= 24 * 3600 * 365;
        }

        if (second >= 24 * 3600) {
            time += parseInt(second / (24 * 3600)) + '天';
            second %= 24 * 3600;
        }
        if (second >= 3600) {
            time += parseInt(second / 3600) + '小时';
            second %= 3600;
        }
        if (second >= 60) {
            time += parseInt(second / 60) + '分钟';
            second %= 60;
        }
        if (second > 0) {
            time += second + '秒';
        }
        return time;
    };

    //保留小数点后面两位并转化为浮点数字类型
    var parseFloat2 = function (num) {
        return parseFloat((parseZero(num)).toFixed(2));
    };

    var floorToPercent = function (num) {
        var str = "";
        if(num%1===0){
            str = num*100 + "%";
        }else{
            str = parseInt(num*100) + "%";
        }
        return str;
    };

    var getPercent = function (num1,num2) {
        var $num = 0;
        if(num1 === num2){
            $num = 100;
        }else{
            $num = parseFloat((num1 / num2).toFixed(2));
        }
        return $num;
    };

    var getRatioPercent = function(limitRatio,ratio){
        return parseFloat((ratio/limitRatio).toFixed(4))*100 + "%";
    };

    //图表组件默认颜色组
    var colorGroup = ["#F7DC6F", "#A9CCE3", "#D7BDE2", "#AF7AC5", "#26C6DA", "#7986CB", "#A3E4D7", "#52BE80", "#E59866", "#B2BABB", "#F1948A", "#3498DB", "#D0D3D4", "#E74C3C", "#9FA8DA", "#A1887F", "#C5E1A5", "#FFC107"];

    return {
        "isEmptyObj": isEmptyObj,
        "parseZero": parseZero,
        "flowConvert": flowConvert,
        "bytesConvert": bytesConvert,
        "getDay": getDay,
        "parseDate": parseDate,
        "parseTime": parseTime,
        "parseFullDate": parseFullDate,
        "parseFloat2": parseFloat2,
        "secondsToTime":secondsToTime,
        "colorGroup":colorGroup,
        "floorToPercent":floorToPercent,
        "getPercent":getPercent,
        "getRatioPercent":getRatioPercent,
        "getFullTime":getFullTime
    };
});