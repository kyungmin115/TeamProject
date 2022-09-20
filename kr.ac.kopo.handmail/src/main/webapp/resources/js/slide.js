/*
  div사이즈 동적으로 구하기
*/

const outer = document.querySelector('.outer');
const innerList = document.querySelector('.iner');
const inners = document.querySelectorAll('.slide');
let currentIndex = 0; // 현재 슬라이드 화면 인덱스

inners.forEach((inner) => {
  inner.style.width = '${outer.clientWidth}px'; // inner의 width를 모두 outer의 width로 만들기
})

innerList.style.width = '${outer.clientWidth * inners.length}px'; // innerList의 width를 inner의 width * inner의 개수로 만들기

/*
  버튼에 이벤트 등록하기
*/
const buttonLeft = document.querySelector('.botl');
const buttonRight = document.querySelector('.botr');
window.onload = function() {
   innerList.style.marginLeft='0px'
    buttonLeft.addEventListener('click', () => {
      if(innerList.style.marginLeft=='0px'){
        innerList.style.marginLeft = '-2000px';
      }
      else if(innerList.style.marginLeft=='-1000px'){
        innerList.style.marginLeft = '0px';
      }
      else if(innerList.style.marginLeft='-2000px'){
        innerList.style.marginLeft = '-1000px';
      }
    
    });

    buttonRight.addEventListener('click', () => {
      if(innerList.style.marginLeft=='0px'){
        innerList.style.marginLeft = '-1000px';
      }
      else if(innerList.style.marginLeft=='-1000px'){
        innerList.style.marginLeft = '-2000px';
      }
      else if(innerList.style.marginLeft=='-2000px'){
        innerList.style.marginLeft = '0px';
      }
    });
}