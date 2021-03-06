//달력 보여주기
var currentTitle = document.getElementById('current-year-month');
var calendarBody = document.getElementById('calendar-body');
var today = new Date();
var first = new Date(today.getFullYear(), today.getMonth(), 1);
var dayList = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
var monthList = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
var leapYear = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
var notLeapYear = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
var pageFirst = first;
var pageYear;
var mainTodayDay = document.getElementById('main-day');
var mainTodayDate = document.getElementById('main-date');
if (first.getFullYear() % 4 === 0) {
	pageYear = leapYear;
} else {
	pageYear = notLeapYear;
}

function showCalendar() {
	let monthCnt = 100;
	let cnt = 1;
	for (var i = 0; i < 6; i++) {
		var $tr = document.createElement('tr');
		$tr.setAttribute('id', monthCnt);
		for (var j = 0; j < 7; j++) {
			if ((i === 0 && j < first.getDay()) || cnt > pageYear[first.getMonth()]) {
				var $td = document.createElement('td');
				var $div = document.createElement('div');
				$tr.appendChild($td);
				$td.appendChild($div);
			} else {
				var $td = document.createElement('td');
				var $div = document.createElement('div');
				//$td.textContent = cnt;
				$td.setAttribute('id', cnt);
				var cntplus = "00" + cnt;
				var cntslice = cntplus.slice(-2);
				$td.setAttribute('value', cntslice);
				$tr.appendChild($td);
				$div.textContent = cnt;
				$td.appendChild($div);
				cnt++;
			}
		}
		monthCnt++;
		calendarBody.appendChild($tr);
	}
}
showCalendar();

function removeCalendar() {
	let catchTr = 100;
	for (var i = 100; i < 106; i++) {
		var $tr = document.getElementById(catchTr);
		$tr.remove();
		catchTr++;
	}
}

currentTitle.innerHTML = monthList[first.getMonth()] + '&nbsp;&nbsp;&nbsp;&nbsp;' + first.getFullYear();

//달력 클릭시 날짜 나옴
function showMain() {
	mainTodayDay.innerHTML = dayList[today.getDay()];
	mainTodayDate.innerHTML = today.getDate();
}
showMain();

var clickedDate1 = document.getElementById(today.getDate());
clickedDate1.classList.add('active');

var tdGroup = [];
function clickStart() {
	for (let i = 1; i <= pageYear[first.getMonth()]; i++) {
		tdGroup[i] = document.getElementById(i);
		//tdGroup[i].addEventListener('click', changeToday);
	}
}
function changeToday(e) {
	for (let i = 1; i <= pageYear[first.getMonth()]; i++) {
		if (tdGroup[i].classList.contains('active')) {
			tdGroup[i].classList.remove('active');
		}
	}
	clickedDate1 = e.currentTarget;
	clickedDate1.classList.add('active');
	today = new Date(today.getFullYear(), today.getMonth(), clickedDate1.id);
	showMain();
	keyValue = today.getFullYear() + '' + today.getMonth() + '' + today.getDate();
	reshowingList();
}
clickStart();

//input 입력
function reshowingList() {
	keyValue = today.getFullYear() + '' + today.getMonth() + '' + today.getDate();
	if (todoList[keyValue] === undefined) {
		inputList.textContent = '';
		todoList[keyValue] = [];
		const $divs = document.querySelectorAll('#input-list > div');
		$divs.forEach(function(e) {
			e.remove();
		});
		const $btns = document.querySelectorAll('#input-list > button');
		$btns.forEach(function(e1) {
			e1.remove();
		});
	} else if (todoList[keyValue].length === 0) {
		inputList.textContent = "";
		const $divs = document.querySelectorAll('#input-list > div');
		$divs.forEach(function(e) {
			e.remove();
		});
		const $btns = document.querySelectorAll('#input-list > button');
		$btns.forEach(function(e1) {
			e1.remove();
		});
	} else {
		const $divs = document.querySelectorAll('#input-list > div');
		$divs.forEach(function(e) {
			e.remove();
		});
		const $btns = document.querySelectorAll('#input-list > button');
		$btns.forEach(function(e1) {
			e1.remove();
		});
		var $div = document.createElement('div');
		for (var i = 0; i < todoList[keyValue].length; i++) {
			var $div = document.createElement('div');
			$div.textContent = '-' + todoList[keyValue][i];
			var $btn = document.createElement('button');
			$btn.setAttribute('type', 'button');
			$btn.setAttribute('id', 'del-ata');
			$btn.setAttribute('id', dataCnt + keyValue);
			$btn.setAttribute('class', 'del-data');
			$btn.textContent = delText;
			inputList.appendChild($div);
			inputList.appendChild($btn);
			$div.addEventListener('click', checkList);
			$btn.addEventListener('click', deleteTodo);
			// inputBox.value = '';
			function deleteTodo() {
				$div.remove();
				$btn.remove();
			}
		}
	}

}
var inputBox = document.getElementById('input-box');
var inputDate = document.getElementById('input-data');
var inputList = document.getElementById('input-list');
var delText = 'X';
inputDate.addEventListener('click', addTodoList);
var dataCnt = 1;
var keyValue = today.getFullYear() + '' + today.getMonth() + '' + today.getDate();
let todoList = [];
todoList[keyValue] = [];
function addTodoList() {
	var $div = document.createElement('div');
	$div.textContent = '-' + inputBox.value;
	var $btn = document.createElement('button');
	$btn.setAttribute('type', 'button');
	$btn.setAttribute('id', 'del-ata');
	$btn.setAttribute('id', dataCnt + keyValue);
	$btn.setAttribute('class', "del-data");
	$btn.textContent = delText;

	todoList[keyValue].push(inputBox.value);
	dataCnt++;
	$div.addEventListener('click', checkList);
	$btn.addEventListener('click', deleteTodo);
	function deleteTodo() {
		$div.remove();
		$btn.remove();
	}
}
// console.log(keyValue);
function checkList(e) {
	e.currentTarget.classList.add('checked');
}

//클릭시 색 넣기
$("#happy").click(function() {
	$(".active").css("background-color", "#fdee00");
});
$("#soso").click(function() {
	$(".active").css("background-color", "#ccccff");
});
$("#romance").click(function() {
	$(".active").css("background-color", "#ffc1cc");
});
$("#angry").click(function() {
	$(".active").css("background-color", "#ff0028");

});
$("#sad").click(function() {
	$(".active").css("background-color", "#4166f5");

});
$("#irritation").click(function() {
	$(".active").css("background-color", "#ff7518");

});

//버튼클릭시 감정확인
$("#happy").click(function() {
	var plate = $("#happy").val();
	$("#selected-color")[0].innerHTML = plate;
});
console.log($("#selected-color")[0].innerHTML);
$("#soso").click(function() {
	var plate = $("#soso").val();
	$("#selected-color")[0].innerHTML = plate;
});
$("#romance").click(function() {
	var plate = $("#romance").val();
	$("#selected-color")[0].innerHTML = plate;
});
$("#angry").click(function() {
	var plate = $("#angry").val();
	$("#selected-color")[0].innerHTML = plate;
});
$("#sad").click(function() {
	var plate = $("#sad").val();
	$("#selected-color")[0].innerHTML = plate;
});
$("#irritation").click(function() {
	var plate = $("#irritation").val();
	$("#selected-color")[0].innerHTML = plate;
});


