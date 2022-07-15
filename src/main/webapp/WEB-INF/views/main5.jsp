<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.container{
	display:flex;
	justify-content:space-around;
	algin-items:baseline;
	margin-bottom:20px;
	
}
.container2{border-radius: 10px;
	width:100%;
	border:1px solid grey;
	height: 300px;
	}
.progressbar{
	
	width:40%;
	border-radius: 10px;
	border:1px solid grey;
	height: 300px;
}
.titular{
	border-bottom:1px solid grey;
}
.today{
	border-radius: 10px;
	width:40%;
	border:1px solid grey;
	height: 300px;
}
.intext{
	text-align:center;
	line-height:100px
}
ul.list, ol.list {
    list-style: none;
    margin: 0px;
    padding: 0px;
    max-width: 3000px;
    width: 100%;
}
ul.list li, ol.list li {
    padding: 5px 0px 5px 5px;
    margin-bottom: 10px;
    border-bottom: 1px solid #efefef;
    font-size: 12px;
}
</style>
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/main5.css" rel="stylesheet" type="text/css" />
</head>
<body>
<script type="text/javascript">

//slide-wrap
var slideWrapper = document.getElementById('slider-wrap');
//current slideIndexition

var slideIndex = 0;
//items
var slides = document.querySelectorAll('#slider-wrap ul li');
//number of slides
var totalSlides = slides.length;
//get the slide width
var sliderWidth = slideWrapper.clientWidth;
//set width of items
slides.forEach(function (element) {
    element.style.width = sliderWidth + 'px';
})
//set width to be 'x' times the number of slides
var slider = document.querySelector('#slider-wrap ul#slider');
slider.style.width = sliderWidth * totalSlides + 'px';

// next, prev
var nextBtn = document.getElementById('next');
var prevBtn = document.getElementById('previous');
nextBtn.addEventListener('click', function () {
    plusSlides(1);
});
prevBtn.addEventListener('click', function () {
    plusSlides(-1);
});

// hover
slideWrapper.addEventListener('mouseover', function () {
    this.classList.add('active');
    clearInterval(autoSlider);
});
slideWrapper.addEventListener('mouseleave', function () {
    this.classList.remove('active');
    autoSlider = setInterval(function () {
        plusSlides(1);
    }, 3000);
});


function plusSlides(n) {
    showSlides(slideIndex += n);
}

function currentSlides(n) {
    showSlides(slideIndex = n);
}

function showSlides(n) {
    slideIndex = n;
    if (slideIndex == -1) {
        slideIndex = totalSlides - 1;
    } else if (slideIndex === totalSlides) {
        slideIndex = 0;
    }

    slider.style.left = -(sliderWidth * slideIndex) + 'px';
    pagination();
}

//pagination
slides.forEach(function () {
    var li = document.createElement('li');
    document.querySelector('#slider-pagination-wrap ul').appendChild(li);
})

function pagination() {
    var dots = document.querySelectorAll('#slider-pagination-wrap ul li');
    dots.forEach(function (element) {
        element.classList.remove('active');
    });
    dots[slideIndex].classList.add('active');
}

pagination();
var autoSlider = setInterval(function () {
    plusSlides(1);
}, 3000);
    

</script>
<ul class="slides">
    <input type="radio" name="radio-btn" id="img-1" checked />
    <li class="slide-container">
    <div class="slide">
      <img src="resources/img/main/bird.jpg">
        </div>
    <div class="nav">
      <label for="img-6" class="prev">&#x2039;</label>
      <label for="img-2" class="next">&#x203a;</label>
    </div>
    </li>

    <input type="radio" name="radio-btn" id="img-2" />
    <li class="slide-container">
        <div class="slide">
          <img src="resources/img/main/cat.jpg">
        </div>
    <div class="nav">
      <label for="img-1" class="prev">&#x2039;</label>
      <label for="img-3" class="next">&#x203a;</label>
    </div>
    </li>

    <input type="radio" name="radio-btn" id="img-3" />
    <li class="slide-container">
        <div class="slide">
          <img src="resources/img/main/dog.jpg">
        </div>
    <div class="nav">
      <label for="img-2" class="prev">&#x2039;</label>
      <label for="img-4" class="next">&#x203a;</label>
    </div>
    </li>

    

    <li class="nav-dots">
      <label for="img-1" class="nav-dot" id="img-dot-1"></label>
      <label for="img-2" class="nav-dot" id="img-dot-2"></label>
      <label for="img-3" class="nav-dot" id="img-dot-3"></label>
      <label for="img-4" class="nav-dot" id="img-dot-4"></label>
      <label for="img-5" class="nav-dot" id="img-dot-5"></label>
      <label for="img-6" class="nav-dot" id="img-dot-6"></label>
    </li>
</ul>

<div class="container">
	<div class="progressbar">
		
		<h2 class="titular" href="#">오늘의 활동량></h2>
		<div class="intext">today<br>          
		<progress id="progress" value="50" min="0" max="100"></progress>
		</div>
		
	</div>
	<div class="today">
		<h2 class="titular" href="#">오늘의 일정></h2>
		<div class="intext">
		
		</div>
	</div>
</div>
<div class="container2">
<h2 class="titular" href="#">인기글></h2>
<ul class="list">
	<table border="0" class="boardTable">
	<tr>
			<th>글번호</th><th>제목</th><th>작성자</th><th>댓글수</th><th>조회수</th><th>추천수</th><th>작성일</th>
		</tr>
		<c:forEach var="board" items="${boardList}">
		<tr>
			<td class="idx">${board.bno}</td>
			<td align="left" class="subject"> <a href="view.do?bno=${board.bno}">${board.title}</a></td>
			<td class="writer">  ${board.writerId}</td>
			<td class="comment">${board.replycnt}</td>
			<td class="hitcount">${board.viewcnt}</td>
			<td class="recommendcount">${board.recommendcnt}</td>
			<td class="writeDate">${board.regDate}</td>
		</tr>
     </c:forEach>
</table>
</ul>
</div>

</body>
</html>