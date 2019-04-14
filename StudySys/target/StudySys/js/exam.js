Handlebars.registerHelper('themeColor', function () {
    return 'background-color:' + M.getCookie('themeColor');
});
// 通过资源的类型显示资源的预览
Handlebars.registerHelper('resPreview', function (data) {
    var html = '';

    switch (data.resTypeId) {
        case 1: /* 视频课程 */
            html += '<div class="thumbnail is-play">';
            html += '<img src="' + data.middleIcon + '">';
            html += '<a class="view_btn" href="javascript:void(0);">';
            html += '<div><img src="images/learn_icon01.png">';
            if (data.mediaTime) {
                html += '<p style="font-size: 15px;color: #fff;text-align: center;margin-top: 180px;">' + data.mediaTime + '</p>';
            }
            html += '</div>';
            html += '</a>';
            html += '<div id="audio_video-view"></div>';
            html += '</div>';
            return html;
            break;
        case 2: /* 图片课程 */
        case 3: /* PDF课程 */
        case 4: /* PPT课程 */
        case 5: /* WORD课程 */
        case 6: /* 资源引用课程 */
        case 8: /* HTML5课程 */
            html += '<div class="thumbnail">';
            html += '<img src="' + data.middleIcon + '">';
            html += '<a class="view_btn" href="javascript:void(0);">';
            html += '<div><img src="images/learn_icon02.png"></div>';
            html += '</a>';
            html += '</div>';
            return html;
            break;
        case 7: /* 纯文本课程 */
            html += '<div class="thumbnail">';
            html += '<img src="' + data.middleIcon + '">';
            html += '</div>';
            return html;
            break;
        case 9: /* 音频课程 */
            html += '<div class="thumbnail">';
            html += '<img src="' + data.middleIcon + '">';
            //html += '<a class="view_btn" href="javascript:void(0);">';
            //html += '<div><img src="images/learn_icon01.png"></div>';
            //html += '</a>';
            html += '</div>';
            // html +='<audio src="' + data.resUrl +'"'+' '+ 'controls="controls" style="width:100% "></audio>';
            html += '<div class="audio-wrap" style="height: 32px;position: relative;"><audio id="' + data.courseId + 'audio" src="' + data.resUrl + '"' + ' ' + 'controls="controls" controlslist="nodownload" style="width:100%;position: absolute;top: 0;z-index: 59;"></audio></div>';
            return html;
            break;
    }
});

// 是否是HTML5课程
Handlebars.registerHelper('ifHTML5', function (conditional, options) {
    if (conditional == 8) {
        return options.fn(this);
    } else {
        return options.inverse(this);
    }
});
//处理题问题内容
Handlebars.registerHelper('questionTitle', function (examQuestionVo) {
    if (examQuestionVo.questionTypeId == 6) {
        var content = examQuestionVo.content;
        var newContent = content.replace(/\$spaces\$/g, '<input type="text" onkeydown="this.onkeyup();" onkeyup="this.size=(this.value.length>4?(this.value.length*2-4):4);" size="4"> ');
        // console.log(newContent);
        return newContent;
    } else {
        return examQuestionVo.content;
    }
});
// 是否有音频
Handlebars.registerHelper('ifHasAudio', function (quesType, options) {
    if (parseInt(quesType) == 5) {
        return options.inverse(this);
    } else {
        return options.fn(this);
    }
});

// 转换问题类型
Handlebars.registerHelper('transformQuestionType', function (id) {
    var html = '';

    switch (id) {
        case 1:
            html += '<span class="question-type question-type-color-1">【单选题】</span>';
            break;
        case 2:
            html += '<span class="question-type question-type-color-2">【多选题】</span>';
            break;
        case 3:
            html += '<span class="question-type question-type-color-3">【判断题】</span>';
            break;
        case 4:
            html += '<span class="question-type question-type-color-4">【简答题】</span>';
            break;
        case 5:
            html += '<span class="question-type question-type-color-5">【阅读理解题】</span>';
            break;
        case 6:
            html += '<span class="question-type question-type-color-6">【填空题】</span>';
            break;
    }

    return html;
});

//
Handlebars.registerHelper('questionContent', function (data) {
    //字母
    var lettersFunc = function (order) {
        var letters = [
            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
            'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
            'U', 'V', 'W', 'X', 'Y', 'Z'
        ];
        if (order >= 26) {
            result = letters[Math.floor(order / 26) - 1];
        }
        return letters[order] || result + "" + letters[order % 26];
    }

    var html = '';

    switch (data.questionTypeId) {
        case 1:
        case 2:
        case 3:
            html += '<ul class="options-list">';

            for (var i = 0; i < data.examQuestionOptionVos.length; i++) {
                html += '<li class="options-item">';
                html += '<a class="option" href="javascript:void(0);" optionId="' + data.examQuestionOptionVos[i].id + '">';
                if (data.examQuestionOptionVos[i].remark) {
                    html += '<span class="letter">' + lettersFunc(i) + '</span>' + (data.examQuestionOptionVos[i].content ? data.examQuestionOptionVos[i].content : '') + '<img class="option_img ' + (data.examQuestionOptionVos[i].content ? 'com' : '') + '" src="' + data.examQuestionOptionVos[i].remark + '"/>';
                } else {
                    html += '<span class="letter">' + lettersFunc(i) + '</span>' + data.examQuestionOptionVos[i].content;
                }
                html += '</li>';
                html += '</a>';
            }

            html += '</ul>';
            return html;
            break;
        case 4:
            html += '<div class="short-textarea">';
            // html += '<div class="short-desc">' + (data.description?  data.description:'') + '</div>';
            html += '<textarea placeholder="请输入你的观点..."></textarea>';
            html += '</div>';
            return html;
            break;
        case 5:

            return html;
            break;
        case 6:

            return html;
            break;
    }
});

var GC = {
    color: M.getCookie('themeColor'),
    gameInstId: null,
    questInstId: null,
    //当前已加载的页数
    loadedContentLs: 0,
    //每一页的对象数组
    ContentLs: [],
    //用于加载每一页面的参数(仅在加载页面时用到)
    roundMinContentLs: [],
    //roundMaxContentLs: [],
    //用于检查考试时题目未完成的位置
    scrollTop: 0,
    current: 0,
    total: 0,
    type: 0,
    //allScore: 0,
    currScore: 0,
    currCorrectNum: 0,
    score: [],
    totalScore: [],
    correctResult: [],
    refrence: [],
    answerList: [],
    //记录考试的位置
    answerIndex: [],
    isLastContent: false,
    isContentBag: false,
    stemArr: [],//组合题目Id
    STUDY_COURSE_TYPE: M.getCookie('STUDY_COURSE_EVALUATION_TYPE'),
    //
    ruleRate: parseInt(localStorage.getItem('courseReadRate'))*0.01 || 0.5, //音视频 比例(%)
    ruleTime: parseFloat(localStorage.getItem('courseReadTime')) || 15,//其余课程规定 时间(s)
    init: function () {
        if (M.isLogin()) {
            //
            if (M.ua().indexOf("chrome") > -1) {
                var temp = M.ua().match(/chrome\/([\d.]+)/)[1].split('.');
                console.log(temp[0]);
                if (temp[0] >= 55) {
                    $('<link>').attr({
                        rel: 'stylesheet',
                        href: 'styles/temp.css'
                    }).appendTo('head');
                }
            }
            if (GC.getUrlParams()) {
                var XCRTvalue = M.getCookie('XCRT') || '';
                if(XCRTvalue){
                    GC.startGame();
                    $('#page_1').css('position','relative').append('<div class="watermarkCss" style="background:url('+ M.createWatermark() +');min-height: calc(100vh - 82px);"></div>')
                }else{
                    var url = M.ctx + 'front/crt/t';
                    var data = {
                        userId: M.getCookie('userId'),
                        orgId: M.getCookie('orgId'),
                        ft: 'h5'
                    };

                    $.ajax({
                        type: 'GET',
                        url: url,
                        data: data,
                        beforeSend: function (xhr) {
                            xhr.setRequestHeader('X-Access-Token', M.getCookie('accessToken'));
                        },
                        error: function (xhr) {
                            if (xhr.status && xhr.status == '401') {
                                M.userExit();
                            }
                        },
                        success: function (data) {
                            console.log('获取课程token：');
                            console.log(data);
                            M.setCookie('XCRT',data.result);
                        },
                        complete: function(){
                            GC.startGame();
                        }
                    });
                }
            }
            GC.bindCloseViewCourse();
            $('.game-header span').text(sessionStorage.getItem('gameTitle'));

            //退出提示
            GC.stopGame();
            //GC.bindExitTip();
        } else {
            location.href = 'index.html';
        }
    },
    // 重置阅读规则计算(resTypeId 类型)
    timerInitFun: function (resTypeId) {//stop??意外事件
        // console.log()
        var resTypeId = $('#page_1 .item').eq(GC.current - 1).find('.cd-header h1').attr('resTypeId');
        var hasReaded = $('#page_1 .item').eq(GC.current - 1).find('.cd-header h1').attr('hasReaded');
        // console.log('resTypeId?' + resTypeId);
        var courseId = $('#page_1 .item').eq(GC.current - 1).find('.cd-header h1').attr('courseId');
        hasReaded ? CU.addRecordReaded(courseId):'';

        if (resTypeId) {
            var markReadedFun = function (resTypeId, time, obj) {//time 规则时间
                console.log('GC:timer?' + GC.timer);
                //15s
                if (time) {
                    // console.log(obj);
                    // console.log('b:'+ obj.currentTime)
                    if (GC.timer > time && obj.currentTime > time) {//audio[0].currentTime > time
                        if ($('#page_1 .item').eq(GC.current - 1).hasClass('course')) {
                            var courseId = $('#page_1 .item').eq(GC.current - 1).find('.cd-header h1').attr('courseId');
                            GC.markCourseReaded(courseId);
                        }
                    }
                } else {
                    if (GC.timer == GC.ruleTime) {
                        if ($('#page_1 .item').eq(GC.current - 1).hasClass('course')) {
                            var courseId = $('#page_1 .item').eq(GC.current - 1).find('.cd-header h1').attr('courseId');
                            GC.markCourseReaded(courseId);
                        }
                    }
                }
            }
            if (parseInt(resTypeId) == 7) {
                //图文
                if (!hasReaded) {
                    markReadedFun(resTypeId);
                }
            } else {
                switch (parseInt(resTypeId)) {
                    case 1://视频
                        if (GC.courseFlag && !hasReaded) {
                            var video = $('.item:eq(' + (GC.current - 1) + ')').find('#audio_video-view video');
                            var courseId = $('#page_1 .item').eq(GC.current - 1).find('.cd-header h1').attr('courseId');
                            var playerV = videojs('course-video'+ courseId);
                            var duration = playerV.duration();
                            if (video && video[0]) {
                                var timer = parseInt(duration) * GC.ruleRate;
                                console.log('Video:' + timer);
                                markReadedFun(resTypeId, timer, video[0]);
                            }
                        }
                        break
                    case 2://图片
                    case 3://PPT
                    case 4://PDF
                        if (resTypeId == 3 || resTypeId == 4) {
                            var flag = $('.pswp').attr('aria-hidden');
                            // console.log(flag);
                            if (flag == 'true') {//EXIT
                                //清空计时&条件
                                GC.courseFlag = false;
                                GC.timer = 0;
                                return
                            }
                        }
                        if (GC.courseFlag && !hasReaded) {
                            markReadedFun(resTypeId);
                        }
                        break
                    case 5://WORD
                    case 6://URL
                    case 8://HTML
                        if (GC.courseFlag && !hasReaded) {
                            markReadedFun(resTypeId);
                        }
                        break
                    case 9://音频
                        if (GC.courseFlag && !hasReaded) {
                            var audio = $('.item:eq(' + (GC.current - 1) + ')').find('.audio-wrap audio');
                            if (audio && audio[0]) {
                                var timer = parseInt(audio[0].duration) * GC.ruleRate;
                                console.log('Audio:' + timer);
                                markReadedFun(resTypeId, timer, audio[0]);
                            }
                        }
                        break
                    default:
                        break
                }
            }
        }

    },
    // 获取url参数
    getUrlParams: function () {
        var urlParamsStr = location.search.substr(1);

        if (urlParamsStr) {
            var urlParamsArr = urlParamsStr.split('&');
            var urlParamsObj = {};

            for (var i = 0; i < urlParamsArr.length; i++) {
                var index = urlParamsArr[i].indexOf('=');
                var key = urlParamsArr[i].substr(0, index);
                urlParamsObj[key] = urlParamsArr[i].substr(index + 1);
            }

            return urlParamsObj;
        } else {
            return null;
        }
    },
    // 音频播放(同一套题干的音频)
    audioPlay: function (obj) {
        var length = $(obj).parents('.subject-list').find('audio').length;
        console.log('length:' + length);
        for (var i = 0; i < length; i++) {
            var audio = $(obj).parents('.subject-list').find('audio');
            if (audio[i].src == $(obj).attr('src')) {
                continue
            }
            audio[i].pause();
        }
    },
    // 开始闯关
    startGame: function () {
        var url = M.ctx + 'front/game/startGame.action';
        var data = {
            gameId: GC.getUrlParams().gameId,
            questId: GC.getUrlParams().questId,
            userId: M.getCookie('userId')
        };

        //任务进入闯关
        if (sessionStorage.getItem('taskItem')) {
            data.taskFlag = 'Y';
            data.taskItemId = sessionStorage.getItem('taskItem');
        }

        $.ajax({
            type: 'POST',
            url: url,
            data: JSON.stringify(data),
            contentType: 'application/json',
            beforeSend: function (xhr) {
                xhr.setRequestHeader('X-Auth-Token', M.getCookie('authToken'));
            },
            error: function (xhr) {
                if (xhr.status && xhr.status == '401') {
                    M.userExit();
                }
            },
            success: function (data) {
                console.log('开始闯关：');
                console.log(data);
                if (!data.flag) {
                    M.alert(data.msg, function () {
                        //history.back(-1);
                        sessionStorage.setItem('NextQuestId', M.getUrlParams().questId);
                        location.replace('game.html?gameId=' + M.getUrlParams().gameId + '');
                    });
                    return
                }
                GC.handleStartGame(data);
            }
        });
    },

    // 处理开始闯关
    handleStartGame: function (data) {
        if (data.flag) {
            var result = data.result;
            var roundMinContentLs = result.roundMinContentLs;
            var length = roundMinContentLs.length;
            var color = GC.color;
            GC.gameInstId = result.gameInstId;
            GC.questInstId = result.questInstId;
            GC.roundMinContentLs = roundMinContentLs;
            GC.total = length;

            $('#loading_bg').show();
            //循环遍历加载每一页
            GC.getQuestContent(GC.roundMinContentLs[0].questContentId, GC.roundMinContentLs[0].contentType,
                GC.roundMinContentLs[0].contentId);

            console.log('出来循环了');
            //为第一页绑定对象current初始值
            GC.current = 1;
            $('.current').text(GC.current);
            $('.total').text(GC.total);

            GC.timer = 0;
            GC.courseFlag = false;
            var count = setInterval(function () {
                GC.timer++;
                GC.timerInitFun();
            }, 1000)

            //定义第一页的上下页按钮样式
            $('#next_btn').removeClass('btn-disabled').addClass('btn-default');
            $('.btn-default').css({"color": '#111', "background-color": "#fff", "border-color": "#ddd"});
            $('.fixed-footer').show();
            GC.bindPrev();
            GC.bindNext();
            $('#loading_bg').hide();

        }
    },

    // 获取闯关内容信息
    getQuestContent: function (questContentId, contentType, contentId) {
        var url = M.ctx + 'front/game/getQuestContentNew';
        var data = {
            questContentId: questContentId,
            contentType: contentType,
            contentId: contentId,
            userId: M.getCookie('userId'),
            orgId: M.getCookie('orgId'),
            questInstId: GC.questInstId,
            t: new Date().getTime()
        };

        $.ajax({
            type: 'GET',
            url: url,
            data: data,
            //data: JSON.stringify(data),
            //contentType: 'application/json',
            beforeSend: function (xhr) {
                xhr.setRequestHeader('X-Access-Token', M.getCookie('accessToken'));
                xhr.setRequestHeader('X-CRT', M.getCookie('XCRT')); //区分PC还是H5
            },
            error: function (xhr) {
                if (xhr.status && xhr.status == '401') {
                    M.userExit();
                }
                if (xhr.status && xhr.status == '801' ) {
                    CU.getCRT();
                }
            },
            success: function (data) {
                console.log('获取闯关内容信息：');
                console.log(data);
                if (data.flag) {
                    if (data.result.contentType == 2 || data.result.contentType == 3) {
                        GC.getScoreAndResult(data.result);
                    }
                    if (data.result.contentType != 5) {
                        GC.handleQuestContent(data);
                        if (GC.current == GC.total) {
                            $('#next_btn').text('完成检测').css({"color": '#111', "background-color": "#fff", "border-color": "#ddd"});
                        }
                    } else {
                        GC.isContentBag = true;
                        GC.handleQueContentBag(data);
                    }
                } else {
                    M.alert('已达到最大考试次数!', function () {
                        //history.back();
                        sessionStorage.setItem('NextQuestId', M.getUrlParams().questId);
                        location.replace('game.html?gameId=' + M.getUrlParams().gameId + '');
                    });
                }
            }
        });

        //$('.btn-disabled').css('color','#fff');
    },
    //得到分值和答案
    getScoreAndResult: function (result) {
        var exam = result.examPaperQuestionsVos;
        var anObj = {};
        var anLength = GC.answerList.length;
        anObj.examPaperQuestionsVo = exam;
        anObj.examName = result.questExamInfo.examName;
        GC.answerList[anLength] = anObj;
        GC.totalScore[anLength] = result.questExamInfo.totalScore;
        var scoreList = [];
        var correctResultList = [];
        var refrenceList = [];
        for (var i = 0; i < exam.length; i++) {
            var optionId = [];
            var opObj = {};
            var num = 0;
            scoreList[i] = exam[i].examQuestionVo.score;
            if (exam[i].examQuestionVo.refrence) {
                refrenceList[i] = exam[i].examQuestionVo.refrence;
                continue;
            }
            var examQuestionOptionVos = exam[i].examQuestionVo.examQuestionOptionVos;
            for (var j = 0; j < examQuestionOptionVos.length; j++) {
                if (examQuestionOptionVos[j].correct == 1) {
                    optionId[num] = examQuestionOptionVos[j].id;
                    num++;
                }
                opObj.optionId = optionId;
                correctResultList[i] = opObj;
            }
        }


        GC.score[anLength] = scoreList;
        GC.correctResult[anLength] = correctResultList;
        GC.refrence[anLength] = refrenceList;

        var anStr = JSON.stringify(GC.answerList);
        localStorage.setItem('answerAnalysisList', anStr);
    },
    // 处理获取内容包信息
    handleQueContentBag: function (data) {
        var result = data.result;
        var packageItemLs = result.packageItemLs;
        var length = packageItemLs.length;
        GC.total = length;
        $('.total').text(GC.total);

        for (var i = 0; i < length; i++) {
            var content = {};
            var roundMinContent = {};
            content.contentId = packageItemLs[i].objId;
            content.contentName = packageItemLs[i].objName;
            content.contentType = packageItemLs[i].objType;
            content.questContentInstId = result.questContentInstId;
            content.course = packageItemLs[i].course;
            content.examPaperQuestionsVos = packageItemLs[i].examPaperQuestionsVos;
            content.questExamInfo = packageItemLs[i].questExamInfo;

            //GC.roundMinContentLs[i].questContentId = content.contentId;
            roundMinContent.contentType = content.contentType;
            roundMinContent.contentId = content.contentId;
            GC.roundMinContentLs[i] = roundMinContent;

            data.result = content;
            console.log(data.result);
            if (data.result.contentType == 2 || data.result.contentType == 3) {
                GC.getScoreAndResult(data.result);

            }
            GC.handleQuestContent(data);
        }

    },
    // 处理获取闯内容信息
    handleQuestContent: function (data) {
        var result = data.result;
        if (!result.course) {
            GC.answerIndex [GC.answerIndex.length] = GC.loadedContentLs;
        }
        var color = GC.color;
        GC.ContentLs.push(result);
        //GCContentLs.push(result);
        //$('#quest_content_list').find('.item').hide();
        // 课程
        if (result.contentType == 1) {
            //
            var source = $('#templ_1').html();
            var template = Handlebars.compile(source);
            var html = template(result);

            $('#quest_content_list').append(html);
            // $('.column-tag-color-3').css({"color": color, "border-color": color});
            //水印
            // $('.' + result.course.courseId + '.cd-content').css('position', 'relative');
            // $('.' + result.course.courseId + '.cd-content').prepend('<div id="courseShelter" style="width:100%;height:100%;position: absolute;top: 0;left:0;right:0;bottom:0;margin:auto;z-index:55;opacity:0.35;background-image: url(\'' + CU.createWatermark() + '\')"></div>');

            // $('.view_btn').unbind('click');
            // $('.praise-btn').unbind('click');
            // $('.favorites-btn').unbind('click');
            console.log(result);
            // 评星
            if (GC.STUDY_COURSE_TYPE == 'M') {
                $('.star-wrap').show();
                $('.action-wrap a.praise-btn').parent().remove();//去掉点赞

                GC.bindMarkStarNum(result);
                if (result.course.avgStar) {
                    $('.' + result.course.courseId + '.zero-star').remove();
                    $('.' + result.course.courseId + '.star-num').show().find('span').text(parseFloat(result.course.avgStar).toFixed(1)).css('color', GC.color);
                }
                if (result.course.markStarNum) {
                    $('#' + result.course.courseId).raty({
                        path: 'scripts/jquery.raty/lib/img',
                        half: false,
                        starOff: 'course_icon_star_normal.png',
                        starOn: 'course_icon_star_press.png',
                        starHalf: 'star-half.png',
                        readOnly: true,
                        score: Math.round(result.course.markStarNum)
                    });
                    $('.' + result.course.courseId + '.star-btn').text('已评分').css({
                        'background': '#fff',
                        'color': '#999'
                    }).addClass('stopMark');
                } else {
                    $('#' + result.course.courseId).raty({
                        path: 'scripts/jquery.raty/lib/img',
                        half: false,
                        starOff: 'course_icon_star_normal.png',
                        starOn: 'course_icon_star_press.png',
                        starHalf: 'star-half.png',
                        click: function (score, evt) {
                            if (score > 0) {
                                $('.' + result.course.courseId + '.star-btn').css('background', GC.color);
                            }
                            console.log('score', score);
                        }
                    });
                }
                $('#' + result.course.courseId).find('img').css('background-color', GC.color);
            } else {
                $('.' + result.course.courseId + '.cd-content').next().css('padding-bottom', '24px');
                $('.' + result.course.courseId + '.cd-content').next().find('.action').css('width', '50%');
                $('.' + result.course.courseId + '.cd-content').next().find('.action-wrap .action').eq(0).show();
                $('.star-wrap').remove();
                GC.bindCoursePraise();
            }
            // 图片
            // if (result.course.resTypeId == 3 || result.course.resTypeId == 4) {
            //   var imgURLs = '';
            //   for (var k = 0; k < result.course.pages; k++) {
            //     var imgSrc = result.course.resUrl + '/' + (k + 1) + '.jpg';
            //     imgURLs += '<img style="display:none;" src="' + imgSrc + '"">';
            //   }
            //   var html = '<div class="img_temp">' + imgURLs + '</div>';
            //   $('.img_temp').hide();

            //   // console.log('GC:'+GC.loadedContentLs);
            //   $('#quest_content_list').find('.item').eq(GC.loadedContentLs).append(html);

            // }

            //记录心跳
            if (result.course.resTypeId == 9) {
                GC.bindAudioHeartBeat(result.course.courseId);
                var hasReaded = $('#page_1 .item').eq(GC.current - 1).find('.cd-header h1').attr('hasReaded');
                CU.bindDisableProgress(result.course.courseId+'audio', 1, null, hasReaded, GC, 3);
            }
            if (result.course.resTypeId == 1) {
                //视频限制播放
                var isPlay = result.course.showType;
                if (!isPlay) {
                    $('.item:eq(' + GC.loadedContentLs + ') .thumbnail .view_btn').hide();
                    // M.isPlayFun(result.course.showMsg);
                    var txt = result.course.showMsg;
                    var html1 = '<div class="play-dis" style="position:absolute;top:0;"><span style="position:relative;top:106px;">' + (txt && txt.length > 1 ? txt : '该视频仅允许在App中观看') + '</span></div>';
                    $('.item:eq(' + GC.loadedContentLs + ') .is-play').append(html1);
                }
            }
            GC.bindViewCourse();
            // GC.bindCoursePraise();
            GC.bindCourseFavorites();

        }

        //  考试/练习
        if (result.contentType == 2 || result.contentType == 3) {
            var source = $('#templ_2').html();
            var template = Handlebars.compile(source);
            var html = template(result);

            $('#quest_content_list').append(html);
            //
            for (var count = 0; count < result.examPaperQuestionsVos.length; count++) {
                var tempStem = result.examPaperQuestionsVos[count];
                var tempStr = GC.stemArr.join(",");
                if (tempStr.indexOf(tempStem.examQuestionVo.questionStemId) > -1) {
                    continue
                }
                tempStem.examQuestionVo.questionStemId > 0 ? GC.stemArr.push(tempStem.examQuestionVo.questionStemId) : '';
            }
            for (var i = 0; i < GC.stemArr.length; i++) {
                $('#quest_content_list').find('.questionStem.' + GC.stemArr[i]).eq(0).show();
            }
            $('#quest_content_list .subject-list .subject-item').each(function (index) {
                var tempItem = $('#quest_content_list .subject-list .subject-item').eq(index).find('.questionStem');
                parseInt(tempItem.attr('questionstemId')) > 0 ? tempItem.parent().css({
                    'margin': '0',
                    'border-top': 'none'
                }) : '';
            })

            $('.question input').css({"border-bottom": "1px solid #333", "max-width": "100%"});
            GC.bindSelect();
            //
            GC.bindViewPic();

        }
        //GC.current++;
        //$('.current').text(GC.current);
        //if(GC.current != 1){
        //  $('#prev_btn').removeClass('btn-disabled').addClass('btn-default');
        //  $('.btn-default').css({"color":color,"background-color":"#fff","border-color":"#ddd"});
        //}
        //
        //if(GC.current == GC.total){
        //  $('#next_btn').removeClass('btn-disabled').addClass('btn-blue').text('完成检测');
        //  $('.btn-blue').css({"color":"#fff","background-color":color,"border-color":color});
        //}else{
        //  $('#next_btn').removeClass('btn-disabled').addClass('btn-default');
        //  $('.btn-default').css({"color":color,"background-color":"#fff","border-color":"#ddd"});
        //}
        GC.loadedContentLs++;
        if (GC.loadedContentLs > 1) {
            $('.item').last().hide();
        }
        if (GC.loadedContentLs < GC.total && !GC.isContentBag) {
            GC.getQuestContent(GC.roundMinContentLs[GC.loadedContentLs].questContentId, GC.roundMinContentLs[GC.loadedContentLs].contentType,
                GC.roundMinContentLs[GC.loadedContentLs].contentId);
        }
        console.log('已加载页数:' + GC.loadedContentLs);

    },
    //评分
    bindMarkStarNum: function (result) {
        $('.' + result.course.courseId + '.star-btn').bind('click', function () {
            var starNum = $('#' + result.course.courseId).find('input').val();
            if (starNum < 1) {
                return
            }
            if ($(this).hasClass('stopMark')) {
                return
            }
            var data = {
                userId: M.getCookie('userId'),
                type: 1,
                objId: result.course.courseId,
                starNum: starNum
            };
            var url = M.ctx + 'front/studyCommon/markStar?' + $.param(data);

            $.ajax({
                type: 'POST',
                url: url,
                data: JSON.stringify(data),
                contentType: 'application/json',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader('X-Access-Token', M.getCookie('accessToken'));
                },
                error: function (xhr) {
                    if (xhr.status && xhr.status == '401') {
                        M.userExit();
                    }
                },
                success: function (data) {
                    console.log('课程评星：');
                    console.log(data);
                    result.course.avgStar ? '' : $('.' + result.course.courseId + '.zero-star').remove();
                    var avgNum = (result.course.starTotal + parseInt(starNum)) / (result.course.starUserTotal + 1);
                    $('.' + result.course.courseId + '.star-num').show().find('span').text(parseFloat(avgNum).toFixed(1)).css('color', GC.color);
                    $('#' + result.course.courseId).raty({
                        path: 'scripts/jquery.raty/lib/img',
                        half: false,
                        starOff: 'course_icon_star_normal.png',
                        starOn: 'course_icon_star_press.png',
                        starHalf: 'star-half.png',
                        readOnly: true,
                        score: Math.round(starNum),
                        hints: ['', '', '', '', '']
                    });
                    $('#' + result.course.courseId).find('img').css('background-color', GC.color);
                    $('.' + result.course.courseId + '.star-btn').text('已评分').css({
                        'background': '#fff',
                        'color': '#999',
                        'pointer-events': 'none'
                    });
                }, error: function (err) {
                    M.alert('评星失败~刷新试试');
                }
            });
        });
    },
    // 绑定查看课程
    bindViewCourse: function () {
        $(document).on('click','.item:eq(' + GC.loadedContentLs + ') .thumbnail .view_btn', function (e) {
            $('video').show();
            e.preventDefault();
            //var index = GC.current - 1;
            var index = $(this).parents('.item').index();

            if (GC.ContentLs[index].contentType == 1) {
                var course = GC.ContentLs[index].course;

                GC.type = course.resTypeId;
                // 视频课程
                if (course.resTypeId == 1) {
                    var isPlay = course.showType;
                    if (isPlay) {
                        var playerType = (course.segmentUrl && course.segmentUrl.length > 0 ?  1:0 );
                        playerType ? GC.viewVideoCourse(course.segmentUrl, playerType) : GC.viewVideoCourse(course.resUrl, playerType);

                        GC.courseFlag = true;
                        GC.timer = 0;

                    }
                    // else{
                    //     $('.thumbnail:eq(' + GC.loadedContentLs + ') #view_btn').hide();
                    //     M.isPlayFun(course.showMsg);
                    //   }

                }

                // 图片课程
                if (course.resTypeId == 2) {
                    // GC.viewPhotoCourse(course.resUrl);
                    GC.viewPDForPPTorWORDCourse(course.resUrl, 1, 1);
                    GC.courseFlag = true;
                    GC.timer = 0;
                    // GC.timerInitFun(course.resTypeId, false);
                }

                // PDF课程/PPT课程/WORD课程
                if (course.resTypeId == 3 || course.resTypeId == 4) {
                    GC.viewPDForPPTorWORDCourse(course.resUrl, course.pages);
                    // GC.timerInitFun(course.resTypeId, false);
                    GC.courseFlag = true;
                    GC.timer = 0;
                }
                // WORD课程
                if (course.resTypeId == 5) {
                    GC.viewWordCourse(course.resUrl, course.resName);
                    // GC.timerInitFun(course.resTypeId, false);
                    GC.courseFlag = true;
                    GC.timer = 0;
                }
                // 外部资源课程
                if (course.resTypeId == 6) {
                    GC.viewResCourse(course.resUrl);
                    GC.courseFlag = true;
                    GC.timer = 0;
                    // GC.timerInitFun(course.resTypeId, false);
                }

                // 纯文本课程

                // HTML5课程
                if (course.resTypeId == 8) {
                    GC.viewHTML5Course(course.contents);
                    GC.courseFlag = true;
                    GC.timer = 0;
                    // GC.timerInitFun(course.resTypeId, false);
                }

                // 音频课程
                if (course.resTypeId == 9) {
                    //GC.viewAudioCourse(course.resUrl);
                    //GC.bindCloseViewCourse();
                    // 利用心跳时（监听）
                }
            }
        });
    },

    // 查看视频课程
    viewVideoCourse: function (resUrl, playerType) {
        console.log('视频课程');
        console.log(resUrl);
        //var wHeight = $(window).height();
        //var html = '<video src="' + resUrl + '" controls width="100%"></video>';
        if ($('#page_2').hasClass('iframe')) {
            $('#page_2 iframe').remove();
            $('#page_2').removeClass('iframe');
        }
        var courseId = parseInt($('.item:eq(' + (GC.current - 1) + ')').find('.cd-header h1').attr('courseId'));
        // var html = '<video src="' + resUrl + '"' + ' ' + 'controlslist="nodownload" controls="controls" autoplay style="width:100%;height:100%"></video>';
        var html = '<video id="course-video'+ courseId +'"  style="position:relative;width:100%;height:100%;" poster="" class="video-js vjs-default-skin vjs-big-play-centered" controls></video>';

        console.log(html);
        $('.item:eq(' + (GC.current - 1) + ')').find('#audio_video-view').empty().css({
            'z-index': '60',
            'background': '#eee'
        }).append(html);
        //$('#page_1').hide();
        $('.back-wrap').hide();
        $('#page_2').show().find('.shelter').hide();

        if(playerType){
            var player = videojs('course-video'+ courseId, {} , function onPlayerReady() {
                this.src({
                    src: resUrl,
                    type: 'application/x-mpegURL',
                });
            });
        }else{
            var player = videojs('course-video'+ courseId, {}, function onPlayerReady() {
                this.src({
                    src: resUrl,
                    type: 'video/mp4',
                });
            });
        }
        var hasReaded = $('#page_1 .item').eq(GC.current - 1).find('.cd-header h1').attr('hasReaded');
        CU.bindDisableProgress('course-video'+ courseId, 0, player, hasReaded, GC, 3);
        GC.bindVideoHeartBeat($(this));
        //$('#page_2').find('#view_wrap').empty().parent().css({
        //  'min-height': wHeight,
        //  'background': '#000'
        //}).show().find('#view_wrap').append(html);
    },

    // 查看图片课程
    viewPhotoCourse: function (resUrl) {
        console.log('图片课程');
        console.log(resUrl);
        var wHeight = $(window).height();
        var html = '<img src="' + resUrl + '" width="100%">';

        $('#page_1').hide();
        $('.back-wrap').hide();

        if ($('#page_2').hasClass('iframe')) {
            $('#page_2 iframe').remove();
            $('#page_2').removeClass('iframe');
        }
        $('#page_2').find('#view_wrap').empty().parent().css({
            'min-height': wHeight,
        }).show().find('#view_wrap').append(html);
        $('#page_2').find('.shelter').hide();
        //
        $('#view_wrap').css('position', 'relative');
        $('#view_wrap').prepend('<div class="courseShelter" style="width:100%;height:100%;position: absolute;top: 0;left:0;right:0;bottom:0;margin:auto;z-index:55;opacity: 0.35;background-image: url(\'' + CU.createWatermark() + '\')"></div>');
    },

    // 查看PDF课程/PPT课程/WORD课程
    viewPDForPPTorWORDCourse: function (resUrl, pages, type) {
        console.log('PDF/PPT/WORD课程：');
        console.log(resUrl);
        console.log(pages);
        CU.bindPhotoSwipeUtil(resUrl, pages, type);

        //水印
        if (!$('.pswp__scroll-wrap div:first-child').hasClass('courseShelter')) {
            $('.pswp__scroll-wrap').prepend('<div id="courseShelter" class="courseShelter" style="width:100%;max-width:1200px;height:100%;position: absolute;top: 0;left:0;right:0;bottom:0;margin:auto;z-index:55;opacity: 0.35;background-image: url(\'' + CU.createWatermark() + '\')"></div>');
        }
        //
        console.log('pptORpdf HeartBeat')
        var initUrl = window.location.href;
        console.log(initUrl)
        var currentUrl;
        var time = 0;
        var initIndex = GC.current - 1;
        var tempPlay = setInterval(function () {
            var flag = $('.pswp').attr('aria-hidden');
            console.log(flag);
            if (flag == 'true') {//EXIT
                console.log('exit')
                GC.bindHeartBeat();
                clearInterval(tempPlay);
            }
            //
            var tempIndex = parseInt($('.fixed-footer').find('span.current').text()) - 1;
            if (!(initIndex == tempIndex)) {
                clearInterval(tempPlay);
            }
            time += 1000;
            currentUrl = window.location.href;
            if (initUrl == currentUrl) {
                console.log('wait')
            } else {
                console.log('-' + time);
                initUrl = currentUrl;
                if (time >= 900000) {//900000
                    console.log('JD')
                    GC.bindHeartBeat();
                }
                time = 0;
            }
        }, 1000)
    },
    // word课程
    viewWordCourse: function (resUrl, resName) {
        var url = resUrl + '/' + resName + '.html';

        $('#page_1').hide();
        $('.back-wrap').hide();
        GC.historyLength = window.history.length;
        console.log(window.history.length);
        if ($('#page_2').hasClass('iframe')) {
            $('#page_2 iframe').remove();
            $('#page_2').removeClass('iframe');
        }
        var iframe = '<iframe id="resIframe" style="width: 100%;height: 100vh;overflow: auto" frameborder="0px"></iframe>';
        $('#page_2').append(iframe).addClass('iframe');
        //

        $('iframe').attr('src', url);
        $('.shelter').css("opacity", "0.35");
        $('.shelter').css('background-image', 'url(\'' + CU.createWatermark() + '\')');
        // $('body').attr('style','max-width:none;');
        $('#page_2').css({
            'background': '#fff',
            "overflow": "auto",
            "-webkit-overflow-scrolling": "touch"
        }).show().find('.shelter').show();
    },
    // 资源引用课程
    viewResCourse: function (resUrl) {
        console.log('资源引用课程');
        console.log(resUrl);
        // window.open(resUrl);
        $('#page_1').hide();
        $('.back-wrap').hide();
        //window.open(resUrl)
        GC.historyLength = window.history.length;
        console.log(window.history.length);
        if ($('#page_2').hasClass('iframe')) {
            $('#page_2 iframe').remove();
            $('#page_2').removeClass('iframe');
        }
        var iframe = '<iframe id="resIframe" style="width: 100%;height: 100vh;overflow: auto" frameborder="0px"></iframe>';
        $('#page_2').append(iframe).addClass('iframe');
        // $('iframe').attr('src', resUrl);
        if (resUrl.indexOf('mp.weixin.qq.com') > -1) {
            var ua = window.navigator.userAgent.toLowerCase();
            if (ua.match(/MicroMessenger/i) != 'micromessenger') {
                $.ajaxPrefilter(function (options) {
                    options.url = resUrl;
                    if (options.url == resUrl) {
                        if (options.crossDomain && $.support.cors) {
                            var http = (window.location.protocol === 'http:' ? 'http:' : 'https:');
                            options.url = http + '//cors-anywhere.herokuapp.com/' + options.url;
                        }
                    }
                });
                $.get(resUrl, function (res) {
                    var html = res;
                    html = html.replace(/data-src/g, 'src');
                    var html_src = 'data:text/html;charset=utf-8,' + html;
                    $('iframe').attr('src', html_src);
                });
            } else {
                setTimeout(function () {
                    window.location.href = resUrl;
                }, 500);
                return
            }
        } else {
            $('iframe').attr('src', resUrl);
        }
        //跨域

        $('#page_2').show().find('.shelter').show();
    },

    // 纯文本课程不需要

    // 查看HTML5课程
    viewHTML5Course: function (contents) {
        console.log('HTML5课程');
        console.log(contents);
        $('#page_1').hide();
        $('.back-wrap').hide();
        if ($('#page_2').hasClass('iframe')) {
            $('#page_2 iframe').remove();
            $('#page_2').removeClass('iframe');
        }
        $('#page_2').find('#view_wrap').empty().append(contents).parent().css({
            'padding': '12px',
            'background': '#fff',
        }).show();
        $('#page_2').find('.shelter').hide();
        //
        $('#view_wrap').css('position', 'relative');
        $('#view_wrap').prepend('<div class="courseShelter" style="width:100%;height:100%;position: absolute;top: 0;left:0;right:0;bottom:0;margin:auto;z-index:55;opacity:0.35;pointer-events:none;background-image: url(\'' + CU.createWatermark() + '\')"></div>');
    },

    // 查看音频课程
    //viewAudioCourse: function (resUrl) {
    //  console.log('音频课程');
    //  console.log(resUrl);
    //  var wHeight = $(window).height();
    //  var html = '<audio src="' + resUrl + '" controls width="100%"></audio>';
    //
    //  $('#page_1').hide();
    //  $('.back-wrap').hide();
    //  $('#page_2').find('#view_wrap').empty().parent().css({
    //    'min-height': wHeight,
    //    'background': '#000'
    //  }).show().find('#view_wrap').append(html);
    //},

    // 绑定关闭查看课程
    bindCloseViewCourse: function () {
        $('#close_btn').bind('click', function () {
            //
            var courseId = $('.item:eq(' + (GC.current - 1) + ')').find('.cd-header h1').attr('courseId');
            if($('#course-video'+ courseId).children().length > 0){
                var player = videojs('course-video'+ courseId);
                player.dispose();
            }
            //清空计时&条件
            GC.courseFlag = false;
            GC.timer = 0;

            $('video').hide();
            if (GC.type == 1 || GC.type == 9) {
                $('#page_2').hide();
                // $('.item:eq('+(GC.current-1)+')').find('#view_btn>div').css('visibility','visible').parent().prev().css('visibility','hidden');
                $('.item:eq(' + (GC.current - 1) + ') #audio_video-view').css({
                    'z-index': '-100',
                    'background': '#eee'
                });
                // GC.type==1? $('.item:eq('+(GC.current-1)+') #audio_video-view video')[0].pause() : $('.item:eq('+(GC.current-1)+') #audio_video-view audio')[0].pause();
            }
            $('#page_2').hide().find('#view_wrap').empty();
            $('#page_1').show();
            $('.back-wrap').show();
        });
    },

    // 绑定课程点赞
    bindCoursePraise: function () {
        // $('.praise-btn')
        $('.praise-btn:eq(' + (GC.loadedContentLs) + ')').bind('click', function () {
            var courseId = $(this).attr('courseId');
            var hasAppraised = $(this).attr('hasAppraised');

            if (hasAppraised == 'true') {
                M.alert('已点赞过');
                return;
            }

            GC.userAppraise(courseId, $(this));
        });
    },

    // 用户点赞
    userAppraise: function (courseId, jqObj) {
        var url = M.ctx + 'front/basicCourse/ userAppraise.action';
        var data = {
            objType: 1,
            objId: courseId,
            orgId: M.getCookie('orgId'),
            userId: M.getCookie('userId')
        };

        $.ajax({
            type: 'POST',
            url: url,
            data: JSON.stringify(data),
            contentType: 'application/json',
            beforeSend: function (xhr) {
                xhr.setRequestHeader('X-Auth-Token', M.getCookie('authToken'));
            },
            success: function (data) {
                console.log('课程点赞：');
                console.log(data);
                if (data.flag) {
                    M.alert('点赞成功', function () {
                        jqObj.attr('hasappraised', true);
                        jqObj.find('span').parent().html('已赞·' + data.result);
                        ;
                        jqObj.find('img').attr('src', 'images/praise_icon04.png').css('background-color', GC.color);
                    });
                }
            }
        });
    },

    // 绑定课程收藏
    bindCourseFavorites: function () {
        // $('.favorites-btn')
        $('.favorites-btn:eq(' + (GC.loadedContentLs) + ')').bind('click', function () {
            var courseId = $(this).attr('courseId');
            var hasfavrited = $(this).attr('hasfavrited');

            if (hasfavrited == 'true') {
                GC.cancelCourseCollect(courseId, $(this));
            } else {
                GC.courseCollect(courseId, $(this));
            }
        });
    },

    // 收藏课程
    courseCollect: function (courseId, jqObj) {
        var data = {
            orgId: M.getCookie('orgId'),
            userId: M.getCookie('userId')
        };
        var url = M.ctx + 'front/basicCourse/' + courseId + '/courseCollect.action?' + $.param(data);

        $.ajax({
            type: 'POST',
            url: url,
            beforeSend: function (xhr) {
                xhr.setRequestHeader('X-Auth-Token', M.getCookie('authToken'));
            },
            success: function (data) {
                console.log('收藏成功：');
                console.log(data);
                if (data.flag) {
                    M.alert('收藏成功', function () {
                        jqObj.attr('hasfavrited', true);
                        jqObj.find('img').attr('src', 'images/favorites_icon04.png').css('background-color', GC.color);
                        jqObj.find('p').text('已收藏');
                    });
                }
            }
        });
    },

    // 取消收藏课程
    cancelCourseCollect: function (courseId, jqObj) {
        var data = {
            orgId: M.getCookie('orgId'),
            userId: M.getCookie('userId')
        };
        var url = M.ctx + 'front/basicCourse/' + courseId + '/cancelCourseCollect.action?' + $.param(data);

        $.ajax({
            type: 'POST',
            url: url,
            beforeSend: function (xhr) {
                xhr.setRequestHeader('X-Auth-Token', M.getCookie('authToken'));
            },
            success: function (data) {
                console.log('取消收藏：');
                console.log(data);
                if (data.flag) {
                    M.alert('取消收藏', function () {
                        jqObj.attr('hasfavrited', false);
                        jqObj.find('img').attr('src', 'images/favorites_icon03.png').css('background-color', '#fff');
                        jqObj.find('p').text('收藏');
                    });
                }
            }
        });
    },

    // 绑定单选题/多选题/判断题选择
    bindSelect: function () {
        console.log('绑定');
        $('.item:eq(' + GC.loadedContentLs + ') .option').bind('click', function (event) {
            var questionTypeId = parseInt($(this).closest('.subject-item').find('.question').attr('questionTypeId'));

            // 单选题/判断题
            if (questionTypeId == 1 || questionTypeId == 3) {
                if ($(this).hasClass('selected')) {
                    $(this).removeClass('selected');
                } else {
                    $(this).parent().siblings().find('a').removeClass('selected');
                    $(this).addClass('selected');
                }
            }

            // 多选题
            if (questionTypeId == 2) {
                if ($(this).hasClass('selected')) {
                    $(this).removeClass('selected');
                } else {
                    $(this).addClass('selected');
                }
            }
        });
    },

    // 保存考试进度
    saveExamProcess: function () {
        var questContentInstId = $('#quest_content_list .item').eq(GC.current - 1).attr('questContentInstId');
        var examResultId = $('#quest_content_list .item').eq(GC.current - 1).find('.subject-list .subject-item').eq(0).attr('examResultId');
        var url = M.ctx + 'front/game/saveQuestResult?userId=' + M.getCookie('userId') + '&orgId=' + M.getCookie('orgId');
        //修改currScore（分数）、currCorrectNum（正确个数）属性，此处为复查
        var data = {
            examResultId: parseInt(examResultId),
            questId: parseInt(GC.getUrlParams().questId),
            questContentInstId: parseInt(questContentInstId),
            currScore: 100,
            currCorrectNum: 10
            //userId: parseInt(M.getCookie('userId')),
            //orgId: M.getCookie('orgId')
        };

        $.ajax({
            type: 'POST',
            url: url,
            data: JSON.stringify(data),
            contentType: 'application/json',
            beforeSend: function (xhr) {
                xhr.setRequestHeader('X-Auth-Token', M.getCookie('authToken'));
            },
            success: function (data) {
                console.log('保存考试进度：');
                console.log(data);
                GC.handleSaveExamProcess(data);
            }
        });
    },

    //批量提交考试
    submitExamWithQuestions: function () {
        var examResultId = $('#quest_content_list .item').eq(GC.current - 1).find('.subject-list .subject-item').eq(0).attr('examResultId');
        var items = $('#quest_content_list .item').eq(GC.current - 1).find('.subject-list .subject-item');
        var length = items.length;

        var examQuestionParams = [];
        var getProbIds = GC.getProbIds();
        var getProbResults = GC.getProbResults();
        var getUserOptions = GC.getUserOptions();
        var getUserResults = GC.getUserResults();
        //var questionType = [];
        for (var i = 0; i < length; i++) {
            var obj = {};
            var questionTypeId = parseInt(items.eq(i).find('.question').attr('questionTypeId'));
            //questionType[i] = questionTypeId;
            obj.examResultId = examResultId;
            obj.usedTime = 8;
            obj.groupId = 0;
            obj.probId = getProbIds[i];
            obj.probResult = getProbResults[i];
            //获取正确答案填充至json对象
            obj.optionIds = GC.correctResult[0][i].optionId;
            obj.optionResults = GC.correctResult[0][i].optionId.map(String);
            obj.questionTypeId = questionTypeId;
            examQuestionParams[i] = obj;
        }

        GC.getAllScore(getUserOptions, getProbResults);
        var url = M.ctx + 'front/exam/submitExamWithQuestions?examResultId=' + examResultId + '&examActivityId=' + GC.roundMinContentLs[GC.current - 1].contentId + '&operType=1';
        var data = {
            //examResultId: examResultId,
            //operType: 1,
            examQuestionParams: examQuestionParams
        };
        $.ajax({
            type: 'POST',
            url: url,
            data: JSON.stringify(data),
            contentType: 'application/json',
            beforeSend: function (xhr) {
                xhr.setRequestHeader('X-Auth-Token', M.getCookie('authToken'));
            },
            success: function (data) {
                console.log('保存考试进度：');
                console.log(data);
                if (data.flag) {
                    GC.saveExamProcess();
                } else {
                    M.alert('保存失败');
                }
            }
        });
    },
    //获取答题取得的成绩,correctList数组答案类型，0错误，1正确，2主观题
    getAllScore: function (getUserOptions, getProbResults) {
        GC.currScore = 0;
        GC.currCorrectNum = 0;
        var answerIndex = GC.answerIndex.indexOf(GC.current - 1);
        var answerAnalysisList = GC.answerList;
        //var answerIndex = answerAnalysisList.length - 1;
        var answerList = answerAnalysisList[answerIndex];
        var scoreList = GC.score[answerIndex];
        var correctResultList = GC.correctResult[answerIndex];
        var refrenceList = GC.refrence[answerIndex];
        var allScore = 0;
        for (var k = 0; k < getUserOptions.length; k++) {

            allScore += scoreList[k];
            answerList.examPaperQuestionsVo[k].examQuestionVo.userScore = 0;
            if (getProbResults[k]) {
                answerList.examPaperQuestionsVo[k].examQuestionVo.result = getProbResults[k];
                //填空
                var ans = [];
                var correct = [];
                var currScore = 0;
                ans = getProbResults[k].split('@sc$ho@');
                correct = correct.concat(refrenceList[k].split('@sc$ho@'));
                var singleScore = Math.floor(scoreList[k] / correct.length);
                var correctArrFun = function(tempArr, ans){
                    var correctArr = [];
                    var bo = false ;
                    if(tempArr.indexOf('$or$') > -1 ){
                        correctArr = tempArr.split('$or$');
                        for(var co = 0 ; co < correctArr.length; co++){
                            if(correctArr[co] == ans){
                                bo = true;
                                break
                            }
                        }
                        return bo
                    }
                }
                if (answerList.examPaperQuestionsVo[k].examQuestionVo.inOrder == 2) {
                    for (var j = 0; j < correct.length; j++) {
                        if (ans[j] == correct[j] || correctArrFun(correct[j], ans[j])) {
                            currScore += parseFloat(singleScore);
                        }
                    }
                } else {
                    var checkedIndex = [];//
                    for (var cI = 0; cI < correct.length ; cI++){
                        checkedIndex[cI] = false;
                    }
                    for (var x = 0; x < ans.length; x++) {
                        for (var y = 0; y < correct.length; y++) {
                            if( !checkedIndex[y] && (correct[y] == ans[x] || correctArrFun(correct[y], ans[x]))){
                                currScore += parseFloat(singleScore);
                                checkedIndex[y] = true;
                                break
                            }
                        }
                    }
                }
                currScore = (currScore >= parseInt(correct.length) * parseFloat(singleScore)? scoreList[k]:currScore);//填空若全对，则分数为满分(把余数补回)
                //
                GC.currScore += currScore;
                currScore == scoreList[k] ? GC.currCorrectNum++ : '';
                answerList.examPaperQuestionsVo[k].examQuestionVo.userScore = currScore;
                // if (getProbResults[k] == refrenceList[k]) {
                //   GC.currScore += scoreList[k];
                //   GC.currCorrectNum ++;
                //   answerList.examPaperQuestionsVo[k].examQuestionVo.userScore = scoreList[k];
                // }
                continue;
            }
            var optionNum = 0;
            if (correctResultList[k] && correctResultList[k].optionId.length == getUserOptions[k].optionIds.length) {
                for (var l = 0; l < correctResultList[k].optionId.length; l++) {
                    if (getUserOptions[k].optionIds[l] == correctResultList[k].optionId[l]) {
                        optionNum++;
                    }
                }
                if (optionNum == correctResultList[k].optionId.length) {
                    GC.currScore += scoreList[k];
                    GC.currCorrectNum++;
                    answerList.examPaperQuestionsVo[k].examQuestionVo.userScore = scoreList[k];
                    //记录用户的选择
                    for (var t = 0; t < answerList.examPaperQuestionsVo[k].examQuestionVo.examQuestionOptionVos.length; t++) {
                        if (answerList.examPaperQuestionsVo[k].examQuestionVo.examQuestionOptionVos[t].correct) {
                            answerList.examPaperQuestionsVo[k].examQuestionVo.examQuestionOptionVos[t].result = answerList.examPaperQuestionsVo[k].examQuestionVo.examQuestionOptionVos[t].id + "";
                        }
                    }
                }

            }
            var examQuestionOptionVos = answerList.examPaperQuestionsVo[k].examQuestionVo.examQuestionOptionVos;
            var m = 0;
            for (var i = 0; i < getUserOptions[k].optionIds.length; i++) {
                for (var j = 0; j < examQuestionOptionVos.length; j++) {
                    if (j <= m) {
                        j = m + 1;
                    }
                    if (getUserOptions[k].optionIds[i] == examQuestionOptionVos[j].id) {
                        examQuestionOptionVos[j].result = examQuestionOptionVos[j].id;
                        m = j;
                        break;
                    }
                }
            }
            answerList.examPaperQuestionsVo[k].examQuestionVo.examQuestionOptionVos = examQuestionOptionVos;
        }
        if (GC.currScore) {
            GC.currScore = Math.floor(GC.currScore / allScore * GC.totalScore[answerIndex]);
        }
        answerAnalysisList[answerIndex] = answerList;
        var resultStr = JSON.stringify(answerAnalysisList);
        localStorage.setItem('answerAnalysisList', resultStr);
    },
    //获取probIds
    getProbIds: function () {
        var probIds = [];
        var items = $('#quest_content_list .item').eq(GC.current - 1).find('.subject-list .subject-item');
        var length = items.length;

        for (var i = 0; i < length; i++) {
            probIds[i] = parseInt(items.eq(i).attr('probId'));
        }

        return probIds;
    },

    //获取probResults
    getProbResults: function () {
        var probResults = [];
        var items = $('#quest_content_list .item').eq(GC.current - 1).find('.subject-list .subject-item');
        var length = items.length;

        for (var i = 0; i < length; i++) {
            var questionTypeId = parseInt(items.eq(i).find('.question').attr('questionTypeId'));

            switch (questionTypeId) {
                case 1:
                case 2:
                case 3:
                    probResults[i] = '';
                    break;
                case 4:
                    probResults[i] = items.eq(i).find('textarea').val();
                    break;
                case 5:
                    break;
                case 6:
                    var inLength = items.eq(i).find('input').length;
                    var value = '';
                    for (var j = 0; j < inLength; j++) {
                        if (j != 0) {
                            value += '@sc$ho@';
                        }
                        value += items.eq(i).find('input').eq(j).val();
                    }
                    probResults[i] = value;
                    break;
            }
        }

        return probResults;
    },

    // 获取userOptions
    getUserOptions: function () {
        var userOptions = [];
        var items = $('#quest_content_list .item').eq(GC.current - 1).find('.subject-list .subject-item');
        var length = items.length;

        for (var i = 0; i < length; i++) {
            var obj = {};
            var optionIds = [];
            var selecteds = items.eq(i).find('.options-list .selected');

            for (var j = 0; j < selecteds.length; j++) {

                optionIds[j] = parseInt(selecteds.eq(j).attr('optionId'));
            }

            obj.optionIds = optionIds;
            userOptions[i] = obj;
        }

        return userOptions;


    },

    //获取userResults
    getUserResults: function () {
        var userResults = [];
        var items = $('#quest_content_list .item').eq(GC.current - 1).find('.subject-list .subject-item');
        var length = items.length;

        for (var i = 0; i < length; i++) {
            var questionTypeId = parseInt(items.eq(i).find('.question').attr('questionTypeId'));
            var obj = {};
            var optionResults = [];

            switch (questionTypeId) {
                case 1:
                case 2:
                case 3:
                    var selecteds = items.eq(i).find('.options-list .selected');

                    for (var j = 0; j < selecteds.length; j++) {
                        optionResults[j] = selecteds.eq(j).attr('optionId');
                    }

                    obj.optionResults = optionResults;
                    break;
                case 4:
                    obj.optionResults = optionResults;
                    break;
                case 5:
                    break;
                case 6:
                    obj.optionResults = optionResults;
                    break;
            }

            userResults[i] = obj;
        }

        return userResults;
    },

    // 处理保存考试进度
    handleSaveExamProcess: function (data) {
        if (data.flag) {
            M.alert('保存成功', function () {
                if (GC.isLastContent) {
                    var gameId = GC.getUrlParams().gameId;
                    var questId = GC.getUrlParams().questId;
                    var gameInstId = GC.gameInstId;
                    var questInstId = GC.questInstId;

                    var url = 'game-result.html?gameId=' + gameId + '&questId=' + questId + '&gameInstId=' + gameInstId +
                        '&questInstId=' + questInstId;
                    window.location.replace(url);
                } else {
                    $('#quest_content_list .item').hide();
                    $('#quest_content_list .item').eq(GC.current).show();
                    var color = GC.color;
                    if ($('#prev_btn').hasClass('btn-disabled')) {
                        $('#prev_btn').removeClass('btn-disabled').addClass('btn-default');
                        $('.btn-default').css({"color": '#111', "background-color": "#fff", "border-color": "#ddd"});
                    }
                    if (GC.current == GC.total - 1) {
                        $('#next_btn').removeClass('btn-disabled').addClass('btn-blue').text('完成检测');
                        $('.btn-blue').css({"color": "#111", "background-color": '#fff', "border-color": '#ddd'});
                    }
                    GC.current++;
                    $('.current').text(GC.current);
                }
            });
        } else {
            M.alert('保存失败');
        }
    },

    // 绑定上一页
    bindPrev: function () {
        $('#prev_btn').bind('click', function (e) {
            var color = GC.color;
            e.preventDefault();
            if (GC.current == 1) {
                return;
            } else {
                // ($('.item:eq(' + (GC.current - 1) + ') #audio_video-view').children()[0]) && $('.item:eq(' + (GC.current - 1) + ') #audio_video-view').children(':eq(0)')[0].pause();
                $('.thumbnail:eq(' + (GC.current - 1) + ')').next('audio')[0] && $('.thumbnail:eq(' + (GC.current - 1) + ')').next('audio')[0].pause();
                //暂停音频（课程）
                ($('.item:eq(' + (GC.current - 1) + ') .audio-wrap').children()[0]) && $('.item:eq(' + (GC.current - 1) + ') .audio-wrap').children(':eq(0)')[0].pause();

                $('#close_btn').trigger('click');
                // 题干的音频
                $('#quest_content_list').find('.item').eq(GC.current - 1).find('audio').each(function (index) {
                    $('#quest_content_list').find('.item').eq(GC.current - 1).find('audio')[index].pause();
                });
                GC.current--;
                $('#quest_content_list').find('.item').eq(GC.current - 1).show().siblings().hide();
                //if(GC.roundMinContentLs[GC.current - 1].contentType == 2 || GC.roundMinContentLs[GC.current - 1].contentType == 3){
                //  GC.bindSelect();
                //}

                if (GC.current != 1) {
                    $(this).removeClass('btn-disabled').addClass('btn-default');
                    $('.btn-default').css({"color": color, "background-color": "#fff", "border-color": "#ddd"});
                } else {
                    $(this).removeClass('btn-default').addClass('btn-disabled');
                    $('.btn-disabled').css({"background-color": "#e5e5e5", "border-color": "#e5e5e5", "color": "#fff"});
                }

                $('.current').text(GC.current);

                //清空计时&条件
                GC.timer = 0;
                GC.courseFlag = false;

                if (GC.current <= (GC.total - 1)) {
                    $('#next_btn').removeClass('btn-blue').addClass('btn-default').text('下一页');
                    $('.btn-default').css({"color": '#111', "background-color": "#fff", "border-color": "#ddd"});
                }
            }
        });
    },

    // 绑定下一页/完成检测
    bindNext: function () {
        $('#next_btn').bind('click', function (e) {
            e.preventDefault();

            if ($(this).hasClass('btn-disabled')) {
                return;
            } else {
                // 下一页
                // 题干的音频
                $('#quest_content_list').find('.item').eq(GC.current - 1).find('audio').each(function (index) {
                    $('#quest_content_list').find('.item').eq(GC.current - 1).find('audio')[index].pause();
                });
                if (GC.current < GC.total) {
                    //课程
                    // console.log(GC.roundMinContentLs[GC.current - 1].contentType);
                    if (GC.roundMinContentLs[GC.current - 1].contentType == 1) {
                        var color = GC.color;
                        if (GC.current == GC.total - 1) {
                            $('#next_btn').removeClass('btn-disabled').addClass('btn-blue').text('完成检测');
                            $('.btn-blue').css({"color": "#111", "background-color": "#fff", "border-color": "#ddd"});
                        }
                        // ($('.item:eq(' + (GC.current - 1) + ') #audio_video-view').children()[0]) && $('.item:eq(' + (GC.current - 1) + ') #audio_video-view').children(':eq(0)')[0].pause();
                        $('.thumbnail:eq(' + (GC.current - 1) + ')').next('audio')[0] && $('.thumbnail:eq(' + (GC.current - 1) + ')').next('audio')[0].pause();
                        //暂停音频
                        ($('.item:eq(' + (GC.current - 1) + ') .audio-wrap').children()[0]) && $('.item:eq(' + (GC.current - 1) + ') .audio-wrap').children(':eq(0)')[0].pause();
                        $('#close_btn').trigger('click');

                        //改动过
                        $('#quest_content_list .item').hide();
                        $('#quest_content_list .item').eq(GC.current).show();
                        if ($('#prev_btn').hasClass('btn-disabled')) {
                            $('#prev_btn').removeClass('btn-disabled').addClass('btn-default');
                            $('.btn-default').css({
                                "color": '#111',
                                "background-color": "#fff",
                                "border-color": "#ddd"
                            });
                        }
                        GC.current++;
                        //清空计时&条件
                        GC.timer = 0;
                        GC.courseFlag = false;

                        $('.current').text(GC.current);
                    } else if (GC.roundMinContentLs[GC.current - 1].contentType == 2 || GC.roundMinContentLs[GC.current - 1].contentType == 3) {
                        //if(GC.roundMinContentLs.length==GCContentLs.length&&GC.current<GC.roundMinContentLs.length){
                        //  GC.current++;
                        //  $('.current').text(GC.current);
                        //}
                        var currentSubjectItem = $('#quest_content_list').find('.item').eq(GC.current - 1).find('.subject-list .subject-item');
                        var currentSubjectItemSize = currentSubjectItem.size();

                        for (var i = 0; i < currentSubjectItemSize; i++) {
                            var questionTypeId = parseInt(currentSubjectItem.eq(i).find('.question').attr('questionTypeId'));

                            // 单选题
                            if (questionTypeId == 1) {
                                var selectedSize = currentSubjectItem.eq(i).find('.selected').size();
                                if (selectedSize < 1) {
                                    GC.scrollTop = currentSubjectItem.eq(i).offset().top;
                                    M.alert('单选题要选择一项', function () {
                                        document.body.scrollTop = GC.scrollTop-45;
                                    });
                                    return;
                                }
                            }

                            // 多选题
                            if (questionTypeId == 2) {
                                var selectedSize = currentSubjectItem.eq(i).find('.selected').size();

                                if (selectedSize < 2) {
                                    GC.scrollTop = currentSubjectItem.eq(i).offset().top;
                                    M.alert('多选题要选择至少两项', function () {
                                        document.body.scrollTop = GC.scrollTop-45;
                                    });
                                    return;
                                }
                            }

                            // 判断题
                            if (questionTypeId == 3) {
                                var selectedSize = currentSubjectItem.eq(i).find('.selected').size();

                                if (selectedSize < 1) {
                                    GC.scrollTop = currentSubjectItem.eq(i).offset().top;
                                    M.alert('判断题要选择一项', function () {
                                        document.body.scrollTop = GC.scrollTop-45;
                                    });
                                    return;
                                }
                            }

                            // 简答题
                            if (questionTypeId == 4) {
                                var value = currentSubjectItem.eq(i).find('textarea').val();
                                if (!value) {
                                    GC.scrollTop = currentSubjectItem.eq(i).offset().top;
                                    M.alert('简答题不能为空', function () {
                                        document.body.scrollTop = GC.scrollTop-45;
                                    });
                                    return;
                                } else {
                                    if (value.length > 500) {
                                        GC.scrollTop = currentSubjectItem.eq(i).offset().top;
                                        M.alert('简答题答案字数不能超过500', function () {
                                            document.body.scrollTop = GC.scrollTop-45;
                                        });
                                        return;
                                    }
                                }
                            }

                            // 填空题
                            if (questionTypeId == 6) {
                                var inputItem = currentSubjectItem.eq(i).find('input');
                                var inputLength = inputItem.length;
                                var istrue = false;
                                for (var j = 0; j < inputLength; j++) {
                                    var inputValue = inputItem.eq(j).val();
                                    // if (!inputValue) {
                                    //   GC.scrollTop=currentSubjectItem.eq(i).offset().top;
                                    //   M.alert('填空题不能为空',function(){
                                    //     document.body.scrollTop=GC.scrollTop;
                                    //   });
                                    //   return;
                                    // } else {
                                    //   if (inputValue.length > 500) {
                                    //     GC.scrollTop=currentSubjectItem.eq(i).offset().top;
                                    //     M.alert('填空题答案字数不能超过500',function(){
                                    //       document.body.scrollTop=GC.scrollTop;
                                    //     });
                                    //     return;
                                    //   }
                                    // }
                                    if (inputValue) {
                                        istrue = true;
                                        if (inputValue.length > 500) {
                                            GC.scrollTop = currentSubjectItem.eq(i).offset().top;
                                            M.alert('填空题答案字数不能超过500', function () {
                                                document.body.scrollTop = GC.scrollTop-45;
                                            });
                                            return;
                                        }
                                    }
                                }
                                //填空题不能都为空
                                if (!istrue) {
                                    GC.scrollTop = currentSubjectItem.eq(i).offset().top;
                                    M.alert('填空题不能为空', function () {
                                        document.body.scrollTop = GC.scrollTop-45;
                                    });
                                    return;
                                }
                            }
                        }

                        GC.submitExamWithQuestions();
                    }
                    return;
                }

                // 完成检测
                if (GC.current == GC.total) {
                    GC.submitExamWithQuestions();
                    return;
                    if (GC.roundMinContentLs[GC.current - 1].contentType == 1) {

                        var tempFun = function(){

                            var gameId = GC.getUrlParams().gameId;
                            var questId = GC.getUrlParams().questId;
                            var gameInstId = GC.gameInstId;
                            var questInstId = GC.questInstId;
                            var courseSize = $('#quest_content_list').find('.course').size();
                            // 全是课程
                            if (courseSize == GC.total) {
                                location.replace('game-result.html?gameId=' + gameId + '&questId=' + questId + '&gameInstId=' + gameInstId +
                                    '&questInstId=' + questInstId + '&type=course');
                            } else {
                                location.replace('game-result.html?gameId=' + gameId + '&questId=' + questId + '&gameInstId=' + gameInstId +
                                    '&questInstId=' + questInstId);
                            }
                        }
                        var btnA = ['确定', 'cancel'];
                        var btnB = ['取消', 'submit'];
                        var result = M.confirm('确定要提交吗?', btnA, btnB, function(){}, tempFun);
                    }

                    if (GC.roundMinContentLs[GC.current - 1].contentType == 2 || GC.roundMinContentLs[GC.current - 1].contentType == 3) {
                        var currentSubjectItem = $('#quest_content_list').find('.item').eq(GC.current - 1).find('.subject-list .subject-item');
                        var currentSubjectItemSize = currentSubjectItem.size();

                        for (var i = 0; i < currentSubjectItemSize; i++) {
                            var questionTypeId = parseInt(currentSubjectItem.eq(i).find('.question').attr('questionTypeId'));

                            // 单选题
                            if (questionTypeId == 1) {
                                var selectedSize = currentSubjectItem.eq(i).find('.selected').size();

                                if (selectedSize < 1) {
                                    GC.scrollTop = currentSubjectItem.eq(i).offset().top;
                                    M.alert('单选题要选择一项', function () {
                                        document.body.scrollTop = GC.scrollTop -45;
                                    });
                                    return;
                                }
                            }

                            // 多选题
                            if (questionTypeId == 2) {
                                var selectedSize = currentSubjectItem.eq(i).find('.selected').size();

                                if (selectedSize < 2) {
                                    GC.scrollTop = currentSubjectItem.eq(i).offset().top;
                                    M.alert('多选题要选择至少两项', function () {
                                        document.body.scrollTop = GC.scrollTop -45;
                                    });
                                    return;
                                }
                            }

                            // 判断题
                            if (questionTypeId == 3) {
                                var selectedSize = currentSubjectItem.eq(i).find('.selected').size();

                                if (selectedSize < 1) {
                                    GC.scrollTop = currentSubjectItem.eq(i).offset().top;
                                    M.alert('判断题要选择一项', function () {
                                        document.body.scrollTop = GC.scrollTop-45;
                                    });
                                    return;
                                }
                            }

                            // 简答题
                            if (questionTypeId == 4) {
                                var value = currentSubjectItem.eq(i).find('textarea').val();
                                if (!value) {
                                    GC.scrollTop = currentSubjectItem.eq(i).offset().top;
                                    M.alert('简答题不能为空', function () {
                                        document.body.scrollTop = GC.scrollTop-45;
                                    });
                                    return;
                                } else {
                                    if (value.length > 500) {
                                        GC.scrollTop = currentSubjectItem.eq(i).offset().top;
                                        M.alert('简答题答案字数不能超过500', function () {
                                            document.body.scrollTop = GC.scrollTop-45;
                                        });
                                        return;
                                    }
                                }
                            }

                            //填空题
                            if (questionTypeId == 6) {
                                var inputItem = currentSubjectItem.eq(i).find('input');
                                var inputLength = inputItem.length;
                                var istrue = false;
                                for (var j = 0; j < inputLength; j++) {
                                    var inputValue = inputItem.eq(j).val();

                                    // if (!inputValue) {
                                    //   GC.scrollTop=currentSubjectItem.eq(i).offset().top;
                                    //   M.alert('填空题不能为空',function(){
                                    //     document.body.scrollTop=GC.scrollTop;
                                    //   });
                                    //   return;
                                    // } else {
                                    //   if (inputValue.length > 500) {
                                    //     GC.scrollTop=currentSubjectItem.eq(i).offset().top;
                                    //     M.alert('填空题答案字数不能超过500',function(){
                                    //       document.body.scrollTop=GC.scrollTop;
                                    //     });
                                    //     return;
                                    //   }
                                    // }
                                    if (inputValue) {
                                        istrue = true;
                                        if (inputValue.length > 500) {
                                            GC.scrollTop = currentSubjectItem.eq(i).offset().top;
                                            M.alert('填空题答案字数不能超过500', function () {
                                                document.body.scrollTop = GC.scrollTop-45;
                                            });
                                            return;
                                        }
                                    }
                                }
                                //填空题不能都为空
                                if (!istrue) {
                                    GC.scrollTop = currentSubjectItem.eq(i).offset().top;
                                    M.alert('填空题不能为空', function () {
                                        document.body.scrollTop = GC.scrollTop-45;
                                    });
                                    return;
                                }

                            }
                        }

                        var btnA = ['确定', 'cancel'];
                        var btnB = ['取消', 'submit'];
                        var submitFun = function(){
                            GC.isLastContent = true;
                            GC.submitExamWithQuestions();
                        }
                        var result = M.confirm('确定要提交吗?', btnA, btnB, function(){}, submitFun);
                        // GC.isLastContent = true;
                        // GC.submitExamWithQuestions();
                    }
                }
            }
        });
    },
    //// 退出提示
    //bindExitTip: function () {
    //  $('#back_btn').bind('click', function () {
    //    var btnA = ['确定', 'cancel'];
    //    var btnB = ['取消', 'submit'];
    //    var cancelFun = function () {
    //    };
    //    var submitFun = function () {
    //      if (sessionStorage.getItem('againBtn')) {
    //        sessionStorage.removeItem('againBtn');
    //        if (M.getCookie('hasTab') == '0' || window.sessionStorage.getItem('isStudy') == 1) {
    //          location.href = 'game.html?gameId=' + M.getUrlParams().gameId;
    //        } else {
    //          location.href = 'main.html#game?gameId=' + M.getUrlParams().gameId;
    //        }
    //      } else {
    //        history.back();
    //        return false
    //      }
    //    };
    //
    //    var result = M.confirm('确定要退出这次闯关吗?', btnA, btnB, cancelFun, submitFun);
    //  });
    //},
    //图片选项查看
    bindViewPic: function () {
        $('#quest_content_list').find('.item').eq(GC.loadedContentLs).find('.option_img').bind('click', function () {
            var pages = 1;
            var imgURLs = [];

            imgURLs[0] = $(this).parent().find('img');
            // console.log(imgURLs[0]);

            var setItems = function () {
                var items = imgURLs;

                for (var i = 0; i < pages; i++) {
                    var obj = {};
                    var temp = imgURLs[i];
                    obj.src = temp.attr('src');
                    obj.w = temp[0].naturalWidth;
                    obj.h = temp[0].naturalHeight;
                    items[0] = obj;
                }

                return items;
            };

            var openPhotoSwipe = function () {
                var pswpElement = document.querySelectorAll('.pswp')[0];
                var items = setItems();
                var options = {
                    history: false,
                    focus: false,
                    showAnimationDuration: 0,
                    hideAnimationDuration: 0
                };
                var gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, items, options);

                gallery.init();
            };

            openPhotoSwipe();
        });
    },
    //看课心跳
    bindHeartBeat: function () {
        var courseId = $('.item:eq(' + (GC.current - 1) + ')').find('.cd-header h1').attr('courseId');
        // console.log(courseId + "??!!")
        var url = M.ctx + 'front/heartBeat/readCourseCheckIn';
        var data = {
            userId: M.getCookie('userId'),
            orgId: M.getCookie('orgId'),
            courseId: courseId
        };

        $.ajax({
            type: 'GET',
            url: url,
            data: data,
            beforeSend: function (xhr) {
                xhr.setRequestHeader('X-Auth-Token', M.getCookie('authToken'));
            },
            success: function (data) {
                console.log('记录心跳');
                console.log(data);
            }
        });
    },
    //videoHeartBeat
    bindVideoHeartBeat: function (obj) {
        console.log('videoBeat !');
        //15min
        var initIndex = GC.current - 1;
        var playFlag = true;
        var video = $('.item:eq(' + (GC.current - 1) + ')').find('#audio_video-view video');
        var ifVideoPlay = setInterval(function () {
            if (!video[0].paused && ($('.item:eq(' + (GC.current - 1) + ') #audio_video-view').children().length > 0)) {
                if (playFlag) {
                    // console.log('+ 1.1')
                } else {
                    // console.log('+ 1.2')
                    playFlag = true;
                    GC.bindHeartBeat();
                    videoPlay = setInterval(function () {
                        GC.bindHeartBeat();
                    }, 900000)
                }
            } else {
                // console.log('-')
                playFlag = false;
                clearInterval(videoPlay)
            }
            //
            if ($('#page_2').css('display') == 'none') {
                clearInterval(videoPlay)
            }
            //
            var tempIndex = parseInt($('.fixed-footer').find('span.current').text()) - 1;
            console.log('init:' + initIndex);
            console.log('tempIndex:' + tempIndex);
            if (!(initIndex == tempIndex)) {
                clearInterval(ifVideoPlay)
            }
        }, 1000)
        var videoPlay = setInterval(function () {
            GC.bindHeartBeat();
        }, 900000)//900000
    },
    //Audio HeartBeat
    bindAudioHeartBeat: function (courseId) {
        // $('.item:eq('+(GC.current-1)+')').find('.cd-header h1').attr('courseId')
        var initIndex = GC.current - 1;
        var playFlag = true;

        var indexAudio = courseId + 'audio';
        var AudioPlay;
        var audio = document.getElementById(indexAudio);
        audio.addEventListener("playing", function () {
            console.log('Audio HeartBeat Play')
            //清空计时&条件-audio
            // GC.timer = 0;
            GC.courseFlag = true;
            //---
            if (playFlag) {
                // console.log('+ 1.1')
            } else {
                // console.log('+ 1.2')
                playFlag = true;
                GC.bindHeartBeat();
            }
            AudioPlay = setInterval(function () {
                GC.bindHeartBeat();
            }, 900000)//900000
        });
        audio.addEventListener("pause", function () {
            console.log('Audio HeartBeat Pause')
            //清空计时&条件-audio
            GC.courseFlag = false;
            // GC.timer = 0;
            //---
            playFlag = false;
            clearInterval(AudioPlay);
        })
    },
    // 记录课程已阅读
    markCourseReaded: function (courseId) {
        //没有考虑课练情况
        var url = M.ctx + 'front/basicCourse/' + courseId +
            '/markCourseReaded.action?orgId=' + M.getCookie('orgId') + '&userId=' + M.getCookie('userId');

        $.ajax({
            type: 'POST',
            url: url,
            beforeSend: function (xhr) {
                xhr.setRequestHeader('X-Auth-Token', M.getCookie('authToken'));
            },
            success: function (data) {
                console.log('记录课程已阅读：');
                console.log(data);
                $('#page_1 .item').eq(GC.current - 1).find('.cd-header h1').attr('hasReaded', true);
                CU.addRecordReaded(courseId);
            }
        })
    },
    //绑定退出
    stopGame: function () {
        $('#back_id').bind('click', function () {
            M.alertBox();
            $('#back_stop').css('background', M.getCookie('themeColor'));
            $('.back-dis').show();
        });

        //继续闯关
        $('#back_continue').bind('click', function () {
            $('.alertBox').remove();
            $('.back-dis').hide();
        });

        //退出闯关
        $('#back_stop').bind('click', function () {
            //任务进到闯关
            if(sessionStorage.getItem('taskItem')){
                location.replace('task-items.html');
                sessionStorage.removeItem('NextQuestId');
                sessionStorage.removeItem('taskItem');
                return;
            }
            //正常
            if (sessionStorage.getItem('againBtn')) {
                sessionStorage.removeItem('againBtn');
                if (M.getCookie('hasTab') == '0' || window.sessionStorage.getItem('isStudy') == 1) {
                    sessionStorage.removeItem('NextQuestId');
                    location.replace('game.html?gameId=' + M.getUrlParams().gameId + '');
                } else {
                    location.href = 'main.html#game?gameId=' + M.getUrlParams().gameId;
                }
            } else {
                sessionStorage.removeItem('NextQuestId');
                location.replace('game.html?gameId=' + M.getUrlParams().gameId + '');
            }
        });
    }
};

$(function () {
    GC.init();
});
