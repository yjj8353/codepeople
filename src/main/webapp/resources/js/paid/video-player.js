$(function() {
	
        const video = document.getElementById('media-video');
        const historyNo = $("#lectureHistoryNo").val();
        const prevLength = $("#lectureHistoryLength").val();
        
        
        function sendAjaxCurrentTime() {
            let currentTime = Math.round(video.currentTime);
            console.log(currentTime);
            console.log(historyNo);
            
            if (!video.paused) {
            	$.ajax({
            		type : "POST",
            		data : {"currentTime" : currentTime, "historyNo" : historyNo},
            		url : "/user/my/getCurrentTime.do",
            		error : function() {
            			console.log('error!');
            		},
            		success : function(data) {
            			console.log(data);
            		}
            	});
            }
        }
        
		
		$(".mark-image").on("click", function() {
			var num = $(this).attr("id").replace("mark-", "");
			video.currentTime = num;

		})
        
    	$("#video-link-bookmark").on("click", function(event) {
    		$("#currentTime").remove();
    		
    		let currentTime = Math.round(video.currentTime);
    		const duration = Math.round(video.duration);
    		var barsize = $('#media-video').width() * 0.988;
    		var position = parseInt(currentTime * (barsize / video.duration));
    		
            var $mark = $(`<img class="mark-image" style="position:relative;" width="20px" id="mark-${currentTime}" src="/resources/img/paid/bookmark-video.png"/>`);
            var $div = $(`<input type="text" style="position:absolute; z-index:9999;" class="markComment" id="input-${currentTime}" name="markComment" value=""/>
            			<input type="hidden" id="currentTime" name="currentTime" value="${currentTime}"/>`);
            $mark.appendTo($('.mark-area'));
            $div.appendTo($('.bookmark-input-area'));
            $("#" + `input-${currentTime}`).css("margin-left", (position - 80));
            $("#" + `input-${currentTime}`).css("border", "3px solid #ff7373");
            $("#" + `input-${currentTime}`).css("background", "navy");
            $("#" + `input-${currentTime}`).css("color", "#ff7373");
            
            var imageNum = $(".mark-image").length;
            $("#" + `mark-${currentTime}`).css("left", position);
            $("#" + `mark-${currentTime}`).css("display", "inline");
    	})
    	
    	
    	
	$(".mark-image").on("mouseover", function() {
		
		var num = $(this).attr("id").replace("mark-", "");

		var content = $("#" + `caption-${num}`).text();
        var $newCaption = $(`<span class="newCaption-list" id="newCaption-${num}" style="color:white; background-color:black;">${content}</span>`);
        $newCaption.appendTo($('.caption'));
		
         $(".newCaption-list").css("margin-left", "900px");
		
	});

    $(".mark-image").on("mouseout", function() {
    		var num = $(this).attr("id").replace("mark-", "");
    		$("#" + `newCaption-${num}`).remove();
    		
    });
    	
    	
    	 function markPosition() {
    	
    		$(".mark-image").each(function(index, item) {
        		var currentTime = $(item).attr("id").replace("mark-", "");
        		
        		const duration = Math.round(video.duration);
        		var barsize = $('#media-video').width() * 0.988;
        		var num = $(".mark-image").length;
        		var position = parseInt(currentTime * (barsize / video.duration));
        		
       			$(item).css("left", (position) - (20 * index));
        	})
    	};       
    	
    	
		$("#video-link-exposure").on("click", function() {
    		$(".mark-image").each(function(index, item) {
        		var currentTime = $(item).attr("id").replace("mark-", "");
        		
        		const duration = Math.round(video.duration);
        		var barsize = $('#media-video').width() * 0.988;
        		var num = $(".mark-image").length;
        		var position = parseInt(currentTime * (barsize / video.duration));
        		
       			$(item).css("left", (position) - (20 * index));
        	})
        	
        	
        	var flag = $(".mark-image").css("display");
    		
    		if (flag === "none") {
    			$(".mark-image").css("display", "inline");
    		} else {
    			$(".mark-image").css("display", "none");
    		}
        	
		})
    	
    	
    	function captionPosition() {
    		$(".caption-list").each(function(index, item) {
    			var currentTime = $(item).attr("id").replace("caption-", "");
    			
    			const duration = Math.round(video.duration);
    			var barsize = $('#media-video').width() * 0.988;
    			
    			var position = parseInt(currentTime * (barsize / video.duration));
    			
    			$(item).css("left", position);
    			$(item).css("display", "inline");
    		})
    	}
    	
    	
    	$(".bookmark-input-area").keyup(function(key) {
			var markComment = $(".markComment").val();
			console.log(markComment);

			
			if (key.keyCode == 27) {
	            $("#" + `input-${currentTime}`).remove();
	            $("#" + `mark-${currentTime}`).css("left", position);

			}

			if (key.keyCode == 13) {
				
				var currentTime = $("#currentTime").val();
				var $comment = $(`<span class="caption-list" style="position:relative; color:white; background-color:black;"
				id="caption-${currentTime}">${markComment}</span>`);


				$.ajax({
					type : "POST",
					data : {currentTime : currentTime, historyNo : historyNo, markComment:markComment},
					url : "/paid/addBookmark.do",
					error : function() {
						console.log('error!');
					},
					success : function(data) {
						$(".markComment").remove();
						$("#" + `mark-${currentTime}`).css("display", "none");

			            $comment.appendTo($('.caption-storage'));
						
			            $("#" + `mark-${currentTime}`).on("mouseover", function() {
//							
							var num = $(this).attr("id").replace("mark-", "");
							var content = $("#" + `caption-${num}`).text();
					        var $newCaption = $(`<span class="newCaption-list" id="newCaption-${num}" style="color:white; background-color:black;">${content}</span>`);
					         $newCaption.appendTo($('.caption'));
					         $(".newCaption-list").css("margin-left", "900px");
						});

					    $(".mark-image").on("mouseout", function() {
					    		var num = $(this).attr("id").replace("mark-", "");
					    		$("#" + `newCaption-${num}`).remove();
					    		
					    	});
					    
						$(".mark-image").on("click", function() {
							var num = $(this).attr("id").replace("mark-", "");
							video.currentTime = num;

						})

						
						
					}
				});
			}
    	});
    	
    	
    	
    	

    	// 플레이어 구성 콘텐츠 나타내기

        function addBlockCss() {
            $('.video-header').css("display", "block");
            $('.video-footer').css("display", "block");
            $('.mark-area').css("display", "block");
        };

        function fadeOutBlock() {
            $('.video-header').fadeOut(2000);
            $('.video-footer').fadeOut(2000);
        };

        function fadeInBlock() {
            $('.video-header').fadeIn(1000);
            $('.video-footer').fadeIn(1000);
        };

        function displayNone() {
            $('.video-header').css("display", "none");
            $('.video-footer').css("display", "none");
            $(".mark-image").css("display", "none");
        };

        $("#media-player").on("mouseenter", () => {
            addBlockCss();
        });
        
        $("#media-player").on("mousemove", () => {
            addBlockCss();
        });

        $("#media-player").on("mouseleave", () => {
            displayNone();
        });

        // 5초 빠르게, 5초 느리게 버튼
        $("#plusCurrentTime").on("click", () => {
            video.currentTime += 10;
        });
        $("#minusCurrentTime").on("click", () => {
            video.currentTime -= 10;
        });


        // 플레이 속도 0.5배 빠르게, 느리게 버튼
        $(".speed-option a").click(function() {
            $(".speed-option a").css('background-color', '');
            $(this).css('background-color', '#afeeee');
            let speed = $(this).attr('id');
            $("#speedSetting").text("speed x" + speed);
            video.playbackRate = speed;
            $(".speed-dropup").css('display', 'none');
        })

        $("#speedDown").on("click", () => {
            video.playbackRate -= 0.5;
        });

        // 볼륨 0.1 up, 볼륨 0.1 down
        $("#volumeUp").on("click", () => {
            video.volume += 0.1;
        });

        $("#volumeDown").on("click", () => {
            video.volume -= 0.1;
        });

        // mute, unmute
        $("#mute").on("click", () => {
            if (!video.muted) {
                $("#mute").attr('class','glyphicon glyphicon-volume-off');
                video.muted = true;
            } else {
                $("#mute").attr('class','glyphicon glyphicon-volume-up');
                video.muted = false;
            }
        });

        // Picture in Picture (PIP) 모드
        $("#pip").on("click", (event) => {
            video.requestPictureInPicture();
            displayNone();
        });
       
       // time range 숫자 자릿수 맞추기 util
       function pad(n, width) {
            n = n + '';
            return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
        }

       video.onloadedmetadata = function() {
    	   
    	   // 영상 시간 가져오기
    	   const duration = Math.round(video.duration);
           const minutes = pad(Math.floor(duration / 60), 2);
           const seconds = pad(duration % 60, 2);
           $("#duration").text(`${minutes}:${seconds}`);
           
       };

       
       // canvas 획득
       var canvas = document.getElementById("myCanvas");
       var context = canvas.getContext("2d");
       var width = 400;
       var height = 240;
       
       
       // canvas에 그리기 함수
		function snap() {
		    context.fillRect(20, 20, 150, 100);
		    context.drawImage(video, 0, 0, width, height);

		}
      
		// button attach
		$("#video-smart-copy").on("click", function() {
			snap();
		});
       
       function currenttime() {
           let currenttime = Math.round(video.currentTime);
           let minutes = pad(Math.floor(currenttime / 60), 2);
           let seconds = pad(currenttime % 60, 2);
           $("#currenttime").text(`${minutes}:${seconds}`);
        };


        // fullscreen 모드
        $("#fullscreen").on("click", () => {
            video.requestFullscreen();
        });

       let barsize = $('#media-video').width() * 0.988;
       console.log(barsize);
       
       function getBarSize() {
            $('#backBar').css('width', barsize + 'px');
       }
       

        function update() {
            if (!video.ended) {
                let size = parseInt(video.currentTime * (barsize / video.duration));
                $("#progressBar").css("width", size + 'px');
            } else {
                $("#progressBar").css("width", "0px");
                window.clearInterval(updateBar);
            }
        };

        function updateBar() {
            let updateBar = setInterval(update, 100);
        };        
        
        
        function playOrPause() {
            if (!video.paused && !video.ended) {
                video.pause();
                window.clearInterval(updateBar());
            } else {
                video.play();
                updateBar();
            }
        };

        $("#playPause").on("click", () => {
            if (!video.paused) {
                $('#playPause').attr('class','glyphicon glyphicon-play');
            } else {
                $('#playPause').attr('class','glyphicon glyphicon-pause');
            }
            playOrPause();
        });

        function clickedBar(event) {
            if (!video.ended) {
                let mouseX = event.pageX - $("#backBar").offset().left;
                let newtime = mouseX * video.duration / barsize;
                console.log('시간 :', newtime);
                video.currentTime = newtime;
                $("progressBar").css("width", mouseX + 'px');
            }
        };


        $('#backBar').on('click', (event) => {
            addBlockCss();
            clickedBar(event);
        });

        $('#media-video').on('click', () => {
            if (!video.paused) {
                $('#playPause').attr('class','glyphicon glyphicon-play');
            } else {
                 $('#playPause').attr('class','glyphicon glyphicon-pause');
            }
            playOrPause();
        });

        $('#media-player').on('dblclick', () => {
            if (!video.fullscreen) {
                video.requestFullscreen();
            } else {
                video.exitFullScreen();
            }
        });


        $("#speedSetting").on('click', () => {
            $(".speed-dropup").toggle();
        });
	
		$("#video-lesson-menu").on("click", function() {
			$(this).css("display", "none");
			$("#mySidenav").css("width","30%");
			$(".video-footer").css("width","70%");
			$(".video-footer").css("margin-left", "30%");
			$(".video-header").css("width", "70%");
			$(".video-header").css("margin-left", "30%");
			$(".speed-dropup").css("margin-left", "30%");
			$("#media-video").css("width", "70%");
			$(".footer-center-buttons").css("margin-left", "20%");
			barsize = $('#media-video').width() * 0.988;
			getBarSize();
			updateBar();

		});
	
		$(".closebtn").on("click", function() {
			$("#video-lesson-menu").css("display", "block");
			$("#mySidenav").css("width","");
			$(".video-footer").css("width","100%");
			$(".video-footer").css("margin-left", "");
			$(".video-header").css("margin-left", "");
			$(".video-header").css("width", "100%");
			$("#media-video").css("width", "100%");
			$(".footer-center-buttons").css("margin-left", "28%");

			barsize = $('#media-video').width() * 0.988;
			getBarSize();
			updateBar();
		});

		$(".video-section-top-box").on('click', function(event) {
        
			const flag = $(this).siblings('.video-section-lesson-list').css('display');

			if (flag === "none") {
				$(this).siblings('.video-section-lesson-list').css('display', 'block');
			} else {
				$(this).siblings('.video-section-lesson-list').css('display', 'none');
			}
    	
		});
	
		$("#video-myNote").on("click", function() {
			
			$("#media-player").css("display", "none");
			$(".video-note-page").css("display", "block");
			$(".video-note-page").css("z-index", "1");
			$(".nse_content").css("display", "block");
			$("#pip").click();
		});
	
		$(".video-create-note-cancel").on("click", function() {
			if (document.pictureInPictureElement) {
				document.exitPictureInPicture()
				  .then(() => {$(".video-note-page").css("display", "none")})
				  .then(() => {$("#media-player").css("display", "block")})
				  .then(() => {$(".video-note-page").css("z-index", "-1")})
				  .catch(() => { /**/ });
			} else {
				return;
			}
		});
		
		var bookmarkLength = $("#bookmarkLength").val();
        
        function init() {
            getBarSize();
            updateBar();
            setInterval(currenttime,500);
            
            if (bookmarkLength != "") {
            	video.currentTime = bookmarkLength;
            	return;
            }
            
            
            if (prevLength) {
            	video.currentTime = prevLength;
            }            
            
            setInterval(sendAjaxCurrentTime, 10000);

        }
        
        init();

		
});
