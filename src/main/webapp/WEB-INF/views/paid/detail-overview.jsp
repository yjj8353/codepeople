<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
    
                <div class="col-xs-12 paid-overview-features">
               
                <h4>ABOUT THIS COURSE</h4>
                <p id="paid-content-about">
                    ${lectureDetails[0].paidLecture.summary }
                </p>

                <hr />
               
                    <h4 style="margin-bottom: 20px;">COURSE FEATURES</h4>
               
                <div class="col-xs-12 course-features" style="padding: 0px;">

                    <div class="col-xs-12" id="lang-box">
                        <p>LANGUAGE</p>
                        <h3 id="paid-content-lang">${lectureDetails[0].paidLecture.lang }</h3>
                    </div>
                    <div class="col-xs-6" id="level-box">
                        <p>LEVEL</p>
                        <h3 id="paid-content-level">${lectureDetails[0].paidLecture.level }</h3>
                    </div>
                    <div class="col-xs-6" id="hours-box">
                        <p>HOURS</p>
                        <h3 id="paid-content-hours">70 HOURS</h3>
                    </div>
                    <div class="col-xs-12" id="special-box">
                        <p>SPECIALIZED</p>
                        <h3 id="paid-content-special">${lectureDetails[0].paidLecture.specialized }</h3>
                    </div>
                </div>

                <div class="col-xs-12" style="padding:0px;">
                    <hr />
                </div>

                <h4>DESCRIPTION</h4>
                <p id="paid-content-description">
                   ${lectureDetails[0].paidLecture.description }
                </p>

                <hr />

                <h4>INSTRUCTOR</h4>
                <div id="paid-content-instructor">
                    <div class="col-xs-1" style='padding: 0px;'>
                        <img id="paid-instructor-photo" src="/resources/img/user/icon/${lectureDetails[0].paidLecture.instructor.user.avatar.image eq 'Default' ? 'icon.png' : lectureDetails[0].paidLecture.instructor.user.avatar.image}">
                    </div>
                    <div class="col-xs-11">
                        <div>
                            <h3 id="paid-instructor-name">${lectureDetails[0].paidLecture.instructor.user.name }</h3>
                        </div>
                        <div>
                            <p id="paid-instructor-about">${lectureDetails[0].paidLecture.instructor.summary }</p>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12" style="padding: 0px;">
                    <p id="paid-instructor-description">
                        ${lectureDetails[0].paidLecture.instructor.description }
                    </p>
                </div>
            </div>	  
       </body>     
</html>