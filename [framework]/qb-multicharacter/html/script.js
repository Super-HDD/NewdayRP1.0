var selectedChar = null;
var WelcomePercentage = "30vh"
qbMultiCharacters = {}
var Loaded = false;
var NChar = null;

$(document).ready(function (){
    window.addEventListener('message', function (event) {
        var data = event.data;

        if (data.action == "ui") {
			NChar = data.nChar;
            if (data.toggle) {
                $('.container').show();
                $(".welcomescreen").fadeIn(150);
                qbMultiCharacters.resetAll();

                var originalText = "检索玩家数据";
                var loadingProgress = 0;
                var loadingDots = 0;
                $("#loading-text").html(originalText);
                var DotsInterval = setInterval(function() {
                    $("#loading-text").append(".");
                    loadingDots++;
                    loadingProgress++;
                    if (loadingProgress == 3) {
                        originalText = "验证玩家数据"
                        $("#loading-text").html(originalText);
                    }
                    if (loadingProgress == 4) {
                        originalText = "检索角色"
                        $("#loading-text").html(originalText);
                    }
                    if (loadingProgress == 6) {
                        originalText = "验证角色"
                        $("#loading-text").html(originalText);
                    }
                    if(loadingDots == 4) {
                        $("#loading-text").html(originalText);
                        loadingDots = 0;
                    }
                }, 500);

                setTimeout(function(){
					setCharactersList()
                    $.post('https://qb-multicharacter/setupCharacters');
                    setTimeout(function(){
                        clearInterval(DotsInterval);
                        loadingProgress = 0;
                        originalText = "Retrieving data";
                        $(".welcomescreen").fadeOut(150);
                        qbMultiCharacters.fadeInDown('.character-info', '20%', 400);
                        qbMultiCharacters.fadeInDown('.characters-list', '20%', 400);
                        $.post('https://qb-multicharacter/removeBlur');
                    }, 2000);
                }, 2000);
            } else {
                $('.container').fadeOut(250);
                qbMultiCharacters.resetAll();
            }
        }

        if (data.action == "setupCharacters") {
            setupCharacters(event.data.characters)
        }

        if (data.action == "setupCharInfo") {
            setupCharInfo(event.data.chardata)
        }
    });

    $('.datepicker').datepicker();
});

$('.continue-btn').click(function(e){
    e.preventDefault();
});

$('.disconnect-btn').click(function(e){
    e.preventDefault();

    $.post('https://qb-multicharacter/closeUI');
    $.post('https://qb-multicharacter/disconnectButton');
});

function setupCharInfo(cData) {
    if (cData == 'empty') {
        $('.character-info-valid').html('<span id="no-char">The selected character slot is not in use yet.<br><br>This character doesn\'t have information yet.</span>');
    } else {
        var gender = "Man"
        if (cData.charinfo.gender == 1) { gender = "Woman" }
        $('.character-info-valid').html(
        '<div class="character-info-box"><span id="info-label">姓名: </span><span class="char-info-js">'+cData.charinfo.firstname+' '+cData.charinfo.lastname+'</span></div>' +
        '<div class="character-info-box"><span id="info-label">出生日期: </span><span class="char-info-js">'+cData.charinfo.birthdate+'</span></div>' +
        '<div class="character-info-box"><span id="info-label">性别: </span><span class="char-info-js">'+gender+'</span></div>' +
        '<div class="character-info-box"><span id="info-label">国籍: </span><span class="char-info-js">'+cData.charinfo.nationality+'</span></div>' +
        '<div class="character-info-box"><span id="info-label">工作: </span><span class="char-info-js">'+cData.job.label+'</span></div>' +
        '<div class="character-info-box"><span id="info-label">现金: </span><span class="char-info-js">&#36; '+cData.money.cash+'</span></div>' +
        '<div class="character-info-box"><span id="info-label">银行资金: </span><span class="char-info-js">&#36; '+cData.money.bank+'</span></div>');
    }
}

function setupCharacters(characters) {
    $.each(characters, function(index, char){
        $('#char-'+char.cid).html("");
        $('#char-'+char.cid).data("citizenid", char.citizenid);
        setTimeout(function(){
            $('#char-'+char.cid).html('<span id="slot-name">'+char.charinfo.firstname+' '+char.charinfo.lastname+'<span id="cid">' + char.citizenid + '</span></span>');
            $('#char-'+char.cid).data('cData', char)
            $('#char-'+char.cid).data('cid', char.cid)
        }, 100)
    })
}

$(document).on('click', '#close-log', function(e){
    e.preventDefault();
    selectedLog = null;
    $('.welcomescreen').css("filter", "none");
    $('.server-log').css("filter", "none");
    $('.server-log-info').fadeOut(250);
    logOpen = false;
});

$(document).on('click', '.character', function(e) {
    var cDataPed = $(this).data('cData');
    e.preventDefault();
    if (selectedChar === null) {
        selectedChar = $(this);
        if ((selectedChar).data('cid') == "") {
            $(selectedChar).addClass("char-selected");
            setupCharInfo('empty')
            $("#play-text").html("Create");
            $("#play").css({"display":"block"});
            $("#delete").css({"display":"none"});
            $.post('https://qb-multicharacter/cDataPed', JSON.stringify({
                cData: cDataPed
            }));
        } else {
            $(selectedChar).addClass("char-selected");
            setupCharInfo($(this).data('cData'))
            $("#play-text").html("扮演该角色");
            $("#delete-text").html("删除该角色");
            $("#play").css({"display":"block"});
            $("#delete").css({"display":"block"});
            $.post('https://qb-multicharacter/cDataPed', JSON.stringify({
                cData: cDataPed
            }));
        }
    } else if ($(selectedChar).attr('id') !== $(this).attr('id')) {
        $(selectedChar).removeClass("char-selected");
        selectedChar = $(this);
        if ((selectedChar).data('cid') == "") {
            $(selectedChar).addClass("char-selected");
            setupCharInfo('empty')
            $("#play-text").html("Register");
            $("#play").css({"display":"block"});
            $("#delete").css({"display":"none"});
            $.post('https://qb-multicharacter/cDataPed', JSON.stringify({
                cData: cDataPed
            }));
        } else {
            $(selectedChar).addClass("char-selected");
            setupCharInfo($(this).data('cData'))
            $("#play-text").html("扮演该角色");
            $("#delete-text").html("删除该角色");
            $("#play").css({"display":"block"});
            $("#delete").css({"display":"block"});
            $.post('https://qb-multicharacter/cDataPed', JSON.stringify({
                cData: cDataPed
            }));
        }
    }
});

var entityMap = {
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    '"': '&quot;',
    "'": '&#39;',
    '/': '&#x2F;',
    '': '&#x60;',
    '=': '&#x3D;'
};

function escapeHtml(string) {
    return String(string).replace(/[&<>"'=/]/g, function (s) {
        return entityMap[s];
    });
}
function hasWhiteSpace(s) {
    return /\s/g.test(s);
  }
$(document).on('click', '#create', function (e) {
    e.preventDefault();

    let firstname= escapeHtml($('#first_name').val())
    let lastname= escapeHtml($('#last_name').val())
    let nationality= escapeHtml($('#nationality').val())
    let birthdate= escapeHtml($('#birthdate').val())
    let gender= escapeHtml($('select[name=gender]').val())
    let cid = escapeHtml($(selectedChar).attr('id').replace('char-', ''))
    const regTest = new RegExp(profList.join('|'), 'i');
    //An Ugly check of null objects

    if (!firstname || !lastname || !nationality || !birthdate || hasWhiteSpace(firstname) || hasWhiteSpace(lastname)|| hasWhiteSpace(nationality) ){
        console.log("FIELDS REQUIRED")
        return false;
    }

    if(regTest.test(firstname) || regTest.test(lastname)){
        console.log("ERROR: 您使用了贬义/粗俗的术语。 请再试一次!")
        return false;
    }

    $.post('https://qb-multicharacter/createNewCharacter', JSON.stringify({
        firstname: firstname,
        lastname: lastname,
        nationality: nationality,
        birthdate: birthdate,
        gender: gender,
        cid: cid,
    }));
    $(".container").fadeOut(150);
    $('.characters-list').css("filter", "none");
    $('.character-info').css("filter", "none");
    qbMultiCharacters.fadeOutDown('.character-register', '125%', 400);
    refreshCharacters()

});

$(document).on('click', '#accept-delete', function(e){
    $.post('https://qb-multicharacter/removeCharacter', JSON.stringify({
        citizenid: $(selectedChar).data("citizenid"),
    }));
    $('.character-delete').fadeOut(150);
    $('.characters-block').css("filter", "none");
    refreshCharacters();
});

$(document).on('click', '#cancel-delete', function(e){
    e.preventDefault();
    $('.characters-block').css("filter", "none");
    $('.character-delete').fadeOut(150);
});

function setCharactersList() {
    var htmlResult = '<div class="character-list-header"><p>请选择您要扮演的角色</p></div>'
    for (let i = 1; i <= NChar; i++) {
        htmlResult += '<div class="character" id="char-'+ i +'" data-cid=""><span id="slot-name">空位<span id="cid"></span></span></div>'
    }
    htmlResult += '<div class="char-reg-input" id="play"><p id="play-text">选择一个角色</p></div>'
    $('.characters-list').html(htmlResult)
}

function refreshCharacters() {
    var htmlResult = ''
    for (let i = 1; i <= NChar; i++) {
        htmlResult += '<div class="character" id="char-'+ i +'" data-cid=""><span id="slot-name">空位<span id="cid"></span></span></div>'
    }

    htmlResult += '<div class="character-btn" id="play"><p id="play-text">选择一个角色</p></div>'
    $('.characters-list').html(htmlResult)

    setTimeout(function(){
        $(selectedChar).removeClass("char-selected");
        selectedChar = null;
        $.post('https://qb-multicharacter/setupCharacters');
        $("#delete").css({"display":"none"});
        $("#play").css({"display":"none"});
        qbMultiCharacters.resetAll();
    }, 100)
}

$("#close-reg").click(function (e) {
    e.preventDefault();
    $('.characters-list').css("filter", "none")
    $('.character-info').css("filter", "none")
    qbMultiCharacters.fadeOutDown('.character-register', '125%', 400);
})

$("#close-del").click(function (e) {
    e.preventDefault();
    $('.characters-block').css("filter", "none");
    $('.character-delete').fadeOut(150);
})

$(document).on('click', '#play', function(e) {
    e.preventDefault();
    var charData = $(selectedChar).data('cid');

    if (selectedChar !== null) {
        if (charData !== "") {
            $.post('https://qb-multicharacter/selectCharacter', JSON.stringify({
                cData: $(selectedChar).data('cData')
            }));
            setTimeout(function(){
                qbMultiCharacters.fadeOutDown('.characters-list', "-40%", 400);
                qbMultiCharacters.fadeOutDown('.character-info', "-40%", 400);
                qbMultiCharacters.resetAll();
            }, 1500);
        } else {
            $('.characters-list').css("filter", "blur(2px)")
            $('.character-info').css("filter", "blur(2px)")
            qbMultiCharacters.fadeInDown('.character-register', '25%', 400);
        }
    }
});

$(document).on('click', '#delete', function(e) {
    e.preventDefault();
    var charData = $(selectedChar).data('cid');

    if (selectedChar !== null) {
        if (charData !== "") {
            $('.characters-block').css("filter", "blur(2px)")
            $('.character-delete').fadeIn(250);
        }
    }
});

qbMultiCharacters.fadeOutUp = function(element, time) {
    $(element).css({"display":"block"}).animate({top: "-80.5%",}, time, function(){
        $(element).css({"display":"none"});
    });
}

qbMultiCharacters.fadeOutDown = function(element, percent, time) {
    if (percent !== undefined) {
        $(element).css({"display":"block"}).animate({top: percent,}, time, function(){
            $(element).css({"display":"none"});
        });
    } else {
        $(element).css({"display":"block"}).animate({top: "103.5%",}, time, function(){
            $(element).css({"display":"none"});
        });
    }
}

qbMultiCharacters.fadeInDown = function(element, percent, time) {
    $(element).css({"display":"block"}).animate({top: percent,}, time);
}

qbMultiCharacters.resetAll = function() {
    $('.characters-list').hide();
    $('.characters-list').css("top", "-40");
    $('.character-info').hide();
    $('.character-info').css("top", "-40");
    $('.welcomescreen').css("top", WelcomePercentage);
    $('.server-log').show();
    $('.server-log').css("top", "25%");
}